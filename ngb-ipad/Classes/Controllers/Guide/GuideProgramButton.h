//
//  GuideProgramButton.h
//  ngb-ipad
//
//  Created by Michael Apanowicz on 10/9/12.
//  Copyright (c) 2012 michal.apanowicz@miquido.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fonts.h"
#import "Colors.h"

@interface GuideProgramButton : UIButton {
  UIImageView *_backgroundImageView;
  UILabel *_programNameLabel; 
  UILabel *_dateLabel; 
  UIButton *_thumbUpButton; 
  UIButton *_thumbDownButton;
  UIButton *_friendButton;
    NSString *channel_id;
    NSString *start_time;
}

@property(nonatomic, retain) UIImageView *backgroundImageView; 
@property(nonatomic, retain) UILabel *programNameLabel; 
@property(nonatomic, retain) UILabel *dateLabel; 
@property(nonatomic, retain) UIButton *thumbUpButton; 
@property(nonatomic, retain) UIButton *thumbDownButton; 
@property(nonatomic, retain) UIButton *friendButton;
@property(nonatomic,retain) NSString *channel_id;
@property(nonatomic,retain) NSString *start_time;

@end
