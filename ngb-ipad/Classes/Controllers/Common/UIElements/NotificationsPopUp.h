//
//  NotificationsPopUp.h
//  ngb-ipad
//
//  Created by Julian Król on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "NotificationsManager.h"
#import "Notification.h"

@interface NotificationsPopUp : UIView {
  UIView *_backgroundView;
  UIView *_contentBackground;
  UIImageView *_leftDivider;
  UIImageView *_rightDivider;
  UILabel *_chats;
  UILabel *_invites;
  UIImageView *_chat1;
  UIImageView *_chat2;
  UIImageView *_chat3;
  UIImageView *_chat4;
  UIScrollView *_notificationList;
  UIScrollView *_chatList;
}

- (id)initWithFrame:(CGRect)frame;

- (void)loadNotifications;


@end
