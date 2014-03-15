//
//  Friend.h
//  ngb-ipad
//
//  Created by Julian Król on 09/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface Friend : NSObject{
  NSString *_id;
  NSString *_name;
  NSString *_firstName;
  NSString *_lastName;
  NSString *_facebookId;
  NSString *_sipStatus;
  NSString *_account;
  NSString *_currentChannelId;
  NSString *_avatarId;
  BOOL _isSelected;
}

@property(nonatomic, copy) NSString *id;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *firstName;
@property(nonatomic, copy) NSString *lastName;
@property(nonatomic, copy) NSString *facebookId;
@property(nonatomic, copy) NSString *sipStatus;
@property(nonatomic, copy) NSString *account;
@property(nonatomic, copy) NSString *currentChannelId;
@property(nonatomic, copy) NSString *avatarId;
@property(nonatomic) BOOL isSelected;


@end
