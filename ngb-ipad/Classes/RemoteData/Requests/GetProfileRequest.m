//
//  GetProfileRequest.m
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GetProfileRequest.h"

@implementation GetProfileRequest

@end


@implementation GetProfileResponse
@synthesize id = _id;
@synthesize name = _name;
@synthesize last_name = _last_name;
@synthesize first_name = _first_name;
@synthesize current_channel_id = _current_channel_id;


- (void)dealloc {
  [_id release];
  [_name release];
  [_last_name release];
  [_first_name release];
  [_current_channel_id release];
  [super dealloc];
}


@end