//
//  DashboardFeaturedShow.h
//  ngb-ipad
//
//  Created by Michael Apanowicz on 10/9/12.
//  Copyright (c) 2012 michal.apanowicz@miquido.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colors.h"
#import "Fonts.h"

@interface DashboardFeaturedShow : UIView {
  UIImageView *blackBackground; 
  
  UIImageView *_featuredShowImageView;
  UILabel *featuredLabel; 
  UILabel *_programNameLabel; 
  UIButton *_tuneInButton;
  UIButton *_thumbUpButton;
  UIButton *_thumbDownButton;
  UILabel *_clockLabel;
  UILabel *_pmAmLabel;
}

@property(nonatomic, retain) UIImageView *featuredShowImageView; 
@property(nonatomic, retain) UILabel *programNameLabel; 
@property(nonatomic, retain) UIButton *tuneInButton;
@property(nonatomic, retain) UIButton *thumbUpButton;
@property(nonatomic, retain) UIButton *thumbDownButton;
@property(nonatomic, retain) UILabel *clockLabel; 
@property(nonatomic, retain) UILabel *pmAmLabel; 

@end
