//
//  GetProgramsOnChannelGuideOnTimeRequest.h
//  ngb-ipad
//
//  Created by Julian Król on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "BasicRequest.h"
#import "BasicDelegate.h"


@interface GetProgramsOnChannelGuideOnTimeRequest : BasicRequest {
  NSString *_channel_id;
  NSString *_startTimeStr;
  NSString *_endTimeStr;
}

@property(nonatomic, copy) NSString *channel_id;
@property(nonatomic, copy) NSString *startTimeStr;
@property(nonatomic, copy) NSString *endTimeStr;

@end


@interface GetProgramsOnChannelGuideOnTimeResponse : BasicResponse {
  NSString *_guide_id;
  NSString *_program_id;
  NSString *_startTime;
  NSString *_endTime;
}
@property(nonatomic, copy) NSString *guide_id;
@property(nonatomic, copy) NSString *program_id;
@property(nonatomic, copy) NSString *startTime;
@property(nonatomic, copy) NSString *endTime;


@end


@protocol GetProgramOnChannelInGuideOnTimeDelegate <BasicDelegate>

- (void)onGetProgramOnChannelInGuideOnTimeSuccess:(GetProgramsOnChannelGuideOnTimeResponse *)response;

@end