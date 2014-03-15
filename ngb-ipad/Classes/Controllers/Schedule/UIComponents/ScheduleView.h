//
//  ScheduleView.h
//  ngb-ipad
//
//  Created by Julian Król on 10/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "Program.h"
#import "ProgramButton.h"

@interface ScheduleView : UIView {
  UIButton *_leftButton;
  UIButton *_rightButton;
  UIButton *_dayButton;
  UIButton *_weekButton;
  UIButton *_monthButton;
  UIImageView *_tableBackground;
  id _parentViewController;
  NSMutableArray *_buttonsArray;
  Program *_oldProgram;
}
@property(nonatomic, retain) id parentViewController;


- (void)update:(Program *)program;


@end
