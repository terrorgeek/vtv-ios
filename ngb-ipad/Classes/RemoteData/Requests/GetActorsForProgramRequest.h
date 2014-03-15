//
//  GetActorsForProgramRequest.h
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "BasicRequest.h"
#import "BasicDelegate.h"

@interface GetActorsForProgramRequest : BasicRequest {
  NSString *_programId;
}

@property(nonatomic, copy) NSString *programId;


@end

@interface GetActorsForProgramResponse : BasicResponse {
  NSMutableArray *_actorsArray;
}
@property(nonatomic, retain) NSMutableArray *actorsArray;


@end

@protocol GetActorsForProgramDelegate <BasicDelegate>

- (void)onGetActorsForProgramSuccess:(GetActorsForProgramResponse *)response;

@end