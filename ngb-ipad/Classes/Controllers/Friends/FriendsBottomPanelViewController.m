//
//  FriendsBottomPanelViewController.m
//  ngb-ipad
//
//  Created by Julian Król on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendsBottomPanelViewController.h"


@interface FriendsBottomPanelViewController ()
@property(nonatomic, retain) UILabel *yourFriendsLabel;
@property(nonatomic, retain) UIImageView *dividerImg;
@property(nonatomic, retain) UIScrollView *scrollList;
@property(nonatomic, retain) NSMutableArray *friendsArray;


@end

@implementation FriendsBottomPanelViewController
@synthesize dividerImg = _dividerImg;
@synthesize yourFriendsLabel = _yourFriendsLabel;
@synthesize scrollList = _scrollList;
@synthesize friendsArray = _friendsArray;


- (void)viewDidLoad {
  [super viewDidLoad];

  self.friendsArray = [[[NSMutableArray alloc] init] autorelease];
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listenForNotification:) name:NOTIFICATION_SESSION_OBTAINED object:nil];
  [self initializeLabelComponents];
  [self loadFriends];
}


- (void)initializeLabelComponents {
  self.yourFriendsLabel = [[[UILabel alloc] initWithFrame:CGRectMake(20, 15, 200, 20)] autorelease];
  self.yourFriendsLabel.backgroundColor = [UIColor clearColor];
  self.yourFriendsLabel.textColor = [Colors blackColor];
  self.yourFriendsLabel.text = NSLocalizedString(@"your.friends", nil);
  [self.view addSubview:self.yourFriendsLabel];

  self.dividerImg = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dashboard_header_line.png"]] autorelease];
  [self.dividerImg setFrame:CGRectMake(10, 45, 692, 2)];
  [self.view addSubview:self.dividerImg];

  self.scrollList = [[[UIScrollView alloc] initWithFrame:CGRectMake(10, 50, 480, 500)] autorelease];
  self.scrollList.contentSize = CGSizeMake(440, 500);
  [self.view addSubview:self.scrollList];
}


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
  [self rotate];
}


- (void)rotate {
  if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft) ||
      ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)) {
    self.scrollList.frame = CGRectMake(10, 50, 480, 300);
  } else {
    self.scrollList.frame = CGRectMake(10, 50, 480, 500);
  }
}


#pragma mark - remote data client
- (void)listenForNotification:(NSNotification *)notification {
  [self loadFriends];
}


- (void)loadFriends {
  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  [[RemoteDataClient instance] getFriendsForProfile:nil withDelegate:self];
}


- (void)onGetFriendsSuccess:(GetFriendsResponse *)response {
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
  self.scrollList.contentSize = CGSizeMake(480, ([response.friendsArray count] / 2) * 220);
  if ([response.friendsArray count] > 0) {
    ((Friend *) [response.friendsArray objectAtIndex:0]).isSelected = YES;
  }
  [self.friendsArray addObjectsFromArray:response.friendsArray];
  [self drawFriends];
}


- (void)drawFriends {
  int counter = 0;
  for (Friend *friend in self.friendsArray) {
    CGPoint position;
    position.x = counter % 2;
    position.y = counter / 2;
    FriendItemButton *button = [[FriendItemButton alloc] initWithName:friend.name andImage:friend.avatarId andPosition:position andId:friend.id];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    if (!friend.isSelected) {
      [button setBackgroundImage:[UIImage imageNamed:@"friends_button_background_gray.png"] forState:UIControlStateNormal];
    } else {
      [button setBackgroundImage:[UIImage imageNamed:@"friends_button_background_green.png"] forState:UIControlStateNormal];
      [self.parentVC changeFriendWatchingLabel:friend.name];
    }
    [self.scrollList addSubview:button];
    [button release];
    counter++;
  }
}


- (void)buttonClicked:(id)sender {
  [self clearFriendsButtons];
  NSString *clickedFriendID = ((FriendItemButton *) sender).friendId;
  for (Friend *friend in self.friendsArray) {
    if ([friend.id isEqualToString:clickedFriendID]) {
      friend.isSelected = YES;
    } else {
      friend.isSelected = NO;
    }
  }
  [self drawFriends];
}


- (void)clearFriendsButtons {
  for (UIView *subview in self.scrollList.subviews) {
    if ([subview isKindOfClass:[FriendItemButton class]])
      [subview removeFromSuperview];
  }
}


- (void)onError:(ErrorResponse *)error {
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}


- (void)dealloc {
  [_dividerImg release];
  [_yourFriendsLabel release];
  [_scrollList release];
  [_friendsArray release];
  [super dealloc];
}

@end
