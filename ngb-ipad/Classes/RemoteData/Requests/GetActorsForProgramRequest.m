//
//  GetActorsForProgramRequest.m
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GetActorsForProgramRequest.h"

@implementation GetActorsForProgramRequest
@synthesize programId = _programId;

- (void)dealloc {
  [_programId release];
  [super dealloc];
}


@end

@implementation  GetActorsForProgramResponse
@synthesize actorsArray = _actorsArray;

- (void)dealloc {
  [_actorsArray release];
  [super dealloc];
}


@end
