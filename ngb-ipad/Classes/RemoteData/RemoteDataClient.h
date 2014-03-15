//
//  RemoteDataClient.h
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "JSONKit.h"
#import "AFNetworking.h"
#import "Values.h"
#import "Notification.h"
#import "Actor.h"
#import "Friend.h"
#import "ConfigurationManager.h"
#import "ErrorResponse.h"
#import "LogInRequest.h"
#import "GetProfileRequest.h"
#import "GetNotificationsRequest.h"
#import "GetProgramOnChannelRequest.h"
#import "GetActorsForProgramRequest.h"
#import "GetFriendsRequest.h"
#import "GetProgramsOnChannelGuideOnTimeRequest.h"
#import "GetProgramRequest.h"

@interface RemoteDataClient : NSObject {
@private
  AFHTTPClient *_httpClient;
}

+ (RemoteDataClient *)instance;

- (void)logIn:(LogInRequest *)request withDelegate:(id <LogInDelegate>)delegate;

- (void)getProfileDetails:(GetProfileRequest *)request withDelegate:(id <GetProfileDelegate>)delegate;

- (void)putRequestChannelId:(NSString *)channelID;

- (void)postDataToSchedule:(NSString *)guide_id;

- (void)getNotifications:(GetNotificationsRequest *)request withDelegate:(id <GetNotificationsDelegate>)delegate;

- (void)getProgramOnChannel:(GetProgramOnChannelRequest *)request withDelegate:(id <GetProgramOnChannelDelegate>)delegate;

- (void)getProgramOnChannelInGuideForTime:(GetProgramsOnChannelGuideOnTimeRequest *)request withDelegate:(id <GetProgramOnChannelInGuideOnTimeDelegate>)delegate;

- (void)getProgramInfo:(GetProgramRequest *)request withDelegate:(id <GetProgramDelegate>)delegate;

- (void)getActorsForProgram:(GetActorsForProgramRequest *)request withDelegate:(id <GetActorsForProgramDelegate>)delegate;

- (void)getFriendsForProfile:(GetFriendsRequest *)request withDelegate:(id <GetFriendsDelegate>)delegate;

@end
