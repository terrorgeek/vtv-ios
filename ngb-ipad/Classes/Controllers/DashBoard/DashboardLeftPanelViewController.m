/*
 * DashboardLeftPanel
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "DashboardLeftPanelViewController.h"


@implementation DashboardLeftPanelViewController {
}
@synthesize youAreWatchingLabel = _youAreWatchingLabel;
@synthesize youAreWatchingDivider = _youAreWatchingDivider;
@synthesize youAreWatchingView = _youAreWatchingView;
@synthesize upcomingLabel = _upcomingLabel;
@synthesize upcomingDivider = _upcomingDivider;
@synthesize upcomingMockUp1 = _upcomingMockUp1;
@synthesize upcomingMockUp2 = _upcomingMockUp2;
@synthesize wallView = _wallView;
@synthesize upcomingScrollView = _upcomingScrollView;
@synthesize upcomingContentView = _upcomingContentView;
@synthesize upcomingMockUp3 = _upcomingMockUp3;
@synthesize upcomingMockUp4 = _upcomingMockUp4;


- (void)loadView {
  [super loadView];
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_left.png"]];

  self.youAreWatchingLabel = [[[UILabel alloc] initWithFrame:CGRectMake(25, 20, 250, 22)] autorelease];
  [self.youAreWatchingLabel setText:NSLocalizedString(@"dashborad.youAreWatching", nil)];
  [self.youAreWatchingLabel setFont:[Fonts fontWithSize20]];
  [self.youAreWatchingLabel setTextAlignment:UITextAlignmentLeft];
  [self.youAreWatchingLabel setTextColor:[Colors blackColor]];
  [self.youAreWatchingLabel setBackgroundColor:[UIColor clearColor]];
  [self.view addSubview:self.youAreWatchingLabel];

  self.youAreWatchingDivider = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dashboard_header_line.png"]] autorelease];
  [self.youAreWatchingDivider setFrame:CGRectMake(25, 50, 235, 2)];
  [self.view addSubview:self.youAreWatchingDivider];

  self.youAreWatchingView = [[[YouAreWatchingView alloc] initWithFrame:CGRectMake(25, 60, 235, 88)] autorelease];
  [self.view addSubview:self.youAreWatchingView];

  self.upcomingLabel = [[[UILabel alloc] initWithFrame:CGRectMake(25, 160, 235, 22)] autorelease];
  [self.upcomingLabel setText:NSLocalizedString(@"dashboard.your.upcoming", nil)];
  [self.upcomingLabel setFont:[Fonts fontWithSize20]];
  [self.upcomingLabel setTextAlignment:UITextAlignmentLeft];
  [self.upcomingLabel setTextColor:[Colors blackColor]];
  [self.upcomingLabel setBackgroundColor:[UIColor clearColor]];
  [self.view addSubview:self.upcomingLabel];

  self.upcomingDivider = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dashboard_header_line.png"]] autorelease];
  [self.upcomingDivider setFrame:CGRectMake(25, 185, 235, 2)];
  [self.view addSubview:self.upcomingDivider];

  self.upcomingScrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(25, 197, 235, 186)] autorelease];
  self.upcomingContentView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 235, 382)] autorelease];

  self.upcomingMockUp1 = [[[UpcommingShowViewWide alloc] initWithFrame:CGRectMake(0, 0, 235, 88)] autorelease];
  [self.upcomingMockUp1.showImageView setImage:[UIImage imageNamed:@"dashboard_true.png"]];
  [self.upcomingMockUp1.showNameLabel setText:@"True Blood"];
  [self.upcomingMockUp1.showDate setText:@"Sat 11:00pm - 12:00pm"];
  [self.upcomingContentView addSubview:self.upcomingMockUp1];

  self.upcomingMockUp2 = [[[UpcommingShowViewWide alloc] initWithFrame:CGRectMake(0, 98, 235, 88)] autorelease];
  [self.upcomingMockUp2.showImageView setImage:[UIImage imageNamed:@"dashboard_diary.png"]];
  [self.upcomingMockUp2.showNameLabel setText:@"Vampire Diares"];
  [self.upcomingMockUp2.showDate setText:@"Thu 8:00pm - 9:00pm"];
  [self.upcomingContentView addSubview:self.upcomingMockUp2];

  self.upcomingMockUp3 = [[[UpcommingShowViewWide alloc] initWithFrame:CGRectMake(0, 196, 235, 88)] autorelease];
  [self.upcomingMockUp3.showImageView setImage:[UIImage imageNamed:@"dashboard_true.png"]];
  [self.upcomingMockUp3.showNameLabel setText:@"True Blood"];
  [self.upcomingMockUp3.showDate setText:@"Sat 11:00pm - 12:00pm"];
  [self.upcomingContentView addSubview:self.upcomingMockUp3];


  self.upcomingMockUp4 = [[[UpcommingShowViewWide alloc] initWithFrame:CGRectMake(0, 294, 235, 88)] autorelease];
  [self.upcomingMockUp4.showImageView setImage:[UIImage imageNamed:@"dashboard_diary.png"]];
  [self.upcomingMockUp4.showNameLabel setText:@"Vampire Diares"];
  [self.upcomingMockUp4.showDate setText:@"Thu 8:00pm - 9:00pm"];
  [self.upcomingContentView addSubview:self.upcomingMockUp4];

  [self.upcomingScrollView setContentSize:self.upcomingContentView.frame.size];
  [self.upcomingScrollView addSubview:self.upcomingContentView];
  [self.view addSubview:self.upcomingScrollView];

  self.wallView = [[[WallView alloc] initWithFrame:CGRectMake(25, 393, 235, 230)] autorelease];
  [self.view addSubview:self.wallView];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
  [self rotate];
}


- (void)rotate {
  if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft) ||
      ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)) {
    [self.upcomingLabel setHidden:NO];
    [self.upcomingDivider setHidden:NO];
    [self.upcomingScrollView setHidden:NO];
    self.wallView.frame = CGRectMake(25, 393, 235, 270);
    self.wallView.scrollView.frame = CGRectMake(0, self.wallView.scrollView.frame.origin.y, 235, 270);
    self.youAreWatchingView.popup.popupWithoutBlack.frame = CGRectMake(280, 130, self.youAreWatchingView.popup.frame.size.width, self.youAreWatchingView.popup.frame.size.height);
  } else {
    [self.upcomingLabel setHidden:YES];
    [self.upcomingDivider setHidden:YES];
    [self.upcomingScrollView setHidden:YES];
    self.wallView.frame = CGRectMake(25, 160, 235, 400);
    self.wallView.scrollView.frame = CGRectMake(0, self.wallView.scrollView.frame.origin.y, 235, 400);
    self.youAreWatchingView.popup.popupWithoutBlack.frame = CGRectMake(130, 385, self.youAreWatchingView.popup.frame.size.width, self.youAreWatchingView.popup.frame.size.height);
  }
}


- (void)dealloc {
  [_youAreWatchingLabel release];
  [_youAreWatchingDivider release];
  [_youAreWatchingView release];
  [_upcomingLabel release];
  [_upcomingDivider release];
  [_upcomingMockUp1 release];
  [_upcomingMockUp2 release];
  [_wallView release];
  [_upcomingScrollView release];
  [_upcomingContentView release];
  [_upcomingMockUp3 release];
  [_upcomingMockUp4 release];
  [super dealloc];
}

@end