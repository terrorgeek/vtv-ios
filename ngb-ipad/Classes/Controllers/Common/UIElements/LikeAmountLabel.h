//
//  LikeAmountLabel.h
//  ngb-ipad
//
//  Created by Michael Apanowicz on 10/8/12.
//  Copyright (c) 2012 michal.apanowicz@miquido.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fonts.h"
#import "Colors.h"

@interface LikeAmountLabel : UIView{
  UILabel *_howManyLikesLabel; 
  UILabel *_localizedLabel;
  NSInteger _numberOfLikes; 
}

@property(nonatomic, retain) UILabel *howManyLikesLabel;
@property(nonatomic, retain) UILabel *localizedLabel;
@property(nonatomic) NSInteger numberOfLikes;

- (id)initWithFrame:(CGRect)frame andLikeAmount:(NSInteger)likes;

@end
