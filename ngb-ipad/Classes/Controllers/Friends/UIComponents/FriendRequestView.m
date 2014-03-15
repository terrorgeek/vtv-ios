//
//  FriendRequestView.m
//  ngb-ipad
//
//  Created by Julian Król on 10/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendRequestView.h"

@interface FriendRequestView ()
@property(nonatomic, retain) UIButton *discard;
@property(nonatomic, retain) UIButton *accept;


@end

@implementation FriendRequestView
@synthesize discard = _discard;
@synthesize accept = _accept;


- (id)initWithFrame:(CGRect)frame andImage:(NSString *)imageName {
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
  }
  return self;
}


- (void)initializeButtons {
  self.accept = [[[UIButton alloc] initWithFrame:CGRectMake(160, 30, 35, 35)] autorelease];
  [self.accept setImage:[UIImage imageNamed:@"friends_button_accept.png"] forState:UIControlStateNormal];
  [self.accept addTarget:self action:@selector(hideButton) forControlEvents:UIControlEventTouchUpInside];
  [self addSubview:self.accept];

  self.discard = [[[UIButton alloc] initWithFrame:CGRectMake(195, 30, 35, 35)] autorelease];
  [self.discard setImage:[UIImage imageNamed:@"friends_button_cancel.png"] forState:UIControlStateNormal];
  [self.discard addTarget:self action:@selector(hideButton) forControlEvents:UIControlEventTouchUpInside];
  [self addSubview:self.discard];
}


- (void)hideButton {
  [UIView animateWithDuration:NORMAL_SPEED_ANIMATION animations:^void() {
    self.alpha = 0;
  }
                   completion:nil];

}


- (void)dealloc {
  [_discard release];
  [_accept release];
  [super dealloc];
}


@end
