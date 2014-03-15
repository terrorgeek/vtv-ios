/*
 * ProgramInfoTopPanelViewController
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "BaseTopPanelViewController.h"
#import "FeaturedView.h"
#import "SimilarShowBarView.h"
#import "NINetworkImageView.h"

@interface ProgramInfoTopPanelViewController : BaseTopPanelViewController{
  SimilarShowBarView *_barView;
  NINetworkImageView *_posterPic;
}
@property(nonatomic, retain)NINetworkImageView *posterPic;

@end