/*
 * ShowsControlButton
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/22/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "Fonts.h"
#import "Colors.h"


@interface ShowsControlButton : UIButton {
  UILabel *title;
}
@property(nonatomic, retain) UILabel *title;

@end