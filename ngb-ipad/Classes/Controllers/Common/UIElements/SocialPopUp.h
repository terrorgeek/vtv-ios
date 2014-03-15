//
//  SocialPopUp.h
//  ngb-ipad
//
//  Created by Michael Apanowicz on 10/9/12.
//  Copyright (c) 2012 michal.apanowicz@miquido.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SocialPopUp : UIView {
  UIView *_blackBackground; 
  UIImageView *_popupBackground;
  UIImageView *_socialLogo; 
  UIButton *_sendButton; 
  UIScrollView *_scrollView;
}

@property(nonatomic, retain) UIView *blackBackground;
@property(nonatomic, retain) UIImageView *popupBackground; 
@property(nonatomic, retain) UIImageView *socialLogo; 
@property(nonatomic, retain) UIButton *sendButton; 
@property(nonatomic, retain) UIScrollView *scrollView;

@end
