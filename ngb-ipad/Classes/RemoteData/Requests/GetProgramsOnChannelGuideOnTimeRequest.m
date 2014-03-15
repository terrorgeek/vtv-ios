//
//  GetProgramsOnChannelGuideOnTimeRequest.m
//  ngb-ipad
//
//  Created by Julian Król on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GetProgramsOnChannelGuideOnTimeRequest.h"

@implementation GetProgramsOnChannelGuideOnTimeRequest
@synthesize channel_id = _channel_id;
@synthesize startTimeStr = _startTimeStr;
@synthesize endTimeStr = _endTimeStr;


- (void)dealloc {
  [_channel_id release];
  [_startTimeStr release];
  [_endTimeStr release];
  [super dealloc];
}


@end


@implementation GetProgramsOnChannelGuideOnTimeResponse
@synthesize guide_id = _guide_id;
@synthesize program_id = _program_id;
@synthesize startTime = _startTime;
@synthesize endTime = _endTime;


- (void)dealloc {
  [_guide_id release];
  [_program_id release];
  [_startTime release];
  [_endTime release];
  [super dealloc];
}


@end