/*
 * WallView
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/21/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "Colors.h"
#import "Fonts.h"

#import "WallMsgBase.h"
#import "WallMsgCalendarLetsWatch.h"
#import "WallMsgCalendarWatchWithMe.h"
#import "WallMsgIsWatching.h"
#import "WToast.h"
#import "RemoteDataClient.h"


@interface WallView : UIView {
  UILabel *_wallLabel;
  UIImageView *_dividerImageView;
  UIScrollView *_scrollView;
  UIView *_contentView;
}
@property(nonatomic, retain) UILabel *wallLabel;
@property(nonatomic, retain) UIImageView *dividerImageView;
@property(nonatomic, retain) UIScrollView *scrollView;
@property(nonatomic, retain) UIView *contentView;


@end