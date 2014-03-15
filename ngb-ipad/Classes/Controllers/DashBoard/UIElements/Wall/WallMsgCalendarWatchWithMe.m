/*
 * WallMsgCalendarWatchWithMe
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/25/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "WallMsgCalendarWatchWithMe.h"


@implementation WallMsgCalendarWatchWithMe {

}
- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self.backgroundImage setImage:[UIImage imageNamed:@"dashboard_wall3.png"]];
    [self.backgroundImage setFrame:CGRectMake(0, 0, 235, 103)];

    [self.greenButton setImage:[UIImage imageNamed:@"dashboard_icon_calendar.png"] forState:UIControlStateNormal];
    [self.greenButton addTarget:self action:@selector(onGreenButtonPressed) forControlEvents:UIControlEventTouchUpInside];
  }

  return self;
}

-(void)onGreenButtonPressed{
  [WToast showWithText:NSLocalizedString(@"dashboard.addedToCalendar", nil) length:kWTShort];
}


@end