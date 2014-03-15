//
//  GetNotificationsRequest.h
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "BasicRequest.h"
#import "BasicDelegate.h"

@interface GetNotificationsRequest : BasicRequest

@end


@interface GetNotificationsResponse : BasicResponse{
  NSMutableArray *_notificationsArray;
}

@property(nonatomic, retain) NSMutableArray *notificationsArray;


@end


@protocol GetNotificationsDelegate <BasicDelegate>

- (void)onGetNotificationsSuccess:(GetNotificationsResponse *)response;

@end