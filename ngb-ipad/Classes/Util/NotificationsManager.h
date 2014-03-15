//
//  NotificationsManager.h
//  ngb-ipad
//
//  Created by Julian Król on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface NotificationsManager : NSObject {
  NSMutableArray *_notificationsArray;
}

@property(nonatomic, retain) NSMutableArray *notificationsArray;

+ (NotificationsManager *)instance;


@end
