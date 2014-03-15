//
//  ScheduleData.h
//  ngb-ipad
//
//  Created by Julian Król on 11/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Program.h"

@interface ScheduleData : NSObject{
  Program *_program;
  NSString *_startTime;
  NSString *_endTime;
}


+ (ScheduleData *)instance;

- (void)setUpProgram:(Program *)program;

- (Program *)getProgram;

- (void)setUpStartTime:(NSString *)startTime;

- (NSString *)getStartTime;

- (NSString *)getEndTime;

- (void)setUpEndTime:(NSString *)endTime;


@end
