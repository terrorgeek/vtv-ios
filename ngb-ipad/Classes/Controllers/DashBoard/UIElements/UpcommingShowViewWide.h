//
//  UpcommingShowViewWide.h
//  ngb-ipad
//
//  Created by Michael Apanowicz on 10/9/12.
//  Copyright (c) 2012 michal.apanowicz@miquido.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Show.h"
#import "Colors.h"
#import "Fonts.h"

@interface UpcommingShowViewWide : UIView {
@private
  UIImageView *_backgroundImageView;
  UIImageView *_showImageView;
  UILabel *_showNameLabel;
  UIButton *_addFriendsButton;
  UILabel *_showDate;
  Show *_show;
}

@property(nonatomic, retain) UIImageView *backgroundImageView;  
@property(nonatomic, retain) UIImageView *showImageView;
@property(nonatomic, retain) UILabel *showNameLabel;
@property(nonatomic, retain) UIButton *addFriendsButton;
@property(nonatomic, retain) UILabel *showDate;
@property(nonatomic, retain) Show *show;


@end
