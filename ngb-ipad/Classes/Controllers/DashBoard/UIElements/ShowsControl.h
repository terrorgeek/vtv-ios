/*
 * ShowsControl
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/22/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "Colors.h"
#import "Fonts.h"
#import "ShowsControlButton.h"


@interface ShowsControl : UIView {
  NSMutableArray *_arrayOfButtons;
  int activeSegment;
}
@property(nonatomic, retain) NSMutableArray *arrayOfButtons;
@property(nonatomic) int activeSegment;

- (id)initWithFrame:(CGRect)frame andFirstName:(NSString *)name1 second:(NSString *)name2 third:(NSString *)name3;


@end