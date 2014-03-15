//
//  FriendItemButton.m
//  ngb-ipad
//
//  Created by Julian Król on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendItemButton.h"

@interface FriendItemButton ()
@property(nonatomic, retain) NINetworkImageView *friendAvatar;

@end

@implementation FriendItemButton
@synthesize friendNameLabel = _friendNameLabel;
@synthesize friendAvatar = _friendAvatar;
@synthesize friendId = _friendId;


- (id)initWithName:(NSString *)name andImage:(NSString *)pathToFriendAvatar andPosition:(CGPoint)position andId:(NSString *)id{
  self = [super initWithFrame:CGRectMake(position.x * 240, position.y * 75, 233, 66)];
  self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"friends_button_background_gray.png"]];
  [self initNameLabel:name];
  [self initFriendAvatar:pathToFriendAvatar];
  self.friendId = id;
  return self;
}


- (void)initFriendAvatar:(NSString *)avatar {
  self.friendAvatar = [[[NINetworkImageView alloc] init] autorelease];
  self.friendAvatar.frame = CGRectMake(10, 8, 50, 50);
  self.friendAvatar.image = [UIImage imageNamed:@"unknown-person.png"];
  if (![avatar isEqualToString:@""])
    [self.friendAvatar setPathToNetworkImage:[self generatePictureURL:avatar] forDisplaySize:CGSizeMake(50, 50) contentMode:UIViewContentModeScaleAspectFit];
  [self addSubview:self.friendAvatar];
}


- (NSString *)generatePictureURL:(NSString *)avatarID {
  return [NSString stringWithFormat:@"%@%@/%@?%@", API_BASE_LINK_REQUEST, API_IMAGES, avatarID, API_FORMAT_IMAGE];
}


- (void)initNameLabel:(NSString *)friendName {
  self.friendNameLabel = [[[UILabel alloc] init] autorelease];
  self.friendNameLabel.font = [UIFont systemFontOfSize:16];
  if ([friendName length] > 20) {
    self.friendNameLabel.numberOfLines = 2;
    self.friendNameLabel.frame = CGRectMake(80, 15, 130, 40);
  } else {
    self.friendNameLabel.frame = CGRectMake(80, 25, 130, 20);
  }
  self.friendNameLabel.text = friendName;
  self.friendNameLabel.backgroundColor = [UIColor clearColor];
  [self addSubview:self.friendNameLabel];
}


- (void)dealloc {
  [_friendNameLabel release];
  [_friendAvatar release];
  [_friendId release];
  [super dealloc];
}


@end
