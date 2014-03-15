//
//  GetProfileRequest.h
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BasicRequest.h"
#import "BasicDelegate.h"

@interface GetProfileRequest : BasicRequest

@end

@interface GetProfileResponse : BasicResponse {
@private
  NSString *_id;
  NSString *_name;
  NSString *_first_name;
  NSString *_last_name;
  NSString *_current_channel_id;
}

@property(nonatomic, copy) NSString *id;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *last_name;
@property(nonatomic, copy) NSString *first_name;
@property(nonatomic, copy) NSString *current_channel_id;


@end


@protocol GetProfileDelegate <BasicDelegate>

- (void)onGetProfileSuccess:(GetProfileResponse *)response;

@end