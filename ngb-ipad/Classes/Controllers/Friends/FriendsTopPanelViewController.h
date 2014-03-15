//
//  FriendsTopPanelViewController.h
//  ngb-ipad
//
//  Created by Julian Król on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseTopPanelViewController.h"
#import "WToast.h"
#import "PopupInviteFriends.h"

@interface FriendsTopPanelViewController : BaseTopPanelViewController {
  UIButton *_friends;
  UIButton *_thumbUp;
  UIButton *_thumbDown;
  UIButton *_calendar;
  UIButton *_tuneIn;
  UIButton *_readMore;
  UIButton *_heLikes;
  UIButton *_inCommon;
  UILabel *_showLabel;
  UILabel *_friendNameLabel;
  BOOL _isCommonSelected;
  BOOL _isHeLikesSelected;
}

- (void)changeFriendWatchingLabel:(NSString *)friendName;


@end
