/*
 * WallMsgIsWatching
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/25/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "WallMsgIsWatching.h"


@implementation WallMsgIsWatching {

}
- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self.backgroundImage setImage:[UIImage imageNamed:@"dashboard_wall1.png"]];
    [self.backgroundImage setFrame:CGRectMake(0, 0, self.backgroundImage.image.size.width, self.backgroundImage.image.size.height)];

    [self.greenButton setImage:[UIImage imageNamed:@"dashboard_icon_watch.png"] forState:UIControlStateNormal];
    [self.greenButton addTarget:self action:@selector(onGreenButtonPressed) forControlEvents:UIControlEventTouchUpInside];
  }

  return self;
}

-(void)onGreenButtonPressed{
  [WToast showWithText:NSLocalizedString(@"dashboard.changeChannel", nil) length:kWTShort];
}

@end