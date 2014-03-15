/*
 * FeaturedView
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/21/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "FeaturedView.h"


@implementation FeaturedView {

}

@synthesize blackFrame;
@synthesize backgroundImageView = _backgroundImageView;

- (id)initWithImage:(UIImage *)image andPoint:(CGPoint)point {
  self = [super initWithFrame:CGRectMake(point.x, point.y, 768, 355)];
  if (self) {
    self.backgroundImageView = [[[NINetworkImageView alloc] initWithImage:image] autorelease];
    //self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.backgroundImageView setFrame:CGRectMake(0, 0, 768, 355)];
    [self addSubview:self.backgroundImageView];

    blackFrame = CGRectMake(0, 0.71 * 355 - 10, 768, 0.29 * 355 + 10);
    blackTransparentOverBackground = [[UIView alloc] initWithFrame:blackFrame];
    [blackTransparentOverBackground setBackgroundColor:[UIColor blackColor]];
    [blackTransparentOverBackground setAlpha:0.3];
    [self addSubview:blackTransparentOverBackground];
  }
  return self;
}


- (void)dealloc {
  [blackTransparentOverBackground release];
  [_backgroundImageView release];
  [super dealloc];
}


@end