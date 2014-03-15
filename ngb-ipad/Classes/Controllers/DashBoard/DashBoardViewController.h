//
//  DashBoardViewController.h
//  ngb-ipad
//
//  Created by Julian Król on 9/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseTabViewController.h"
#import "DashboardLeftPanelViewController.h"
#import "DashboardTopPanelViewController.h"
#import "DashBoardBottomPanelViewController.h"
#import "RemoteDataClient.h"
#import "MBProgressHUD.h"
#import "NGBToolBar.h"
#import "NotificationsManager.h"

@interface DashBoardViewController : BaseTabViewController <LogInDelegate,
    GetProfileDelegate,
    GetNotificationsDelegate,
    GetProgramOnChannelDelegate,
    GetFriendsDelegate,
    UIAlertViewDelegate,
    GetProgramOnChannelInGuideOnTimeDelegate,
    GetProgramDelegate> {
  BOOL _onceExecutedFlag;
}

- (void)addEventToUpcomingShows:(Program *)program;

@end
