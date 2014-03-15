//
//  FriendsTopPanelViewController.m
//  ngb-ipad
//
//  Created by Julian Król on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendsTopPanelViewController.h"

@interface FriendsTopPanelViewController ()
@property(nonatomic, retain) UIButton *friends;
@property(nonatomic, retain) UIButton *thumbUp;
@property(nonatomic, retain) UIButton *thumbDown;
@property(nonatomic, retain) UIButton *calendar;
@property(nonatomic, retain) UIButton *tuneIn;
@property(nonatomic, retain) UIButton *readMore;
@property(nonatomic, retain) UIButton *heLikes;
@property(nonatomic, retain) UIButton *inCommon;
@property(nonatomic) BOOL isCommonSelected;
@property(nonatomic) BOOL isHeLikesSelected;
@property(nonatomic, retain) UILabel *showLabel;
@property(nonatomic, retain) UILabel *friendNameLabel;


@end

@implementation FriendsTopPanelViewController
@synthesize friends = _friends;
@synthesize thumbUp = _thumbUp;
@synthesize thumbDown = _thumbDown;
@synthesize calendar = _calendar;
@synthesize tuneIn = _tuneIn;
@synthesize readMore = _readMore;
@synthesize heLikes = _heLikes;
@synthesize inCommon = _inCommon;
@synthesize isCommonSelected = _isCommonSelected;
@synthesize isHeLikesSelected = _isHeLikesSelected;
@synthesize showLabel = _showLabel;
@synthesize friendNameLabel = _friendNameLabel;


- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"friends_featured.png"]];
  [self initializeButtons];
  [self changeInCommon];
  [self initializeLabels];
}


- (void)initializeButtons {
  self.friends = [[[UIButton alloc] initWithFrame:CGRectMake(450, 280, 45, 40)] autorelease];
  [self.friends setImage:[UIImage imageNamed:@"dashboard_invite_friends.png"] forState:UIControlStateNormal];
  [self.friends addTarget:self action:@selector(friendsAction) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.friends];

  self.tuneIn = [[[UIButton alloc] initWithFrame:CGRectMake(510, 287, 45, 26)] autorelease];
  [self.tuneIn setImage:[UIImage imageNamed:@"dashboard_icon_watch.png"] forState:UIControlStateNormal];
  [self.tuneIn addTarget:self action:@selector(tuneInAction) forControlEvents:UIControlEventTouchUpInside];
  self.tuneIn.backgroundColor = [UIColor clearColor];
  [self.view addSubview:self.tuneIn];

  self.calendar = [[[UIButton alloc] initWithFrame:CGRectMake(570, 287, 45, 26)] autorelease];
  [self.calendar setImage:[UIImage imageNamed:@"dashboard_icon_calendar.png"] forState:UIControlStateNormal];
  [self.calendar addTarget:self action:@selector(calendarAction) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.calendar];

  self.thumbUp = [[[UIButton alloc] initWithFrame:CGRectMake(660, 280, 30, 40)] autorelease];
  [self.thumbUp setImage:[UIImage imageNamed:@"dashboard_thumb_up.png"] forState:UIControlStateNormal];
  [self.thumbUp addTarget:self action:@selector(thumbUpAction) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.thumbUp];

  self.thumbDown = [[[UIButton alloc] initWithFrame:CGRectMake(700, 280, 30, 40)] autorelease];
  [self.thumbDown setImage:[UIImage imageNamed:@"dashboard_thumb_down.png"] forState:UIControlStateNormal];
  [self.thumbDown addTarget:self action:@selector(thumbDownAction) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.thumbDown];

  self.readMore = [[[UIButton alloc] initWithFrame:CGRectMake(330, 180, 80, 30)] autorelease];
  [self.readMore setBackgroundImage:[UIImage imageNamed:@"popup_green_button.png"] forState:UIControlStateNormal];
  self.readMore.titleLabel.font = [UIFont systemFontOfSize:10];
  [self.readMore setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [self.readMore setTitle:NSLocalizedString(@"read.more", nil) forState:UIControlStateNormal];
  [self.view addSubview:self.readMore];

  self.heLikes = [[[UIButton alloc] initWithFrame:CGRectMake(30, 80, 120, 32)] autorelease];
  [self.heLikes setBackgroundImage:[UIImage imageNamed:@"tab_left.png"] forState:UIControlStateNormal];
  [self.heLikes addTarget:self action:@selector(changeHeLikes) forControlEvents:UIControlEventTouchUpInside];
  [self.heLikes setTitle:NSLocalizedString(@"he.likes", nil) forState:UIControlStateNormal];
  self.heLikes.titleLabel.font = [UIFont systemFontOfSize:14];
  [self.view addSubview:self.heLikes];

  self.inCommon = [[[UIButton alloc] initWithFrame:CGRectMake(150, 80, 120, 32)] autorelease];
  [self.inCommon setBackgroundImage:[UIImage imageNamed:@"tab_right.png"] forState:UIControlStateNormal];
  [self.inCommon setTitle:NSLocalizedString(@"in.common", nil) forState:UIControlStateNormal];
  [self.inCommon addTarget:self action:@selector(changeInCommon) forControlEvents:UIControlEventTouchUpInside];
  self.inCommon.titleLabel.font = [UIFont systemFontOfSize:14];
  [self.view addSubview:self.inCommon];
}


- (void)initializeLabels {
  self.showLabel = [[[UILabel alloc] initWithFrame:CGRectMake(30, 30, 120, 30)] autorelease];
  self.showLabel.backgroundColor = [UIColor clearColor];
  self.showLabel.font = [UIFont systemFontOfSize:20];
  self.showLabel.text = NSLocalizedString(@"shows", nil);
  self.showLabel.textColor = [UIColor whiteColor];
  [self.view addSubview:self.showLabel];

  self.friendNameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(330, 30, 300, 30)] autorelease];
  self.friendNameLabel.backgroundColor = [UIColor clearColor];
  self.friendNameLabel.textColor = [UIColor whiteColor];
  self.friendNameLabel.font = [UIFont systemFontOfSize:20];
  [self.view addSubview:self.friendNameLabel];
}


- (void)friendsAction {
  [self.view.window.rootViewController.view addSubview:[PopupInviteFriends instance]];
}


- (void)tuneInAction {
  [WToast showWithText:NSLocalizedString(@"tuned.in", nil) length:kWTShort];
}


- (void)calendarAction {
  [WToast showWithText:NSLocalizedString(@"added.to.calendar", nil) length:kWTShort];
}


- (void)thumbUpAction {
  [WToast showWithText:NSLocalizedString(@"dashboard.thumbUp", nil) length:kWTShort];
}


- (void)thumbDownAction {
  [WToast showWithText:NSLocalizedString(@"dashboard.thumbDown", nil) length:kWTShort];
}


- (void)changeHeLikes {
  if (!self.isHeLikesSelected) {
    self.isHeLikesSelected = YES;
    self.isCommonSelected = NO;
    [self.inCommon setBackgroundImage:[UIImage imageNamed:@"tab_right.png"] forState:UIControlStateNormal];
    [self.heLikes setBackgroundImage:[UIImage imageNamed:@"tab_left_selected.png"] forState:UIControlStateNormal];
  }
}


- (void)changeInCommon {
  if (!self.isCommonSelected) {
    self.isCommonSelected = YES;
    self.isHeLikesSelected = NO;
    [self.heLikes setBackgroundImage:[UIImage imageNamed:@"tab_left.png"] forState:UIControlStateNormal];
    [self.inCommon setBackgroundImage:[UIImage imageNamed:@"tab_right_selected.png"] forState:UIControlStateNormal];
  }
}


#pragma mark - friends protocol
- (void)changeFriendWatchingLabel:(NSString *)friendName {
  self.friendNameLabel.text = [NSString stringWithFormat:@"%@ %@", friendName, NSLocalizedString(@"is.watching", nil)];
}


- (void)dealloc {
  [_friends release];
  [_thumbUp release];
  [_thumbDown release];
  [_calendar release];
  [_tuneIn release];
  [_readMore release];
  [_heLikes release];
  [_inCommon release];
  [_showLabel release];
  [_friendNameLabel release];
  [super dealloc];
}


@end
