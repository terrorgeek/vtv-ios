//
//  GetNotificationsRequest.m
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GetNotificationsRequest.h"

@implementation GetNotificationsRequest

@end


@implementation GetNotificationsResponse
@synthesize notificationsArray = _notificationsArray;


- (void)dealloc {
  [_notificationsArray release];
  [super dealloc];
}


@end