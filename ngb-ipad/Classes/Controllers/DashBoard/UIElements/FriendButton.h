/*
 * FriendButton
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/24/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "NINetworkImageView.h"
#import "Colors.h"
#import "Fonts.h"


@interface FriendButton : UIButton {
  NINetworkImageView *_avatar;
  UILabel *_friendName;
  BOOL _isChecked;
}
@property(nonatomic, readonly) BOOL isChecked;
@property(nonatomic, retain) NINetworkImageView *avatar;
@property(nonatomic, retain) UILabel *friendName;

- (id)initWithPoint:(CGPoint)point;


@end