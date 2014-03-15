/*
 * DashBoardBottomPanelViewController
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "DashBoardBottomPanelViewController.h"


@interface DashBoardBottomPanelViewController ()
@property(nonatomic, retain) UpcommingShowView *upcomingShow2;
@property(nonatomic, retain) UILabel *showsLabel;
@property(nonatomic, retain) ShowsControl *showsChooser;
@property(nonatomic, retain) UIImageView *greenDivider;
@property(nonatomic, retain) UIImageView *grayDivider;
@property(nonatomic, retain) ShowsView *showsView;
@property(nonatomic, retain) UILabel *upComingLabel;
@property(nonatomic, retain) UIImageView *upcomingDivider;
@property(nonatomic, retain) UIScrollView *upcomingScrollView;
@property(nonatomic, retain) UpcommingShowView *upcomingShow1;
@end

@implementation DashBoardBottomPanelViewController {

}
@synthesize showsLabel = _showsLabel;
@synthesize showsChooser = _showsChooser;
@synthesize greenDivider = _greenDivider;
@synthesize grayDivider = _grayDivider;
@synthesize showsView = _showsView;
@synthesize upComingLabel = _upComingLabel;
@synthesize upcomingDivider = _upcomingDivider;
@synthesize upcomingShow1 = _upcomingShow1;
@synthesize upcomingShow2 = _upcomingShow2;
@synthesize upcomingScrollView = _upcomingScrollView;


- (void)loadView {
  [super loadView];
  [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];


  self.showsLabel = [[[UILabel alloc] initWithFrame:CGRectMake(25, 20, 692, 20)] autorelease];
  [self.showsLabel setText:NSLocalizedString(@"dashborad.shows", nil)];
  [self.showsLabel setTextAlignment:UITextAlignmentLeft];
  [self.showsLabel setTextColor:[Colors blackColor]];
  [self.showsLabel setFont:[Fonts fontWithSize20]];
  [self.showsLabel setBackgroundColor:[UIColor clearColor]];
  [self.view addSubview:self.showsLabel];

  self.greenDivider = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dashboard_header_line.png"]] autorelease];
  [self.greenDivider setFrame:CGRectMake(25, 45, 692, 2)];
  [self.view addSubview:self.greenDivider];

  self.showsChooser = [[[ShowsControl alloc] initWithFrame:CGRectMake(25, 63, 692, 30)
                                              andFirstName:NSLocalizedString(@"dashborad.segmentedControll.popular", nil) second:NSLocalizedString(@"dashborad.segmentedControll.youMightLike", nil) third:NSLocalizedString(@"dashborad.segmentedControll.onAir", nil)] autorelease];
  for (UIButton *but in self.showsChooser.arrayOfButtons) {
    [but addTarget:self action:@selector(reloadShows:) forControlEvents:UIControlEventTouchUpInside];
  }
  [self.view addSubview:self.showsChooser];

  self.grayDivider = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"program_info_list_divider.png"]] autorelease];
  [self.grayDivider setFrame:CGRectMake(25, 105, 692, 2)];
  [self.view addSubview:self.grayDivider];

  self.showsView = [[[ShowsView alloc] initWithFrame:CGRectMake(25, 120, 692, 200)] autorelease];
  [self.view addSubview:self.showsView];

  self.upComingLabel = [[[UILabel alloc] initWithFrame:CGRectMake(25, 20, 435, 22)] autorelease];
  [self.upComingLabel setText:NSLocalizedString(@"dashboard.your.upcoming", nil)];
  [self.upComingLabel setTextAlignment:UITextAlignmentLeft];
  [self.upComingLabel setTextColor:[Colors blackColor]];
  [self.upComingLabel setFont:[Fonts fontWithSize20]];
  [self.upComingLabel setBackgroundColor:[UIColor clearColor]];
  [self.view addSubview:self.upComingLabel];

  self.upcomingDivider = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dashboard_header_line.png"]] autorelease];
  [self.upcomingDivider setFrame:CGRectMake(25, 45, 435, 2)];
  [self.view addSubview:self.upcomingDivider];

  [self initializeUpcomingComponent:2];
}

- (void)initializeUpcomingComponent:(int)numberOfElements {
  self.upcomingScrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(25, 60, 435, 91)] autorelease];
  [self.upcomingScrollView setShowsHorizontalScrollIndicator:NO];
  self.upcomingScrollView.contentSize = CGSizeMake(numberOfElements * 225, 91);

  self.upcomingShow1 = [[[UpcommingShowView alloc] initWithImage:[UIImage imageNamed:@"dashboard_upcoming2.png"]] autorelease];
  [self.upcomingShow1 setFrame:CGRectMake(225 * (numberOfElements - 2), 0, 225, 91)];
  [self.upcomingScrollView addSubview:self.upcomingShow1];

  self.upcomingShow2 = [[[UpcommingShowView alloc] initWithImage:[UIImage imageNamed:@"dashboard_upcoming1.png"]] autorelease];
  [self.upcomingShow2 setFrame:CGRectMake(225 * (numberOfElements - 1), 0, 225, 91)];
  [self.upcomingScrollView addSubview:self.upcomingShow2];

  [self.view addSubview:self.upcomingScrollView];
}


- (IBAction)reloadShows:(id)sender {
  [UIView animateWithDuration:1 animations:^void() {
    [self.showsView setAlpha:0];
  }                completion:^void(BOOL animated) {
    [self.showsView reload];
  }];
  [UIView animateWithDuration:1 animations:^void() {
    [self.showsView setAlpha:1.0];
  }];
}


- (void)rotate {
  if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft) ||
      ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)) {
    // Landscape
    self.showsLabel.frame = CGRectMake(25, 20, 692, 20);
    self.greenDivider.frame = CGRectMake(25, 45, 692, 2);
    self.showsChooser.frame = CGRectMake(25, 63, 692, 30);
    self.grayDivider.frame = CGRectMake(25, 105, 692, 2);
    self.showsView.frame = CGRectMake(25, 120, 710, 220);
    self.showsView.scrollView.frame = CGRectMake(self.showsView.scrollView.frame.origin.x, self.showsView.scrollView.frame.origin.y, 692, 220);
    [self.upComingLabel setHidden:YES];
    [self.upcomingDivider setHidden:YES];
    [self.upcomingScrollView setHidden:YES];
    [self.showsView reload];
  } else {
    // Portrait
    self.showsLabel.frame = CGRectMake(25, 160, 435, 20);
    self.greenDivider.frame = CGRectMake(25, 185, 435, 2);
    self.showsChooser.frame = CGRectMake(25, 203, 435, 30);
    self.grayDivider.frame = CGRectMake(25, 245, 435, 2);
    self.showsView.frame = CGRectMake(25, 260, 435, 340);
    self.showsView.scrollView.frame = CGRectMake(self.showsView.scrollView.frame.origin.x, self.showsView.scrollView.frame.origin.y, 435, 340);
    [self.upComingLabel setHidden:NO];
    [self.upcomingDivider setHidden:NO];
    [self.upcomingScrollView setHidden:NO];
    [self.showsView reload];
  }
}


#pragma mark - adding new component to scroll view
- (void)addEventToUpcomingShows:(Program *)program {
  for (UIView *view in self.upcomingScrollView.subviews) {
    [view removeFromSuperview];
  }
  [self initializeUpcomingComponent:3];

  UIView *newEvent = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 208, 91)] autorelease];
  newEvent.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dashboard_upcoming_background.png"]];

  UILabel *showName = [[[UILabel alloc] initWithFrame:CGRectMake(70, 5, 150, 20)] autorelease];
  showName.text = program.name;
  showName.backgroundColor = [UIColor clearColor];
  showName.font = [UIFont systemFontOfSize:14];
  [newEvent addSubview:showName];

  UIButton *addFriendsButton = [[[UIButton alloc] init] autorelease];
  [addFriendsButton setFrame:CGRectMake(139, 50, 50, 25)];
  [addFriendsButton setBackgroundImage:[UIImage imageNamed:@"dashboard_invite_friends.png"] forState:UIControlStateNormal];
  [addFriendsButton addTarget:self action:@selector(onInviteButtonPressed) forControlEvents:UIControlEventTouchUpInside];
  [newEvent addSubview:addFriendsButton];

  UILabel *dateLabel = [[[UILabel alloc] initWithFrame:CGRectMake(5, 71, 200, 15)] autorelease];
  dateLabel.textColor = [UIColor darkGrayColor];
  dateLabel.font = [UIFont systemFontOfSize:10];
  dateLabel.backgroundColor = [UIColor clearColor];
  dateLabel.text = [NSString stringWithFormat:@"%@ - %@",
                                              [self getDateString:[[ScheduleData instance] getStartTime]],
                                              [[self getDateString:[[ScheduleData instance] getEndTime]] substringFromIndex:5]];
  [newEvent addSubview:dateLabel];

  UIImageView *iconImg = [[[UIImageView alloc] initWithFrame:CGRectMake(7, 7, 60, 60)] autorelease];
  iconImg.image = [UIImage imageNamed:NSLocalizedString(@"icon.for.future.program.in.schedule", nil)];
  [newEvent addSubview:iconImg];

  [self.upcomingScrollView addSubview:newEvent];
}


- (NSString *)getDateString:(NSString *)timeStr {
  NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
  [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
  NSDate *date = [formatter dateFromString:timeStr];
  [formatter setDateFormat:@"EEE hh:mm a"];
  return [formatter stringFromDate:date];
}


- (void)onInviteButtonPressed {
  [self.view.window.rootViewController.view addSubview:[PopupInviteFriends instance]];
}


- (void)dealloc {
  [_showsLabel release];
  [_showsChooser release];
  [_greenDivider release];
  [_grayDivider release];
  [_showsView release];
  [_upComingLabel release];
  [_upcomingDivider release];
  [_upcomingShow1 release];
  [_upcomingShow2 release];
  [_upcomingScrollView release];
  [super dealloc];
}


@end