/*
 * WallMsgBase
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/25/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "WToast.h"
#import "ProgramView.h"
#import "Fonts.h"
#import "Colors.h"

@interface WallMsgBase : UIView {
  UIImageView *_backgroundImage;
  UIImageView *_friendAvatar;
  UILabel *_friendName;
  ProgramView *_program;
  UIButton *_greenButton;
}
@property(nonatomic, retain) UIImageView *backgroundImage;
@property(nonatomic, retain) UIImageView *friendAvatar;
@property(nonatomic, retain) UILabel *friendName;
@property(nonatomic, retain) ProgramView *program;
@property(nonatomic, retain) UIButton *greenButton;


@end