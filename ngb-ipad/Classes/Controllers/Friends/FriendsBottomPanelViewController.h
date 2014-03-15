//
//  FriendsBottomPanelViewController.h
//  ngb-ipad
//
//  Created by Julian Król on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseBottomPanelViewController.h"
#import "RemoteDataClient.h"
#import "MBProgressHUD.h"
#import "Colors.h"
#import "FriendButton.h"
#import "FriendItemButton.h"
#import "FriendsTopPanelViewController.h"

@interface FriendsBottomPanelViewController : BaseBottomPanelViewController<GetFriendsDelegate>{
  UILabel *_yourFriendsLabel;
  UIImageView *_dividerImg;
  UIScrollView *_scrollList;
  NSMutableArray *_friendsArray;
}


@end
