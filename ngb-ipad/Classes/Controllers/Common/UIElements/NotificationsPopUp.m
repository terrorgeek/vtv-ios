//
//  NotificationsPopUp.m
//  ngb-ipad
//
//  Created by Julian Król on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NotificationsPopUp.h"

@interface NotificationsPopUp ()
@property(nonatomic, retain) UIView *contentBackground;
@property(nonatomic, retain) UIView *backgroundView;
@property(nonatomic, retain) UIImageView *rightDivider;
@property(nonatomic, retain) UIImageView *leftDivider;
@property(nonatomic, retain) UILabel *invites;
@property(nonatomic, retain) UILabel *chats;
@property(nonatomic, retain) UIImageView *chat1;
@property(nonatomic, retain) UIImageView *chat4;
@property(nonatomic, retain) UIImageView *chat3;
@property(nonatomic, retain) UIImageView *chat2;
@property(nonatomic, retain) UIScrollView *notificationList;
@property(nonatomic, retain) UIScrollView *chatList;


@end

@implementation NotificationsPopUp
@synthesize backgroundView = _backgroundView;
@synthesize contentBackground = _contentBackground;
@synthesize rightDivider = _rightDivider;
@synthesize leftDivider = _leftDivider;
@synthesize invites = _invites;
@synthesize chats = _chats;
@synthesize chat4 = _chat4;
@synthesize chat3 = _chat3;
@synthesize chat2 = _chat2;
@synthesize chat1 = _chat1;
@synthesize notificationList = _notificationList;
@synthesize chatList = _chatList;


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self customizeView];
    [self initializeContent];
    [self initializeDividers];
    [self initializeLabels];
    [self initializeChatImages];
    [self initializeChatList];
    [self initializeNotificationList];
  }
  return self;
}


- (void)customizeView {
  self.backgroundView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 1024)] autorelease];
  self.backgroundView.backgroundColor = [UIColor blackColor];
  self.backgroundView.alpha = 0.4;
  [self addSubview:self.backgroundView];

  UITapGestureRecognizer *singleTapGestureRecognizer = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)] autorelease];
  [singleTapGestureRecognizer setNumberOfTapsRequired:1];
  [self.backgroundView addGestureRecognizer:singleTapGestureRecognizer];
}


- (void)initializeDividers {
  self.leftDivider = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dashboard_header_line.png"]] autorelease];
  self.leftDivider.frame = CGRectMake(20, 50, 240, 2);
  [self addSubview:self.leftDivider];

  self.rightDivider = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dashboard_header_line.png"]] autorelease];
  self.rightDivider.frame = CGRectMake(295, 50, 210, 2);
  [self addSubview:self.rightDivider];
}


- (void)initializeContent {
  self.contentBackground = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 534, 395)] autorelease];
  self.contentBackground.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"notifications_backgroundpng.png"]];
  [self addSubview:self.contentBackground];
}


- (void)initializeLabels {
  self.invites = [[[UILabel alloc] initWithFrame:CGRectMake(20, 20, 100, 20)] autorelease];
  self.invites.backgroundColor = [UIColor clearColor];
  self.invites.font = [UIFont systemFontOfSize:18];
  self.invites.textColor = [UIColor blackColor];
  self.invites.text = NSLocalizedString(@"invites", nil);
  [self addSubview:self.invites];

  self.chats = [[[UILabel alloc] initWithFrame:CGRectMake(300, 20, 100, 20)] autorelease];
  self.chats.backgroundColor = [UIColor clearColor];
  self.chats.font = [UIFont systemFontOfSize:18];
  self.chats.textColor = [UIColor blackColor];
  self.chats.text = NSLocalizedString(@"chats", nil);
  [self addSubview:self.chats];
}


- (void)initializeChatImages {
  self.chat1 = [[[UIImageView alloc] initWithFrame:CGRectMake(295, 60, 208, 66)] autorelease];
  self.chat1.image = [UIImage imageNamed:@"notifications_chat1.png"];
  [self addSubview:self.chat1];

  self.chat2 = [[[UIImageView alloc] initWithFrame:CGRectMake(295, 140, 208, 66)] autorelease];
  self.chat2.image = [UIImage imageNamed:@"notifications_chat2.png"];
  [self addSubview:self.chat2];

  self.chat3 = [[[UIImageView alloc] initWithFrame:CGRectMake(295, 220, 208, 66)] autorelease];
  self.chat3.image = [UIImage imageNamed:@"notifications_chat3.png"];
  [self addSubview:self.chat3];

  self.chat4 = [[[UIImageView alloc] initWithFrame:CGRectMake(295, 300, 208, 66)] autorelease];
  self.chat4.image = [UIImage imageNamed:@"notifications_chat4.png"];
  [self addSubview:self.chat4];
}


- (void)initializeChatList {
  self.chatList = [[[UIScrollView alloc] initWithFrame:CGRectMake(20, 60, 240, 310)] autorelease];
  [self loadNotifications];
}


- (void)loadNotifications {
  self.chatList.contentSize = CGSizeMake(240, 70 * [[[NotificationsManager instance] notificationsArray] count]);
  [self addSubview:self.chatList];
}


- (void)initializeNotificationList {
  self.notificationList = [[[UIScrollView alloc] initWithFrame:CGRectMake(20, 60, 240, 310)] autorelease];
  self.notificationList.contentSize = CGSizeMake(240, [[[NotificationsManager instance] notificationsArray] count] * 145);
  for (int i = 0, j = [[[NotificationsManager instance] notificationsArray] count]; i < j; ++i) {
    UIImageView *img = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 145 * i, 233, 128)] autorelease];
    if (i % 2 == 0) {
      img.image = [UIImage imageNamed:@"notifications_sample_1.png"];
    } else {
      img.image = [UIImage imageNamed:@"notifications_sample_2.png"];
    }
    [self.notificationList addSubview:img];
  }
  [self addSubview:self.notificationList];
}


- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
  self.hidden = YES;
}


- (void)dealloc {
  [_backgroundView release];
  [_contentBackground release];
  [_rightDivider release];
  [_leftDivider release];
  [_invites release];
  [_chats release];
  [_chat4 release];
  [_chat3 release];
  [_chat2 release];
  [_chat1 release];
  [_notificationList release];
  [_chatList release];
  [super dealloc];
}

@end
