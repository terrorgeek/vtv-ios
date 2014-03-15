//
//  GetProgramOnChannelRequest.m
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GetProgramOnChannelRequest.h"

@implementation GetProgramOnChannelRequest
@synthesize channelID = _channelID;

- (void)dealloc {
  [_channelID release];
  [super dealloc];
}


@end

@implementation  GetProgramOnChannelResponse
@synthesize program = _program;

- (void)dealloc {
  [_program release];
  [super dealloc];
}


@end