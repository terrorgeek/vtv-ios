//
//  DashBoardViewController.m
//  ngb-ipad
//
//  Created by Julian Król on 9/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DashBoardViewController.h"

@interface DashBoardViewController ()
@property(nonatomic) BOOL onceExecutedFlag;


@end

@implementation DashBoardViewController
@synthesize onceExecutedFlag = _onceExecutedFlag;


- (id)init {
  self = [super init];
  if (self) {
  }
  return self;
}

- (void)loadView {
  [super loadView];
}


#pragma mark - Panels creation
- (BaseLeftPanelViewController *)createLeftPanel {
  DashboardLeftPanelViewController *leftPanelVC = [[[DashboardLeftPanelViewController alloc] init] autorelease];
  leftPanelVC.parentVC = self;
  return leftPanelVC;
}


- (BaseTopPanelViewController *)createTopPanel {
  DashboardTopPanelViewController *topPanelVC = [[[DashboardTopPanelViewController alloc] init] autorelease];
  topPanelVC.parentVC = self;
  return topPanelVC;
}


- (BaseBottomPanelViewController *)createBottomPanel {
  DashBoardBottomPanelViewController *bottomPanelVC = [[[DashBoardBottomPanelViewController alloc] init] autorelease];
  bottomPanelVC.parentVC = self;
  return bottomPanelVC;
}


- (void)viewDidLoad {
  [super viewDidLoad];
  [self logIn];
}


- (void)viewDidUnload {
  [super viewDidUnload];
}


- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [[(DashboardLeftPanelViewController *) self.leftPanel youAreWatchingView].programNameButton addTarget:self action:@selector(goToProgramInfo) forControlEvents:UIControlEventTouchUpInside];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
  [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}


#pragma mark - Buttons actions
- (IBAction)goToProgramInfo {
  [self.tabBarController setSelectedIndex:1];
}


#pragma mark -  remote data client
- (void)logIn {
  LogInRequest *request = [[LogInRequest alloc] init];
  [[RemoteDataClient instance] logIn:request withDelegate:self];
  [request release];
}


- (void)onError:(ErrorResponse *)error {
  NSLog(@"program info err msg: %@, %@ failed.", error.errorMessage, error.whatFailed);
  if (error.errorTag == 100) {
    NSLog(@"logging failed");
    UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"alert", nil) message:NSLocalizedString(@"log.in.failed", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"cancel", nil) otherButtonTitles:NSLocalizedString(@"reload", nil), nil] autorelease];
    [alertView show];
  }
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  if (buttonIndex == 1) {
    [self logIn];
  }
}


- (void)onGetLoginSuccess:(LogInResponse *)response {
  NSLog(@"login success");
  [[ConfigurationManager instance] setSessionId:response.idStr];
  [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SESSION_OBTAINED object:nil];
  [NSTimer scheduledTimerWithTimeInterval:RELOAD_PROFILE_INFO target:self selector:@selector(reloadProfileInfo) userInfo:nil repeats:YES];
}


- (void)loadFutureProgram {
  GetProgramsOnChannelGuideOnTimeRequest *request = [[GetProgramsOnChannelGuideOnTimeRequest alloc] init];
  NSDate *date = [NSDate date];
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"YYYY-MM-dd+HH:mm:ss"];
  date = [date dateByAddingTimeInterval:3600];
  request.startTimeStr = [dateFormatter stringFromDate:date];
  date = [date dateByAddingTimeInterval:10800];
  request.endTimeStr = [dateFormatter stringFromDate:date];
  request.channel_id = NSLocalizedString(@"channel.id.for.schedule", nil);
  [[RemoteDataClient instance] getProgramOnChannelInGuideForTime:request withDelegate:self];
  [dateFormatter release];
  [request release];
}


- (void)reloadProfileInfo {
  GetProfileRequest *request = [[GetProfileRequest alloc] init];
  [[RemoteDataClient instance] getProfileDetails:request withDelegate:self];
  [request release];
}


- (void)onGetProfileSuccess:(GetProfileResponse *)response {
  [[ConfigurationManager instance] setUpProfileID:response.id];
  [self loadFutureProgram];
  NSLog(@"new currently watching id: %@", response.current_channel_id);
  NSLog(@"old currently watching id: %@", [[ConfigurationManager instance] getCurrentChannelID]);
  if (response.current_channel_id != nil && ![response.current_channel_id isEqualToString:[[ConfigurationManager instance] getCurrentChannelID]]) {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    GetProgramOnChannelRequest *request = [[GetProgramOnChannelRequest alloc] init];
    request.channelID = response.current_channel_id;
    [[ConfigurationManager instance] setUpCurrentChannelID:response.current_channel_id];
    [self loadProgram];
    [request release];
  }
  if (!self.onceExecutedFlag) {
    [NSTimer scheduledTimerWithTimeInterval:NOTIFICATIONS_TIME_INTERVAL target:self selector:@selector(checkNotifications) userInfo:nil repeats:YES];
    self.onceExecutedFlag = YES;
    GetFriendsRequest *request = [[GetFriendsRequest alloc] init];
    [[RemoteDataClient instance] getFriendsForProfile:request withDelegate:self];
    [request release];
  }
}


- (void)checkNotifications {
  GetNotificationsRequest *request = [[GetNotificationsRequest alloc] init];
  [[RemoteDataClient instance] getNotifications:request withDelegate:self];
  [request release];
}


- (void)onGetNotificationsSuccess:(GetNotificationsResponse *)response {
  if (response.notificationsArray != nil) {
    [[NotificationsManager instance] setNotificationsArray:response.notificationsArray];
    for (Notification *notification in response.notificationsArray) {

    }
  }
}


- (void)loadProgram {
  GetProgramOnChannelRequest *request = [[GetProgramOnChannelRequest alloc] init];
  request.channelID = [[ConfigurationManager instance] getCurrentChannelID];
  if (request.channelID != nil)
    [[RemoteDataClient instance] getProgramOnChannel:request withDelegate:self];
  [request release];
}


- (void)onGetProgramOnChannelSuccess:(GetProgramOnChannelResponse *)response {
  [[ConfigurationManager instance] setUpCurrentlyWatchingProgram:response.program];
  [((DashboardLeftPanelViewController *) self.leftPanel).youAreWatchingView changeWatchingProgramName:response.program.name];
  NSRange range = [response.program.name rangeOfString:NSLocalizedString(@"expression.to.compare", nil)];
  if (range.location != NSNotFound)
    [((DashboardLeftPanelViewController *) self.leftPanel).youAreWatchingView.actualWatchedProgram.programImageView setImage:[UIImage imageNamed:NSLocalizedString(@"icon.for.program.if.expression.true", nil)]];
  else
    [((DashboardLeftPanelViewController *) self.leftPanel).youAreWatchingView.actualWatchedProgram.programImageView setImage:[UIImage imageNamed:NSLocalizedString(@"icon.for.program.if.expression.false", nil)]];
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}


- (void)onGetFriendsSuccess:(GetFriendsResponse *)response {
  [(DashboardLeftPanelViewController *) self.leftPanel youAreWatchingView].popup.friendsArray = response.friendsArray;
  [[(DashboardLeftPanelViewController *) self.leftPanel youAreWatchingView].popup fillWithFriends];
}


- (void)onGetProgramOnChannelInGuideOnTimeSuccess:(GetProgramsOnChannelGuideOnTimeResponse *)response {
  [self getProgramInfo:response.program_id];
  ((DashboardTopPanelViewController *) self.topPanel).guide_id = response.guide_id;
  [[ScheduleData instance] setUpStartTime:response.startTime];
  [[ScheduleData instance] setUpEndTime:response.endTime];
  [((DashboardTopPanelViewController *) self.topPanel) setStartTime:[self trimTimeString:response.startTime] andEndTime:[self trimTimeString:response.endTime]];
}

- (NSString *)trimTimeString:(NSString *)timeStr {
  return [timeStr substringWithRange:NSMakeRange(11, 5)];
}


- (void)getProgramInfo:(NSString *)program_id {
  GetProgramRequest *request = [[GetProgramRequest alloc] init];
  request.program_id = program_id;
  [[RemoteDataClient instance] getProgramInfo:request withDelegate:self];
  [request release];
}


- (void)onGetProgramSuccess:(GetProgramResponse *)response {
  [((DashboardTopPanelViewController *) self.topPanel) update:response.program];
}


#pragma mark - adding event to bottom bar
- (void)addEventToUpcomingShows:(Program *)program {
  [((DashBoardBottomPanelViewController *) self.bottomPanel) addEventToUpcomingShows:program];
}


@end
