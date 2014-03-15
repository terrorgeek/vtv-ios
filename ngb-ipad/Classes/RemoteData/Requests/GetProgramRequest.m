//
//  GetProgramRequest.m
//  ngb-ipad
//
//  Created by Julian Król on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GetProgramRequest.h"


@implementation GetProgramRequest
@synthesize program_id = _program_id;

- (void)dealloc {
  [_program_id release];
  [super dealloc];
}


@end


@implementation GetProgramResponse
@synthesize program = _program;


- (id)init
{
  self = [super init];
  if (self) {
   self.program = [[[Program alloc] init] autorelease];
  }
  return self;
}


- (void)dealloc {
  [_program release];
  [super dealloc];
}


@end