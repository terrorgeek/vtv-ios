//
//  SimilarShowBarView.m
//  ngb-ipad
//
//  Created by Julian Król on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SimilarShowBarView.h"

@interface SimilarShowBarView ()
@property(nonatomic, retain) UIImageView *backgroundPic;
@property(nonatomic, retain) UIButton *tuneIn;
@property(nonatomic, retain) UIButton *thumbUp;
@property(nonatomic, retain) UIButton *thumbDown;
@property(nonatomic, retain) UILabel *similarLabel;
@property(nonatomic, retain) UIImageView *similarShowsPic;
@property(nonatomic, retain) UIButton *friends;


@end

@implementation SimilarShowBarView
@synthesize similarLabel = _similarLabel;
@synthesize thumbDown = _thumbDown;
@synthesize thumbUp = _thumbUp;
@synthesize tuneIn = _tuneIn;
@synthesize backgroundPic = _backgroundPic;
@synthesize similarShowsPic = _similarShowsPic;
@synthesize friends = _friends;


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self initBackground];
    [self initButtons];
    [self initLabels];
    [self initPicSimilar];
  }
  return self;
}


- (void)initBackground {
  self.backgroundPic = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 768, 100)] autorelease];
  self.backgroundPic.image = [UIImage imageNamed:@"featured_black_background.png"];
  [self addSubview:self.backgroundPic];
}


- (void)initButtons {
  self.tuneIn = [[[UIButton alloc] initWithFrame:CGRectMake(25, 39, 50, 26)] autorelease];
  [self.tuneIn setImage:[UIImage imageNamed:@"dashboard_icon_watch.png"] forState:UIControlStateNormal];
  [self.tuneIn addTarget:self action:@selector(tuneInAction) forControlEvents:UIControlEventTouchUpInside];
  self.tuneIn.backgroundColor = [UIColor clearColor];
  [self addSubview:self.tuneIn];

  self.thumbUp = [[[UIButton alloc] initWithFrame:CGRectMake(80, 35, 30, 35)] autorelease];
  [self.thumbUp setImage:[UIImage imageNamed:@"dashboard_thumb_up.png"] forState:UIControlStateNormal];
  [self.thumbUp addTarget:self action:@selector(thumbUpAction) forControlEvents:UIControlEventTouchUpInside];
  self.backgroundColor = [UIColor clearColor];
  [self addSubview:self.thumbUp];

  self.thumbDown = [[[UIButton alloc] initWithFrame:CGRectMake(115, 35, 30, 35)] autorelease];
  [self.thumbDown setImage:[UIImage imageNamed:@"dashboard_thumb_down.png"] forState:UIControlStateNormal];
  [self.thumbDown addTarget:self action:@selector(thumbDownAction) forControlEvents:UIControlEventTouchUpInside];
  self.backgroundColor = [UIColor clearColor];
  [self addSubview:self.thumbDown];

  self.friends = [[[UIButton alloc] initWithFrame:CGRectMake(150, 35, 50, 35)] autorelease];
  [self.friends setImage:[UIImage imageNamed:@"dashboard_invite_friends.png"] forState:UIControlStateNormal];
  [self.friends addTarget:self action:@selector(friendsAction) forControlEvents:UIControlEventTouchUpInside];
  self.backgroundColor = [UIColor clearColor];
  [self addSubview:self.friends];
}


- (void)initLabels {
  self.similarLabel = [[[UILabel alloc] initWithFrame:CGRectMake(300, 40, 120, 24)] autorelease];
  self.similarLabel.backgroundColor = [UIColor clearColor];
  self.similarLabel.font = [UIFont systemFontOfSize:18];
  self.similarLabel.text = NSLocalizedString(@"similar.shows.dots", nil);
  self.similarLabel.textColor = [UIColor whiteColor];
  [self addSubview:self.similarLabel];
}


- (void)initPicSimilar {
  self.similarShowsPic = [[[UIImageView alloc] initWithFrame:CGRectMake(440, 20, 288, 75)] autorelease];
  self.similarShowsPic.image = [UIImage imageNamed:@"program_info_similar_shows.png"];
  [self addSubview:self.similarShowsPic];
}


- (void)thumbUpAction {
  [WToast showWithText:NSLocalizedString(@"dashboard.thumbUp", nil) length:kWTShort];
}


- (void)thumbDownAction {
  [WToast showWithText:NSLocalizedString(@"dashboard.thumbDown", nil) length:kWTShort];
}


- (void)tuneInAction {
  [WToast showWithText:NSLocalizedString(@"tuned.in", nil) length:kWTShort];
}


- (void)friendsAction {
  [self.window.rootViewController.view addSubview:[PopupInviteFriends instance]];
}


- (void)dealloc {
  [_similarLabel release];
  [_thumbDown release];
  [_thumbUp release];
  [_tuneIn release];
  [_backgroundPic release];
  [_similarShowsPic release];
  [_friends release];
  [super dealloc];
}


@end
