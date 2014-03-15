//
//  GetProgramRequest.h
//  ngb-ipad
//
//  Created by Julian Król on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "BasicRequest.h"
#import "Program.h"
#import "BasicDelegate.h"

@interface GetProgramRequest : BasicRequest {
  NSString *_program_id;
}

@property(nonatomic, copy) NSString *program_id;

@end


@interface GetProgramResponse : BasicResponse {
  Program *_program;
}
@property(nonatomic, retain) Program *program;


@end


@protocol GetProgramDelegate <BasicDelegate>

- (void)onGetProgramSuccess:(GetProgramResponse *)response;

@end