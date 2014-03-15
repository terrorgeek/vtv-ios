/*
 * PopupInviteFriends
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/22/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "PopupGreenButton.h"
#import "FriendButton.h"
#import "Friend.h"
#import "Values.h"


@interface PopupInviteFriends : UIView<UITextViewDelegate> {
  NSMutableArray *_friendsArray;
  UIView *_popupWithoutBlack;
  UIView *_blackBackground;
  UIImageView *_popupBackground;
  UIScrollView *_scrollView;
  UIView *_contentView;
  UIImageView *_divider;
  PopupGreenButton *_sendButton;
  UITextView *_messageTextView;
}

@property(nonatomic, retain) UIImageView *popupBackground;
@property(nonatomic, retain) UIScrollView *scrollView;
@property(nonatomic, retain) PopupGreenButton *sendButton;
@property(nonatomic, retain) UITextView *messageTextView;
@property(nonatomic, retain) UIView *blackBackground;
@property(nonatomic, retain) UIView *contentView;
@property(nonatomic, retain) UIImageView *divider;
@property(nonatomic, retain) NSMutableArray *friendsArray;
@property(nonatomic, retain) UIView *popupWithoutBlack;

+ (PopupInviteFriends *)instance;


- (void)fillWithFriends;


@end