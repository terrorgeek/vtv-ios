//
//  LogInRequest.h
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BasicDelegate.h"
#import "BasicRequest.h"

@interface LogInRequest : BasicRequest

- (NSString *)getRequestHttpBody;

@end



@interface LogInResponse : BasicResponse{
@private
  NSString *_idStr;
  NSString *_user_idStr;
  NSString *_user_nameStr;
}

@property(nonatomic, copy) NSString *idStr;
@property(nonatomic, copy) NSString *user_idStr;
@property(nonatomic, copy) NSString *user_nameStr;


@end



@protocol LogInDelegate <BasicDelegate>

- (void)onGetLoginSuccess:(LogInResponse *)response;

@end