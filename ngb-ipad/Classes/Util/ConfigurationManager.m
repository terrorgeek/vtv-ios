//
//  ConfigurationManager.m
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConfigurationManager.h"

@implementation ConfigurationManager
@synthesize sessionId = _sessionId;
@synthesize profileId = _profileId;
@synthesize currentChannelID = _currentChannelID;
@synthesize currentlyWatchingProgram = _currentlyWatchingProgram;
@synthesize login = _login;
@synthesize password = _password;


+ (ConfigurationManager *)instance {
  static ConfigurationManager *_instance = nil;

  @synchronized (self) {
    if (_instance == nil) {
      _instance = [[self alloc] init];
    }
  }

  return _instance;
}


- (void)setUpSessionID:(NSString *)sessionID {
  self.sessionId = sessionID;
}


- (NSString *)getSessionID {
  return self.sessionId;
}


- (void)setUpProfileID:(NSString *)profileID {
  self.profileId = profileID;
}


- (NSString *)getProfileID {
  return self.profileId;
}


- (void)setUpCurrentChannelID:(NSString *)currentChannelID {
  self.currentChannelID = currentChannelID;
}


- (NSString *)getCurrentChannelID {
  return self.currentChannelID;
}


- (void)setUpCurrentlyWatchingProgram:(Program *)program {
  self.currentlyWatchingProgram = program;
}


- (Program *)getCurrentlyWatchingProgram {
  return self.currentlyWatchingProgram;
}


- (void)dealloc {
  [_sessionId release];
  [_profileId release];
  [_currentChannelID release];
  [_currentlyWatchingProgram release];
  [_login release];
  [_password release];
  [super dealloc];
}

@end
