//
//  ActorButton.m
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ActorButton.h"

@implementation ActorButton
@synthesize actorAvatar = _actorAvatar;
@synthesize actorNameLabel = _actorNameLabel;


- (void)initializeComponent {
  self.actorAvatar = [[[NINetworkImageView alloc] init] autorelease];
  self.actorAvatar.frame = CGRectMake(0, 0, ACTOR_PICTURE_WIDTH, ACTOR_PICTURE_HEIGHT);
  [self addSubview:self.actorAvatar];

  self.actorNameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, ACTOR_PICTURE_HEIGHT, ACTOR_PICTURE_WIDTH, 30)] autorelease];
  self.actorNameLabel.textColor = [Colors blackColor];
  self.actorNameLabel.backgroundColor = [UIColor clearColor];
  self.actorNameLabel.numberOfLines = 2;
  self.actorNameLabel.textAlignment = UITextAlignmentLeft;
  self.actorNameLabel.font = [UIFont systemFontOfSize:10];
  [self addSubview:self.actorNameLabel];
}


- (void)dealloc {
  [_actorAvatar release];
  [_actorNameLabel release];
  [super dealloc];
}


@end
