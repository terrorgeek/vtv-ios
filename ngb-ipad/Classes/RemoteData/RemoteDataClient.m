//
//  RemoteDataClient.m
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RemoteDataClient.h"


@interface RemoteDataClient ()
@property(nonatomic, retain) AFHTTPClient *httpClient;

@end

@implementation RemoteDataClient
@synthesize httpClient = _httpClient;

+ (RemoteDataClient *)instance {
  static RemoteDataClient *_instance = nil;

  @synchronized (self) {
    if (_instance == nil) {
      _instance = [[self alloc] init];
      _instance = [[self instance] initSingleton];
    }
  }

  return _instance;
}


- (id)initSingleton {
  self = [super init];
  if (self) {
    NSString *const urlStr = [NSString stringWithFormat:@"%@", API_BASE_LINK_REQUEST];
    self.httpClient = [AFHTTPClient clientWithBaseURL:[[[NSURL alloc] initWithString:urlStr] autorelease]];
  }
  return self;
}


- (void)logIn:(LogInRequest *)request withDelegate:(id <LogInDelegate>)delegate {
  NSString *extraPath = [NSString stringWithFormat:@"%@", API_LOGIN];
  NSMutableURLRequest *loginRequest = [self.httpClient requestWithMethod:@"POST" path:extraPath parameters:nil];
  [loginRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [loginRequest setHTTPBody:[[request getRequestHttpBody] dataUsingEncoding:NSUTF8StringEncoding]];
  AFHTTPRequestOperation *requestOperation = [[[AFHTTPRequestOperation alloc] initWithRequest:loginRequest] autorelease];
  [requestOperation setCompletionBlockWithSuccess :^void(AFHTTPRequestOperation *operation, id result) {
    NSData *const data = result;
    if (data != nil) {
      NSArray *logInData = [data objectFromJSONData];
      NSLog(@"%@", logInData);
      LogInResponse *response = [[LogInResponse alloc] init];
      response.idStr = [logInData valueForKey:@"id"];
      response.user_idStr = [logInData valueForKey:@"user_id"];
      response.user_nameStr = [logInData valueForKey:@"user_name"];
      [delegate onGetLoginSuccess:response];
      [response release];
    } else {
      NSLog(@"nil data");
    }
  }
                                          failure:^void(AFHTTPRequestOperation *operation, NSError *error) {
                                            ErrorResponse *response = [ErrorResponse objectForOperation:operation andError:error];
                                            response.whatFailed = @"logging";
                                            response.errorTag = 100;
                                            [delegate onError:response];
                                          }
  ];
  [self.httpClient.operationQueue addOperation:requestOperation];
}


- (void)getProfileDetails:(GetProfileRequest *)request withDelegate:(id <GetProfileDelegate>)delegate {
  [self.httpClient setDefaultHeader:@"Cache-Control" value:@"no-cache"];
  [self.httpClient getPath:[NSString stringWithFormat:@"%@?%@%@", API_PROFILE, API_SESSION, [[ConfigurationManager instance] getSessionID]]
                parameters:nil success:^void(AFHTTPRequestOperation *operation, id result) {
    NSData *const data = result;
    if (data != nil) {
      NSArray *profileData = [data objectFromJSONData];
      GetProfileResponse *response = [[GetProfileResponse alloc] init];
      response.id = [profileData valueForKey:@"id"];
      response.name = [profileData valueForKey:@"name"];
      response.first_name = [profileData valueForKey:@"first_name"];
      response.last_name = [profileData valueForKey:@"last_name"];
      response.current_channel_id = [profileData valueForKey:@"current_channel_id"];
      [delegate onGetProfileSuccess:response];
      [response release];
    } else {
      NSLog(@"nil data");
    }
  }

                   failure:^void(AFHTTPRequestOperation *operation, NSError *error) {
                     ErrorResponse *response = [ErrorResponse objectForOperation:operation andError:error];
                     response.whatFailed = @"getting profile";
                     [delegate onError:response];
                   }
  ];
}


- (void)putRequestChannelId:(NSString *)channelID {
        NSLog(@"let's change channel!!!!! %@",channelID);
  NSString *path = [NSString stringWithFormat:@"%@/%@?%@%@", API_PROFILES, [[ConfigurationManager instance] getProfileID], API_SESSION, [[ConfigurationManager instance] getSessionID]];
  NSString *str = [NSString stringWithFormat:@"{\"requested_channel_id\":\"%@\"}", channelID];
  NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
  NSURLRequest *request = [self requestWithMethod:@"PUT" path:path parameters:nil data:data];
  AFHTTPRequestOperation *operation = [self.httpClient HTTPRequestOperationWithRequest:request success:nil failure:nil];
  [self.httpClient enqueueHTTPRequestOperation:operation];
}


- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters
                                      data:(NSData *)data; {
  NSMutableURLRequest *request = [self.httpClient requestWithMethod:method
                                                               path:path
                                                         parameters:parameters];

  [request setHTTPBody:data];
  return request;
}


- (void)postDataToSchedule:(NSString *)guide_id {
  NSString *path = [NSString stringWithFormat:@"%@/%@/%@?%@%@", API_PROFILES, [[ConfigurationManager instance] getProfileID], API_SCHEDULE,
                                              API_SESSION, [[ConfigurationManager instance] getSessionID]];
  NSString *str = [NSString stringWithFormat:@"{\"%@\":{}}", guide_id];
  NSLog(@"%@", str);
  NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
  NSURLRequest *request = [self requestWithMethod:@"POST" path:path parameters:nil data:data];
  AFHTTPRequestOperation *operation = [self.httpClient HTTPRequestOperationWithRequest:request success:nil failure:nil];
  [self.httpClient enqueueHTTPRequestOperation:operation];
}


- (void)getNotifications:(GetNotificationsRequest *)request withDelegate:(id <GetNotificationsDelegate>)delegate {
  NSString *extraPath = [NSString stringWithFormat:@"%@/%@?%@%@", API_PROFILE, API_NOTIFICATIONS, API_SESSION, [[ConfigurationManager instance] getSessionID]];
  [self.httpClient getPath:extraPath
                parameters:nil success:^void(AFHTTPRequestOperation *operation, id result) {
    NSData *const data = result;
    if (data != nil) {
      NSArray *notificationsData = [data objectFromJSONData];
      GetNotificationsResponse *response = [[GetNotificationsResponse alloc] init];
      NSArray *notificationsArray = [notificationsData valueForKey:@"entry_list"];
      if ([[notificationsData valueForKey:@"total_count"] intValue] > 0) {
        response.notificationsArray = [[[NSMutableArray alloc] init] autorelease];
        for (NSDictionary *item in notificationsArray) {
          Notification *notification = [[Notification alloc] init];
          notification.status = [item valueForKey:@"status"];
          if ([notification.status isEqualToString:@"new"]) {
            notification.id = [item valueForKey:@"id"];
            notification.subjectId = [item valueForKey:@"subject_id"];
            notification.description = [item valueForKey:@"description"];
            notification.fromId = [item valueForKey:@"from_id"];
            notification.name = [item valueForKey:@"name"];
            notification.type = [item valueForKey:@"type"];
            [response.notificationsArray addObject:notification];
          }
          [notification release];
        }
      }
      [delegate onGetNotificationsSuccess:response];
      [response release];
    } else {
      NSLog(@"nil data");
    }
  }

                   failure:^void(AFHTTPRequestOperation *operation, NSError *error) {
                     ErrorResponse *response = [ErrorResponse objectForOperation:operation andError:error];
                     response.whatFailed = @"getting notifications";
                     [delegate onError:response];
                   }
  ];
}


- (void)getProgramOnChannel:(GetProgramOnChannelRequest *)request withDelegate:(id <GetProgramOnChannelDelegate>)delegate {
  NSString *extraPath = [NSString stringWithFormat:@"%@/%@/%@?%@%@", API_CHANNELS, request.channelID, API_GUIDE, API_SESSION, [[ConfigurationManager instance] getSessionID]];
  [self.httpClient getPath:extraPath
                parameters:nil success:^void(AFHTTPRequestOperation *operation, id result) {
    NSData *const data = result;
    if (data != nil) {
      NSArray *notificationsData = [data objectFromJSONData];
      GetProgramOnChannelResponse *response = [[GetProgramOnChannelResponse alloc] init];
      NSArray *programsArray = [notificationsData valueForKey:@"entry_list"];
      NSLog(@"%@", programsArray);
      response.program = [[[Program alloc] init] autorelease];
      for (NSDictionary *item in programsArray) {
        response.program.id = [item objectForKey:@"id"];
        response.program.countries = [item objectForKey:@"countries"];
        response.program.description = [item objectForKey:@"description"];
        response.program.directors = [item objectForKey:@"directors"];
        response.program.literature = [item objectForKey:@"literature"];
        response.program.name = [item objectForKey:@"name"];
        response.program.producers = [item objectForKey:@"producers"];
        response.program.episodeName = [item objectForKey:@"episode_name"];
        response.program.episodeNumber = [item objectForKey:@"episode_number"];
        response.program.seasonNumber = [item objectForKey:@"season_number"];
        response.program.trivia = [item objectForKey:@"trivia"];
        response.program.poster_id = [item objectForKey:@"poster_id"];
        response.program.general_id = [item objectForKey:@"general_id"];
      }
      [delegate onGetProgramOnChannelSuccess:response];
      [response release];
    } else {
      NSLog(@"nil data");
    }
  }
                   failure:^void(AFHTTPRequestOperation *operation, NSError *error) {
                     ErrorResponse *response = [ErrorResponse objectForOperation:operation andError:error];
                     response.whatFailed = @"getting program";
                     [delegate onError:response];
                   }
  ];
}


- (void)getProgramOnChannelInGuideForTime:(GetProgramsOnChannelGuideOnTimeRequest *)request withDelegate:(id <GetProgramOnChannelInGuideOnTimeDelegate>)delegate {
  NSString *extraPath = [NSString stringWithFormat:@"%@/%@/%@?%@%@&%@=%@&%@=%@", API_CHANNELS, request.channel_id, API_GUIDE,
                                                   API_SESSION, [[ConfigurationManager instance] getSessionID],
                                                   API_START_TIME, request.startTimeStr,
                                                   API_END_TIME, request.endTimeStr];
  NSLog(@"%@", extraPath);
  [self.httpClient getPath:extraPath parameters:nil success:^void(AFHTTPRequestOperation *operation, id result) {
    NSData *const data = result;
    if (data != nil) {
      NSArray *arrayData = [data objectFromJSONData];
      GetProgramsOnChannelGuideOnTimeResponse *response = [[GetProgramsOnChannelGuideOnTimeResponse alloc] init];
      NSArray *relationsArray = [arrayData valueForKey:@"relationship_list"];
      for (NSDictionary *item in relationsArray) {
        response.guide_id = [item valueForKey:@"id"];
        response.program_id = [item valueForKey:@"program_id"];
        response.startTime = [item valueForKey:@"start_time"];
        response.endTime = [item valueForKey:@"end_time"];
        NSLog(@"%@-%@", response.startTime, response.endTime);
        break;
      }
      [delegate onGetProgramOnChannelInGuideOnTimeSuccess:response];
      [response release];
    } else {
      NSLog(@"nil data");
    }
  }
                   failure:^void(AFHTTPRequestOperation *operation, NSError *error) {
                     ErrorResponse *response = [ErrorResponse objectForOperation:operation andError:error];
                     [delegate onError:response];
                   }
  ];
}


- (void)getProgramInfo:(GetProgramRequest *)request withDelegate:(id <GetProgramDelegate>)delegate {
  [self.httpClient getPath:[NSString stringWithFormat:@"%@/%@?%@%@", API_PROGRAMS, request.program_id, API_SESSION, [[ConfigurationManager instance] getSessionID]]
                parameters:nil success:^void(AFHTTPRequestOperation *operation, id result) {
    NSData *const data = result;
    if (data != nil) {
      NSArray *arrayData = [data objectFromJSONData];
      GetProgramResponse *response = [[GetProgramResponse alloc] init];
      response.program.name = [arrayData valueForKey:@"name"];
      response.program.poster_id = [arrayData valueForKey:@"poster_id"];
      response.program.description = [arrayData valueForKey:@"description"];
      [delegate onGetProgramSuccess:response];
      [response release];
    } else {
      NSLog(@"nil data");
    }
  }
                   failure:^void(AFHTTPRequestOperation *operation, NSError *error) {
                     ErrorResponse *response = [ErrorResponse objectForOperation:operation andError:error];
                     [delegate onError:response];
                   }
  ];
}


- (void)getActorsForProgram:(GetActorsForProgramRequest *)request withDelegate:(id <GetActorsForProgramDelegate>)delegate {
  NSLog(@"GETTING ACTORS START");
  NSString *extraPath = [NSString stringWithFormat:@"%@/%@/%@?%@%@&%@%@", API_PROGRAMS, request.programId, API_ACTORS, API_NUMENTRIES, API_NUMENTRIES_VALUE, API_SESSION, [[ConfigurationManager instance] getSessionID]];
  [self.httpClient getPath:extraPath
                parameters:nil success:^void(AFHTTPRequestOperation *operation, id result) {
    NSData *const data = result;
    if (data != nil) {
      NSLog(@"GETTING ACTORS FINISHED");
      NSArray *notificationsData = [data objectFromJSONData];
      GetActorsForProgramResponse *response = [[GetActorsForProgramResponse alloc] init];
      NSArray *actorsArray = [notificationsData valueForKey:@"entry_list"];
      if ([[notificationsData valueForKey:@"total_count"] intValue] > 0) {
        response.actorsArray = [[[NSMutableArray alloc] init] autorelease];
        for (NSDictionary *item in actorsArray) {
          Actor *actor = [[Actor alloc] init];
          actor.id = [item objectForKey:@"id"];
          actor.name = [item objectForKey:@"name"];
          actor.description = [item objectForKey:@"description"];
          actor.avatar = [item objectForKey:@"photo_id"];
          actor.birthDate = [item objectForKey:@"birthdate"];
          actor.height = [item objectForKey:@"height"];
          actor.nickname = [item objectForKey:@"nickname"];
          actor.role = [item objectForKey:@"role"];
          [response.actorsArray addObject:actor];
          [actor release];
        }
      }
      [delegate onGetActorsForProgramSuccess:response];
      [response release];
    } else {
      NSLog(@"nil data");
    }
  }
                   failure:^void(AFHTTPRequestOperation *operation, NSError *error) {
                     ErrorResponse *response = [ErrorResponse objectForOperation:operation andError:error];
                     response.whatFailed = @"getting actors";
                     response.errorTag = 200;
                     [delegate onError:response];
                   }
  ];
}


- (void)getFriendsForProfile:(GetFriendsRequest *)request withDelegate:(id <GetFriendsDelegate>)delegate {
  NSString *extraPath = [NSString stringWithFormat:@"%@/%@?%@%@&%@%@", API_PROFILE, API_FRIENDS, API_NUMENTRIES, API_NUMENTRIES_VALUE, API_SESSION, [[ConfigurationManager instance] getSessionID]];
  [self.httpClient getPath:extraPath
                parameters:nil success:^void(AFHTTPRequestOperation *operation, id result) {
    NSData *const data = result;
    if (data != nil) {
      NSArray *notificationsData = [data objectFromJSONData];
      GetFriendsResponse *response = [[GetFriendsResponse alloc] init];
      NSArray *friendsArray = [notificationsData valueForKey:@"entry_list"];
      if ([[notificationsData valueForKey:@"total_count"] intValue] > 0) {
        response.friendsArray = [[[NSMutableArray alloc] init] autorelease];
        for (NSDictionary *item in friendsArray) {
          Friend *friend = [[Friend alloc] init];
          friend.id = [item objectForKey:@"id"];
          friend.name = [item objectForKey:@"name"];
          friend.firstName = [item objectForKey:@"first_name"];
          friend.lastName = [item objectForKey:@"last_name"];
          friend.facebookId = [item objectForKey:@"facebook_id"];
          friend.sipStatus = [item objectForKey:@"sip_status"];
          friend.account = [item objectForKey:@"account"];
          friend.avatarId = [item objectForKey:@"avatar_id"];
          friend.currentChannelId = [item objectForKey:@"current_channel_id"];
          [response.friendsArray addObject:friend];
          [friend release];
        }
      }
      [delegate onGetFriendsSuccess:response];
      [response release];
    } else {
      NSLog(@"nil data");
    }
  }
                   failure:^void(AFHTTPRequestOperation *operation, NSError *error) {
                     ErrorResponse *response = [ErrorResponse objectForOperation:operation andError:error];
                     response.whatFailed = @"getting friends";
                     [delegate onError:response];
                   }
  ];
}


- (void)dealloc {
  [_httpClient release];
  [super dealloc];
}

@end
