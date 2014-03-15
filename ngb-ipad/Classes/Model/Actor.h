//
//  Actor.h
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface Actor : NSObject{
  NSString *_id;
  NSString *_name;
  NSString *_description;
  NSString *_avatar;
  NSString *_birthDate;
  NSString *_height;
  NSString *_nickname;
  NSString *_role;
}

@property(nonatomic, copy) NSString *id;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *description;
@property(nonatomic, copy) NSString *avatar;
@property(nonatomic, copy) NSString *birthDate;
@property(nonatomic, copy) NSString *height;
@property(nonatomic, copy) NSString *role;
@property(nonatomic, copy) NSString *nickname;


@end
