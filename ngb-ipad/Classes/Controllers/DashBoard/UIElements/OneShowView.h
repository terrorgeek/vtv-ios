/*
 * ShowView
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/25/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "WToast.h"
#import "PopupInviteFriends.h"
#import "LikeAmountLabel.h"
#import "Fonts.h"
#import "Colors.h"


@interface OneShowView : UIView {
  UIImageView *_background;
  UIImageView *_showImageView;
  UILabel *_showNameLabel;
  LikeAmountLabel *_likesLabelsView;
  UILabel *_dateLabel;
  UIButton *_thumbUp;
  UIButton *_thumbDown;
  UIButton *_friendButton;
}
@property(nonatomic, retain) UIImageView *background;
@property(nonatomic, retain) UIImageView *showImageView;
@property(nonatomic, retain) UILabel *showNameLabel;
@property(nonatomic, retain) LikeAmountLabel *likesLabelsView;
@property(nonatomic, retain) UILabel *dateLabel;
@property(nonatomic, retain) UIButton *thumbUp;
@property(nonatomic, retain) UIButton *thumbDown;
@property(nonatomic, retain) UIButton *friendButton;

- (id)initWithFrame:(CGRect)frame withIndex:(int)index1;


@end