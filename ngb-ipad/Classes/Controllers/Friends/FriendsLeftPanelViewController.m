//
//  FriendsLeftPanelViewController.m
//  ngb-ipad
//
//  Created by Julian Król on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendsLeftPanelViewController.h"

@interface FriendsLeftPanelViewController ()
@property(nonatomic, retain) UIImageView *dividerImg;
@property(nonatomic, retain) UILabel *friendsRequestsLabel;


@end

@implementation FriendsLeftPanelViewController
@synthesize dividerImg = _dividerImg;
@synthesize friendsRequestsLabel = _friendsRequestsLabel;


- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_left.png"]];
  [self initializeComponents];
  [self initializeFriendsRequests];
}


- (void)initializeFriendsRequests {
  FriendRequestView *friendsRequest1 = [[[FriendRequestView alloc] initWithFrame:CGRectMake(20, 60, 232, 65) andImage:@"friends_weronika.png"] autorelease];
  [self.view addSubview:friendsRequest1];
  FriendRequestView *friendsRequest2 = [[[FriendRequestView alloc] initWithFrame:CGRectMake(20, 130, 232, 65) andImage:@"friends_monika.png"] autorelease];
  [friendsRequest2 initializeButtons];
  [self.view addSubview:friendsRequest2];
  FriendRequestView *friendsRequest3 = [[[FriendRequestView alloc] initWithFrame:CGRectMake(20, 200, 232, 65) andImage:@"friends_sebastian.png"] autorelease];
  [friendsRequest3 initializeButtons];
  [self.view addSubview:friendsRequest3];
}


- (void)initializeComponents {
  self.friendsRequestsLabel = [[[UILabel alloc] initWithFrame:CGRectMake(20, 15, 200, 20)] autorelease];
  self.friendsRequestsLabel.backgroundColor = [UIColor clearColor];
  self.friendsRequestsLabel.textColor = [Colors blackColor];
  self.friendsRequestsLabel.text = NSLocalizedString(@"friend.requests", nil);
  [self.view addSubview:self.friendsRequestsLabel];

  self.dividerImg = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dashboard_header_line.png"]] autorelease];
  [self.dividerImg setFrame:CGRectMake(20, 45, 692, 2)];
  [self.view addSubview:self.dividerImg];
}


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
  [self rotate];
}


- (void)rotate {
  if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft) ||
      ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)) {
    // Landscape
  } else {
    // Portrait
  }
}


- (void)dealloc {
  [_dividerImg release];
  [_friendsRequestsLabel release];
  [super dealloc];
}

@end
