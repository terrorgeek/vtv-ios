/*
 * ShowsControlButton
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/22/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "ShowsControlButton.h"


@implementation ShowsControlButton {

}
@synthesize title;

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.title = [[[UILabel alloc] initWithFrame:frame] autorelease];
    [self.title setFont:[Fonts fontWithSize14]];
    [self.title setTextColor:[UIColor whiteColor]];
    [self.title setTextAlignment:UITextAlignmentCenter];
    [self.title setBackgroundColor:[UIColor clearColor] ];
    [self addSubview:self.title];

  }

  return self;
}

- (void)setFrame:(CGRect)frame {
  [super setFrame:frame];
  [self.title setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
}


- (void)dealloc {
  [title release];
  [super dealloc];
}


@end