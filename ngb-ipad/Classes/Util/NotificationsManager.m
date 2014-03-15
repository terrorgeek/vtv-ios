//
//  NotificationsManager.m
//  ngb-ipad
//
//  Created by Julian Król on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NotificationsManager.h"

@implementation NotificationsManager
@synthesize notificationsArray = _notificationsArray;

+ (NotificationsManager *)instance {
  static NotificationsManager *_instance = nil;

  @synchronized (self) {
    if (_instance == nil) {
      _instance = [[self alloc] init];
    }
  }

  return _instance;
}


- (void)dealloc {
  [_notificationsArray release];
  [super dealloc];
}

@end
