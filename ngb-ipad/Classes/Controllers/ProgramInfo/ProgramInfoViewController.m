//
//  ProgramInfoViewController.m
//  ngb-ipad
//
//  Created by Julian Król on 9/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProgramInfoViewController.h"

@interface ProgramInfoViewController ()

@end

@implementation ProgramInfoViewController
@synthesize oldProgram = _oldProgram;


- (id)init {
  self = [super init];
  if (self) {
  }
  return self;
}


- (void)viewDidLoad {
  [super viewDidLoad];
  [NSTimer scheduledTimerWithTimeInterval:CHECKING_PROGRAM_TIME_INTERVAL target:self selector:@selector(checkWatchingProgram) userInfo:nil repeats:YES];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideLoader:) name:NOTIFICATION_HIDE_POSTER_LOADER object:nil];
}


- (void)viewDidUnload {
  [super viewDidUnload];
}


- (BaseBottomPanelViewController *)createBottomPanel {
  ProgramInfoBottomPanelViewController *bottomPanelVC = [[[ProgramInfoBottomPanelViewController alloc] init] autorelease];
  bottomPanelVC.parentVC = self;
  return bottomPanelVC;
}

- (BaseTopPanelViewController *)createTopPanel {
  ProgramInfoTopPanelViewController *topPanelVC = [[[ProgramInfoTopPanelViewController alloc] init] autorelease];
  topPanelVC.parentVC = self;
  return topPanelVC;
}


- (BaseLeftPanelViewController *)createLeftPanel {
  ProgramInfoLeftPanelViewController *leftPanelVC = [[[ProgramInfoLeftPanelViewController alloc] init] autorelease];
  leftPanelVC.parentVC = self;
  return leftPanelVC;
}


- (void)checkWatchingProgram {
  if (![self.oldProgram.id isEqualToString:[[ConfigurationManager instance] getCurrentlyWatchingProgram].id] && [[ConfigurationManager instance] getCurrentlyWatchingProgram] != nil) {
    NSLog(@"prog info: PROGRAM CHANGED!");
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.oldProgram = [[ConfigurationManager instance] getCurrentlyWatchingProgram];
    [self updateComponents:[[ConfigurationManager instance] getCurrentlyWatchingProgram]];
    ((ProgramInfoLeftPanelViewController *) self.leftPanel).programDescription.text = [[ConfigurationManager instance] getCurrentlyWatchingProgram].description;
    if (![[[ConfigurationManager instance] getCurrentlyWatchingProgram].poster_id isEqualToString:@""])
      [self changePosterPic:[[ConfigurationManager instance] getCurrentlyWatchingProgram].poster_id];
    //[self setMockPoster:[[ConfigurationManager instance] getCurrentChannelID]];
    if ([[ConfigurationManager instance] getCurrentlyWatchingProgram].id != nil) {
      GetActorsForProgramRequest *request = [[GetActorsForProgramRequest alloc] init];
      request.programId = [[ConfigurationManager instance] getCurrentlyWatchingProgram].id;
      [[RemoteDataClient instance] getActorsForProgram:request withDelegate:self];
      [request release];
    }
  }
}

- (void)setMockPoster:(NSString *)channelID {
  if ([channelID isEqualToString:@"506c49f0-2431-d88b-1524-cd12e2374ee0"]) {
    ((ProgramInfoTopPanelViewController *) self.topPanel).posterPic.image = [UIImage imageNamed:@"mentalist.jpg"];
  } else if ([channelID isEqualToString:@"506c49f0-af3d-5af4-b90b-2e0c1aa56f5b"]) {
    ((ProgramInfoTopPanelViewController *) self.topPanel).posterPic.image = [UIImage imageNamed:@"NCIS.jpg"];
  }
}


- (void)changePosterPic:(NSString *)posterID {
  [MBProgressHUD showHUDAddedTo:((ProgramInfoTopPanelViewController *) self.topPanel).view animated:YES];
  NSString *pathToPoster = [NSString stringWithFormat:@"%@%@?width=768", API_IMAGES_SERVER, posterID];
  [((ProgramInfoTopPanelViewController *) self.topPanel).posterPic setPathToNetworkImage:pathToPoster
                                                                          forDisplaySize:CGSizeMake(768, 355)
                                                                             contentMode:UIViewContentModeScaleAspectFill];
}


- (void)hideLoader:(NSNotification *)notification {
  [MBProgressHUD hideAllHUDsForView:((ProgramInfoTopPanelViewController *) self.topPanel).view animated:YES];
}


- (void)updateComponents:(Program *)program {
  self.title = program.name;
  [[self.tabBarController.tabBar.items objectAtIndex:1] setTitle:NSLocalizedString(@"tab.programInfo", nil)];
  [((ProgramInfoBottomPanelViewController *) self.bottomPanel) setUpSeasonLabelText:program.seasonNumber :program.episodeNumber];
  if (program.trivia == nil)
    [((ProgramInfoBottomPanelViewController *) self.bottomPanel) setUpTriviaText:program.description];
  else
    [((ProgramInfoBottomPanelViewController *) self.bottomPanel) setUpTriviaText:program.trivia];
  ((ProgramInfoBottomPanelViewController *) self.bottomPanel).episodeNameLabel.text = program.episodeName;
  if ([program.seasonNumber isEqualToString:@"2"] && [program.episodeNumber isEqualToString:@"6"]) {
    ((ProgramInfoLeftPanelViewController *) self.leftPanel).synopsisImage.image = [UIImage imageNamed:@"ipad-season2episode6.png"];
  } else if ([program.seasonNumber isEqualToString:@"2"] && [program.episodeNumber isEqualToString:@"8"]) {
    ((ProgramInfoLeftPanelViewController *) self.leftPanel).synopsisImage.image = [UIImage imageNamed:@"ipad-season2episode8.png"];
  } else if ([program.seasonNumber isEqualToString:@"2"] && [program.episodeNumber isEqualToString:@"10"]) {
    ((ProgramInfoLeftPanelViewController *) self.leftPanel).synopsisImage.image = [UIImage imageNamed:@"ipad-season2episode10.png"];
  } else if ([program.seasonNumber isEqualToString:@"3"] && [program.episodeNumber isEqualToString:@"5"]) {
    ((ProgramInfoLeftPanelViewController *) self.leftPanel).synopsisImage.image = [UIImage imageNamed:@"ipad-season3episode5.png"];
  } else {
    ((ProgramInfoLeftPanelViewController *) self.leftPanel).synopsisImage.image = [UIImage imageNamed:@"program_info_synopsis.png"];
  }
  [((ProgramInfoLeftPanelViewController *) self.leftPanel) update:program];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - remote data client
- (void)onGetActorsForProgramSuccess:(GetActorsForProgramResponse *)response {
  [((ProgramInfoBottomPanelViewController *) self.bottomPanel) setActorsThumbnailsView:response.actorsArray];
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}


- (void)onError:(ErrorResponse *)error {
  NSLog(@"program info err msg: %@, %@ failed.", error.errorMessage, error.whatFailed);
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)dealloc {
  [_oldProgram release];
  [super dealloc];
}


@end
