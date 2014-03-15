/*
 * DashboardLeftPanel
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "BaseLeftPanelViewController.h"
#import "UpcommingShowView.h"
#import "UpcommingShowViewWide.h"
#import "YouAreWatchingView.h"
#import "WallView.h"

#import "Fonts.h"
#import "Colors.h"


@interface DashboardLeftPanelViewController : BaseLeftPanelViewController {
  UILabel *_youAreWatchingLabel;
  UIImageView *_youAreWatchingDivider;
  YouAreWatchingView *_youAreWatchingView;
  UILabel *_upcomingLabel;
  UIImageView *_upcomingDivider;
  UIScrollView *_upcomingScrollView;
  UIView *_upcomingContentView;
  UpcommingShowViewWide *_upcomingMockUp1;
  UpcommingShowViewWide *_upcomingMockUp2;
  UpcommingShowViewWide *_upcomingMockUp3;
  UpcommingShowViewWide *_upcomingMockUp4;
  WallView *_wallView;
}

@property(nonatomic, retain) UILabel *youAreWatchingLabel;
@property(nonatomic, retain) UIImageView *youAreWatchingDivider;
@property(nonatomic, retain) YouAreWatchingView *youAreWatchingView;
@property(nonatomic, retain) UILabel *upcomingLabel;
@property(nonatomic, retain) UIImageView *upcomingDivider;
@property(nonatomic, retain) UIScrollView *upcomingScrollView;
@property(nonatomic, retain) UIView *upcomingContentView;
@property(nonatomic, retain) UpcommingShowViewWide *upcomingMockUp1;
@property(nonatomic, retain) UpcommingShowViewWide *upcomingMockUp2;
@property(nonatomic, retain) UpcommingShowViewWide *upcomingMockUp4;
@property(nonatomic, retain) UpcommingShowViewWide *upcomingMockUp3;
@property(nonatomic, retain) WallView *wallView;


@end