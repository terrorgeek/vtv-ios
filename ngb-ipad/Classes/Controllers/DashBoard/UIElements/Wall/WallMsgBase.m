/*
 * WallMsgBase
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/25/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "WallMsgBase.h"

@implementation WallMsgBase {

}
@synthesize backgroundImage = _backgroundImage;
@synthesize friendAvatar = _friendAvatar;
@synthesize friendName = _friendName;
@synthesize program = _program;
@synthesize greenButton = _greenButton;

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundImage = [[[UIImageView alloc] init] autorelease];
    [self.backgroundImage setFrame:CGRectMake(0, 0, 235, 128)];
    [self.backgroundImage setImage:[UIImage imageNamed:@"dashboard_wathching_background.png"]];
    [self addSubview:self.backgroundImage];

    self.friendAvatar = [[[UIImageView alloc] initWithFrame:CGRectMake(7, 5, 30, 30)] autorelease];
    [self addSubview:self.friendAvatar];

    self.friendName = [[[UILabel alloc] initWithFrame:CGRectMake(45, 5, 180, 30)] autorelease];
    [self.friendName setFont:[Fonts boldFontWithSize14]];
    [self.friendName setTextAlignment:UITextAlignmentLeft];
    [self.friendName setTextColor:[Colors blackColor]];
    [self.friendName setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.friendName];

    self.program = [[[ProgramView alloc] initWithFrame:CGRectMake(0, 40, 235, 85)] autorelease];
    [self addSubview:self.program];
    [self initializeButtons];
  }

  return self;
}


- (void)initializeButtons {
  self.greenButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [self.greenButton setFrame:CGRectMake(0, 62, 50, 25)];
  //[self addSubview:self.greenButton];
}


- (void)dealloc {
  [_backgroundImage release];
  [_greenButton release];
  [super dealloc];
}


@end