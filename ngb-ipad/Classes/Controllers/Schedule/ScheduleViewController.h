//
//  ScheduleViewController.h
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseTabViewController.h"
#import "BannerView.h"
#import "ScheduleView.h"
#import "ScheduleData.h"

@interface ScheduleViewController : BaseViewController {
  BannerView *_bannerView;
  ScheduleView *_scheduleView;
}

@property(nonatomic, retain) BannerView *bannerView;
@property(nonatomic, retain) ScheduleView *scheduleView;

- (void)update:(Program *)program withIcon:(UIImage *)icon;


@end
