//
//  Actor.m
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Actor.h"

@implementation Actor
@synthesize id = _id;
@synthesize name = _name;
@synthesize description = _description;
@synthesize avatar = _avatar;
@synthesize birthDate = _birthDate;
@synthesize height = _height;
@synthesize role = _role;
@synthesize nickname = _nickname;


- (void)dealloc {
  [_id release];
  [_name release];
  [_description release];
  [_avatar release];
  [_birthDate release];
  [_height release];
  [_role release];
  [_nickname release];
  [super dealloc];
}


@end
