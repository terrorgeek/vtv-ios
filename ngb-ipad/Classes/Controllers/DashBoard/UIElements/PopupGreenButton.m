/*
 * PopupGreenButton
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/24/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "PopupGreenButton.h"


@implementation PopupGreenButton {

}
@synthesize title;

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    //self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"popup_green_button.png"]];
    [self setImage:[UIImage imageNamed:@"popup_green_button.png"] forState:UIControlStateNormal];
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.title setBackgroundColor:[UIColor clearColor]];
    [self.title setFont:[Fonts fontWithSize16]];
    [self.title setTextColor:[UIColor whiteColor]];
    [self.title setTextAlignment:UITextAlignmentCenter];
    [self addSubview:self.title];
  }
  return self;
}

- (void)dealloc {
  [title release];
  [super dealloc];
}


@end