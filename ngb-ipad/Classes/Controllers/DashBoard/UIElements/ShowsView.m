/*
 * ShowsView
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/21/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "ShowsView.h"


@implementation ShowsView {

}
@synthesize scrollView = _scrollView;
@synthesize contentView = _contentView;

CGFloat showWidth = 208;
CGFloat showHeight = 81;


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self reload];
  }

  return self;
}

- (void)reload {
  CGRect frame = self.frame;
  int numberOfShows = 8;
  possibleNumberOfColumns = (int) (CGFloat) floor(frame.size.width / 208);

  // Looking if we have to add extra line to content
  int addOneExtra = 0;
  CGFloat divide = ((CGFloat) numberOfShows) / ((CGFloat) possibleNumberOfColumns);
  int divideInt = (int) divide;

  if ((divide - divideInt) > 0)
    addOneExtra++;

  [self.contentView removeFromSuperview];
  self.contentView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, (numberOfShows / possibleNumberOfColumns + addOneExtra) * 113 + 30)] autorelease];

  for (int i = 0; i < numberOfShows; i++) {
    UIView *show;
    show = [self createShowWithPosition:CGPointMake((i % possibleNumberOfColumns) * 230, (i / possibleNumberOfColumns) * 113) withIndex:i];
    [self.contentView addSubview:show];
  }
  [self.contentView setBackgroundColor:[UIColor clearColor]];

  self.scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)] autorelease];
  [self.scrollView setContentSize:self.contentView.frame.size];
  [self.scrollView setBackgroundColor:[UIColor clearColor]];
  [self.scrollView addSubview:self.contentView];
  [self addSubview:self.scrollView];
}


- (UIView *)createShowWithPosition:(CGPoint)point withIndex:(int)index {
  return [[[OneShowView alloc] initWithFrame:CGRectMake(point.x, point.y, showWidth, showHeight) withIndex:index] autorelease];
}


- (void)dealloc {
  [_scrollView release];
  [_contentView release];
  [super dealloc];
}


@end