/*
 * UpcommingShowView
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "Show.h"
#import "PopupInviteFriends.h"


@interface UpcommingShowView : UIView {
@private
  UIImageView *_showImageView;
  UILabel *_youAreGoingLabel;
  UILabel *_showNameLabel;
  UIButton *_addFriendsButton;
  Show *_show;
}

@property(nonatomic, retain) UIImageView *showImageView;
@property(nonatomic, retain) UILabel *youAreGoingLabel;
@property(nonatomic, retain) UILabel *showNameLabel;
@property(nonatomic, retain) UIButton *addFriendsButton;
@property(nonatomic, retain) Show *show;

- (id)initWithImage:(UIImage *)image;

@end