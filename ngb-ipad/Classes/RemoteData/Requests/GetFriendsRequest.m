//
//  GetFriendsRequest.m
//  ngb-ipad
//
//  Created by Julian Król on 09/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GetFriendsRequest.h"

@implementation GetFriendsRequest

@end


@implementation GetFriendsResponse
@synthesize friendsArray = _friendsArray;

- (void)dealloc {
  [_friendsArray release];
  [super dealloc];
}


@end

