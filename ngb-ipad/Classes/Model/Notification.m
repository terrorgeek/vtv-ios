//
//  Notification.m
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Notification.h"

@implementation Notification
@synthesize id = _id;
@synthesize name = _name;
@synthesize type = _type;
@synthesize fromId = _fromId;
@synthesize description = _description;
@synthesize status = _status;
@synthesize subjectId = _subjectId;
@synthesize invitationFrom = _invitationFrom;
@synthesize showName = _showName;


- (void)dealloc {
  [_id release];
  [_name release];
  [_type release];
  [_fromId release];
  [_description release];
  [_status release];
  [_subjectId release];
  [_invitationFrom release];
  [_showName release];
  [super dealloc];
}


@end
