//
//  Friend.m
//  ngb-ipad
//
//  Created by Julian Król on 09/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Friend.h"

@implementation Friend
@synthesize id = _id;
@synthesize name = _name;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize facebookId = _facebookId;
@synthesize sipStatus = _sipStatus;
@synthesize account = _account;
@synthesize currentChannelId = _currentChannelId;
@synthesize avatarId = _avatarId;
@synthesize isSelected = _isSelected;


- (void)dealloc {
  [_id release];
  [_name release];
  [_firstName release];
  [_lastName release];
  [_facebookId release];
  [_sipStatus release];
  [_account release];
  [_currentChannelId release];
  [_avatarId release];
  [super dealloc];
}


@end
