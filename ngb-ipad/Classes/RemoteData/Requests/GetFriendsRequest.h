//
//  GetFriendsRequest.h
//  ngb-ipad
//
//  Created by Julian Król on 09/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "BasicRequest.h"
#import "BasicDelegate.h"

@interface GetFriendsRequest : BasicRequest

@end


@interface GetFriendsResponse : BasicResponse{
  NSMutableArray *_friendsArray;
}

@property(nonatomic, retain) NSMutableArray *friendsArray;


@end


@protocol GetFriendsDelegate <BasicDelegate>

- (void)onGetFriendsSuccess:(GetFriendsResponse *)response;

@end