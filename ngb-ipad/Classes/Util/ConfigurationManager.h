//
//  ConfigurationManager.h
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Values.h"
#import "Program.h"

@interface ConfigurationManager : NSObject {
@private
  NSString *_sessionId;
  NSString *_profileId;
  NSString *_currentChannelID;
  Program *_currentlyWatchingProgram;
  NSString *_password;
  NSString *_login;
}


@property(nonatomic, copy) NSString *sessionId;
@property(nonatomic, copy) NSString *profileId;
@property(nonatomic, copy) NSString *currentChannelID;
@property(nonatomic, retain) Program *currentlyWatchingProgram;
@property(nonatomic, copy) NSString *login;
@property(nonatomic, copy) NSString *password;


+ (ConfigurationManager *)instance;

- (void)setUpSessionID:(NSString *)sessionID;

- (NSString *)getSessionID;

- (void)setUpProfileID:(NSString *)profileID;

- (NSString *)getProfileID;

- (void)setUpCurrentChannelID:(NSString *)currentChannelID;

- (NSString *)getCurrentChannelID;

- (void)setUpCurrentlyWatchingProgram:(Program *)program;

- (Program *)getCurrentlyWatchingProgram;

@end
