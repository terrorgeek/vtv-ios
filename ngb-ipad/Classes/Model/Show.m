/*
 * Show
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "Show.h"


@implementation Show {

}
@synthesize showName = _showName;

- (void)dealloc {
  [_showName release];
  [super dealloc];
}


@end