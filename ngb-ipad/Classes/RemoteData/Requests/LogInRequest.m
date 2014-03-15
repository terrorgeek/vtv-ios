//
//  LogInRequest.m
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Values.h"
#import "LogInRequest.h"
#import "ConfigurationManager.h"
#import "NSString+NimbusCore.h"


@implementation LogInRequest

- (NSString *)getRequestHttpBody {
  return [NSString stringWithFormat:@"{\"login\":\"%@\", \"password\":\"%@\" }",[[ConfigurationManager instance] login], [PASSWORD md5Hash]];
}

@end

@implementation LogInResponse
@synthesize idStr = _idStr;
@synthesize user_idStr = _user_idStr;
@synthesize user_nameStr = _user_nameStr;


- (void)dealloc {
  [_idStr release];
  [_user_idStr release];
  [_user_nameStr release];
  [super dealloc];
}

@end