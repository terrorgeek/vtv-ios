/*
 * FeaturedView
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/21/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "Colors.h"
#import "Fonts.h"
#import "WToast.h"
#import "NINetworkImageView.h"


@interface FeaturedView : UIView{
  NINetworkImageView *_backgroundImageView;
  UIView *blackTransparentOverBackground;
  CGRect blackFrame;
}

@property(nonatomic) CGRect blackFrame;
@property(nonatomic, retain) NINetworkImageView *backgroundImageView;

- (id)initWithImage:(UIImage *)image andPoint:(CGPoint)point;



@end