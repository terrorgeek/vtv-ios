//
//  FriendsViewController.m
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendsViewController.h"

@implementation FriendsViewController
- (id)init {
  self = [super init];
  if (self) {
  }
  return self;
}


- (void)viewDidLoad {
  [super viewDidLoad];
  self.toolBar.descriptionLabel.text = NSLocalizedString(@"friends", nil);
}


- (void)viewDidUnload {
  [super viewDidUnload];
}


- (BaseBottomPanelViewController *)createBottomPanel {
  FriendsBottomPanelViewController *bottomPanelVC = [[[FriendsBottomPanelViewController alloc] init] autorelease];
  bottomPanelVC.parentVC = self;
  return bottomPanelVC;
}


- (BaseTopPanelViewController *)createTopPanel {
  FriendsTopPanelViewController *topPanelVC = [[[FriendsTopPanelViewController alloc] init] autorelease];
  topPanelVC.parentVC = self;
  return topPanelVC;
}


- (BaseLeftPanelViewController *)createLeftPanel {
  FriendsLeftPanelViewController *leftPanelVC = [[[FriendsLeftPanelViewController alloc] init] autorelease];
  leftPanelVC.parentVC = self;
  return leftPanelVC;
}


- (void)changeFriendWatchingLabel:(NSString *)friendName {
  [((FriendsTopPanelViewController *) self.topPanel) changeFriendWatchingLabel:friendName];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)dealloc {
  [super dealloc];
}

@end
