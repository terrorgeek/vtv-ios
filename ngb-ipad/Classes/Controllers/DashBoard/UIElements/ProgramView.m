//
//  ProgramView.m
//  ngb-ipad
//
//  Created by Michael Apanowicz on 10/8/12.
//  Copyright (c) 2012 michal.apanowicz@miquido.com. All rights reserved.
//

#import "ProgramView.h"

@interface ProgramView ()
@property(nonatomic, retain) UIButton *likeButton;
@property(nonatomic, retain) UIButton *dislikeButton;


@end

@implementation ProgramView

@synthesize programImageView = _programImageView;
@synthesize programNameLabel = _programNameLabel;
@synthesize friendsButton = _friendsButton;
@synthesize likeAmountView = _likeAmountView;
@synthesize progressBar = _progressBar;
@synthesize dislikeButton = _dislikeButton;
@synthesize likeButton = _likeButton;


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.programImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(7, 7, 60, 60)] autorelease];
    [self addSubview:self.programImageView];

    self.programNameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(73, 10, 120, 16)] autorelease];
    [self.programNameLabel setFont:[Fonts boldFontWithSize14]];
    [self.programNameLabel setTextColor:[Colors blackColor]];
    [self.programNameLabel setTextAlignment:UITextAlignmentLeft];
    [self.programNameLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.programNameLabel];

    self.likeAmountView = [[[LikeAmountLabel alloc] initWithFrame:CGRectMake(73, 25, 120, 15) andLikeAmount:10] autorelease];
    [self addSubview:self.likeAmountView];

    self.friendsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *friendsImage = [UIImage imageNamed:@"dashboard_invite_friends.png"]; // TODO Michal - change size of picture
    [self.friendsButton setBackgroundImage:friendsImage forState:UIControlStateNormal];
    [self.friendsButton setFrame:CGRectMake(170, 44, friendsImage.size.width, friendsImage.size.height)];
    [self addSubview:self.friendsButton];

    self.progressBar = [[[UIImageView alloc] initWithFrame:CGRectMake(7, 75, 218, 9)] autorelease];
    [self addSubview:self.progressBar];
    [self initializeButtons];
  }
  return self;
}


- (void)initializeButtons {
  self.likeButton = [[[UIButton alloc] initWithFrame:CGRectMake(105, 43, 30, 30)] autorelease];
  [self.likeButton setImage:[UIImage imageNamed:@"dashboard_thumb_up.png"] forState:UIControlStateNormal];
  [self.likeButton addTarget:self action:@selector(likeAction) forControlEvents:UIControlEventTouchUpInside];
  [self addSubview:self.likeButton];

  self.dislikeButton = [[[UIButton alloc] initWithFrame:CGRectMake(137, 43, 30, 30)] autorelease];
  [self.dislikeButton setImage:[UIImage imageNamed:@"dashboard_thumb_down.png"] forState:UIControlStateNormal];
  [self.dislikeButton addTarget:self action:@selector(dislikeAction) forControlEvents:UIControlEventTouchUpInside];
  [self addSubview:self.dislikeButton];
}


- (void)dislikeAction {
  [WToast showWithText:NSLocalizedString(@"dashboard.thumbDown", nil) length:kWTShort];
}


- (void)likeAction {
  [WToast showWithText:NSLocalizedString(@"dashboard.thumbUp", nil) length:kWTShort];
}

- (void)dealloc {
  [_likeAmountView release];
  [_programImageView release];
  [_programNameLabel release];
  [_friendsButton release];
  [_progressBar release];
  [_dislikeButton release];
  [_likeButton release];
  [super dealloc];
}

@end
