//
//  ScheduleData.m
//  ngb-ipad
//
//  Created by Julian Król on 11/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScheduleData.h"

@interface ScheduleData ()
@property(nonatomic, retain) Program *program;
@property(nonatomic, copy) NSString *startTime;
@property(nonatomic, copy) NSString *endTime;

@end

@implementation ScheduleData
@synthesize program = _program;
@synthesize startTime = _startTime;
@synthesize endTime = _endTime;


+ (ScheduleData *)instance {
  static ScheduleData *_instance = nil;

  @synchronized (self) {
    if (_instance == nil) {
      _instance = [[self alloc] init];
    }
  }
  return _instance;
}


- (void)setUpProgram:(Program *)program {
  self.program = program;
}


- (Program *)getProgram {
  return self.program;
}


- (void)setUpStartTime:(NSString *)startTime {
  self.startTime = startTime;
}


- (NSString *)getStartTime {
  return self.startTime;
}


- (NSString *)getEndTime {
  return self.endTime;
}


- (void)setUpEndTime:(NSString *)endTime {
  self.endTime = endTime;
}


- (void)dealloc {
  [_program release];
  [_startTime release];
  [_endTime release];
  [super dealloc];
}


@end
