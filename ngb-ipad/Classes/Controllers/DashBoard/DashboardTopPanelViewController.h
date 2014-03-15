/*
 * DashboardTopPanelViewController
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "BaseTopPanelViewController.h"
#import "Fonts.h"
#import "Colors.h"
#import "Values.h"
#import "FeaturedView.h"
#import "Program.h"
#import "RemoteDataClient.h"
#import "ScheduleData.h"

@interface DashboardTopPanelViewController : BaseTopPanelViewController {
  FeaturedView *_featuredShowView;
  UIButton *_calendarButton;
  UILabel *_programNameLabel;
  Program *_program;
  NSString *_guide_id;
  NSString *_timeTableStr;
}
@property(nonatomic, copy) NSString *guide_id;

- (void)update:(Program *)program;

- (void)setStartTime:(NSString *)startStr andEndTime:(NSString *)endStr;

@end