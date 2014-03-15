//
//  Notification.h
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface Notification : NSObject {
  NSString *_id;
  NSString *_name;
  NSString *_description;
  NSString *_fromId;
  NSString *_type;
  NSString *_status;
  NSString *_subjectId;
  NSString *_showName;
  NSString *_invitationFrom;
}

@property(nonatomic, copy) NSString *id;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *type;
@property(nonatomic, copy) NSString *fromId;
@property(nonatomic, copy) NSString *description;
@property(nonatomic, copy) NSString *status;
@property(nonatomic, copy) NSString *subjectId;
@property(nonatomic, copy) NSString *invitationFrom;
@property(nonatomic, copy) NSString *showName;


@end
