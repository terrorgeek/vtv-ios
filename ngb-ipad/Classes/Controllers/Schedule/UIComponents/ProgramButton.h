//
//  ProgramButton.h
//  ngb-ipad
//
//  Created by Julian Król on 10/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NINetworkImageView.h"
#import "Program.h"
#import <QuartzCore/QuartzCore.h>

@interface ProgramButton : UIButton {
  UIImageView *_myBackgroundView;
  NINetworkImageView *_programIcon;
  UILabel *_movieName;
  UILabel *_timetable;
  Program *_program;
}

@property(nonatomic, retain) Program *program;
@property(nonatomic, retain) NINetworkImageView *programIcon;

- (void)setUpMovieName:(NSString *)movieNameStr;

- (void)setUpTimetable:(NSString *)timetableStr;

- (void)setUpImage:(NSString *)pathToImg isFromWeb:(BOOL)isFromWeb;

- (void)changeToSelectedBackground;

- (void)changeToUnselectedBackground;


@end
