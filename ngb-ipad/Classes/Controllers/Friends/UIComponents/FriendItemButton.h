//
//  FriendItemButton.h
//  ngb-ipad
//
//  Created by Julian Król on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NINetworkImageView.h"
#import "Values.h"

@interface FriendItemButton : UIButton {
  UILabel *_friendNameLabel;
  NINetworkImageView *_friendAvatar;
  NSString *_friendId;
}

@property(nonatomic, retain) UILabel *friendNameLabel;
@property(nonatomic, copy) NSString *friendId;

- (id)initWithName:(NSString *)name andImage:(NSString *)pathToFriendAvatar andPosition:(CGPoint)position andId:(NSString *)id;

@end
