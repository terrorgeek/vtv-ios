/*
 * ShowsView
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/21/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "OneShowView.h"


@interface ShowsView : UIView {
  UIScrollView *_scrollView;
  UIView *_contentView;

  int possibleNumberOfColumns;
}
@property(nonatomic, retain) UIScrollView *scrollView;
@property(nonatomic, retain) UIView *contentView;

- (void)reload;


@end