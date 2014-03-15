/*
 * Colors
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "Colors.h"


@implementation Colors

+ (UIColor *)grayColor {
  return [UIColor colorWithRed:0.48 green:0.48 blue:0.56 alpha:1];
}

+ (UIColor *)blackColor {
  return [UIColor colorWithRed:(CGFloat) 59 / 255 green:(CGFloat) 59 / 255 blue:(CGFloat) 59 / 255 alpha:1];
}

+ (UIColor *)greenColor {
  return [UIColor colorWithRed:(CGFloat) 147 / 255 green:(CGFloat) 192 / 255 blue:(CGFloat) 49 / 255 alpha:1];
}

+ (UIColor *)darkenGrayColor {
  return [UIColor colorWithRed:(CGFloat) 167 / 255 green:(CGFloat) 167 / 255 blue:(CGFloat) 167 / 255 alpha:1];
}

+ (UIColor *)orangeColor {
  //return [UIColor colorWithRed:252/255 green:138/255 blue:5/255 alpha:1.0];
  return [UIColor orangeColor];
}

+ (UIColor *)whiteColor {
  return [UIColor whiteColor];
}
@end