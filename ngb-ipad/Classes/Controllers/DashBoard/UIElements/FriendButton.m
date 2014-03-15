/*
 * FriendButton
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/24/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "FriendButton.h"


@implementation FriendButton {

}
@synthesize isChecked = _isChecked;
@synthesize avatar = _avatar;
@synthesize friendName = _friendName;


- (id)initWithPoint:(CGPoint)point {
  self = [super initWithFrame:CGRectMake(point.x, point.y, 238, 69)];
  if (self) {
    _isChecked = NO;
    if (_isChecked) {
      self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"popup_friend_button_green.png"]];
    } else {
      self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"popup_friend_button_gray.png"]];
    }
  }
  [self addTarget:self action:@selector(buttonMarked) forControlEvents:UIControlEventTouchUpInside];

  self.avatar = [[[NINetworkImageView alloc] initWithImage:[UIImage imageNamed:@"unknown-person.png"]] autorelease];
  [self.avatar setFrame:CGRectMake(10, 10, 50, 50)];
  [self addSubview:self.avatar];

  self.friendName = [[[UILabel alloc] initWithFrame:CGRectMake(80, 20, 150, 50)] autorelease];
  [self.friendName setTextColor:[Colors blackColor]];
  [self.friendName setTextAlignment:UITextAlignmentLeft];
  [self.friendName setFont:[Fonts fontWithSize16]];
  [self.friendName setBackgroundColor:[UIColor clearColor]];
  [self addSubview:self.friendName];

  return self;
}

- (void)buttonMarked {
  if (self.isChecked) {
    _isChecked = NO;
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"popup_friend_button_gray.png"]];
  } else {
    _isChecked = YES;
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"popup_friend_button_green.png"]];
  }
}

- (void)dealloc {
  [_avatar release];
  [_friendName release];
  [super dealloc];
}


@end