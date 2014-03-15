/*
 * UpcommingShowView
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <sys/ucred.h>
#import "UpcommingShowView.h"
#import "Colors.h"
#import "Fonts.h"


@implementation UpcommingShowView {

}
@synthesize showImageView = _showImageView;
@synthesize youAreGoingLabel = _youAreGoingLabel;
@synthesize showNameLabel = _showNameLabel;
@synthesize addFriendsButton = _addFriendsButton;
@synthesize show = _show;

- (id)initWithImage:(UIImage *)image {
  self = [super init];
  if(self){
    UIImageView *mockUpImageView = [[[UIImageView alloc] initWithImage:image] autorelease];
    [mockUpImageView setFrame:CGRectMake(0, 0, mockUpImageView.image.size.width, 89)];
    [self addSubview:mockUpImageView];

    self.addFriendsButton = [[[UIButton alloc] init] autorelease];
    [self.addFriendsButton setFrame:CGRectMake(139, 50, 50, 25)];
    [self.addFriendsButton setBackgroundImage:[UIImage imageNamed:@"dashboard_invite_friends.png"] forState:UIControlStateNormal];
    [self.addFriendsButton addTarget:self action:@selector(onInviteButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.addFriendsButton];
  }
  return self;
}


-(void)onInviteButtonPressed {
  NSLog(@"Invite friends in upcoming shows pressed");
  [self.window.rootViewController.view addSubview:[PopupInviteFriends instance]];
}


- (void)dealloc {
  [_showImageView release];
  [_youAreGoingLabel release];
  [_showNameLabel release];
  [_addFriendsButton release];
  [_show release];
  [super dealloc];
}


@end