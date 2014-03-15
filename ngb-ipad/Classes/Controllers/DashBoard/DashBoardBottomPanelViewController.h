/*
 * DashBoardBottomPanelViewController
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "BaseBottomPanelViewController.h"
#import "DashBoardViewController.h"

#import "Colors.h"
#import "Fonts.h"


#import "ShowsView.h"
#import "UpcommingShowView.h"
#import "ShowsControl.h"


@interface DashBoardBottomPanelViewController : BaseBottomPanelViewController {
  UILabel *_showsLabel;
  UIImageView *_greenDivider;
  ShowsControl *_showsChooser;
  UIImageView *_grayDivider;
  ShowsView *_showsView;
  UILabel *_upComingLabel;
  UIImageView *_upcomingDivider;
  UIScrollView *_upcomingScrollView;
  UpcommingShowView *_upcomingShow1;
  UpcommingShowView *_upcomingShow2;
}

- (void)addEventToUpcomingShows:(Program *)program;

@end