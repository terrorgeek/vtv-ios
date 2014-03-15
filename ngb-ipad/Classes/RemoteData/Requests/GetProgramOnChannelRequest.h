//
//  GetProgramOnChannelRequest.h
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "BasicRequest.h"
#import "BasicDelegate.h"
#import "Program.h"

@interface GetProgramOnChannelRequest : BasicRequest{
  NSString *_channelID;
}
@property(nonatomic, copy) NSString *channelID;


@end

@interface GetProgramOnChannelResponse:BasicResponse{
  Program *_program;
}
@property(nonatomic, retain) Program *program;

@end


@protocol GetProgramOnChannelDelegate <BasicDelegate>

- (void)onGetProgramOnChannelSuccess:(GetProgramOnChannelResponse *)response;

@end