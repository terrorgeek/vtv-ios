/*
 * ProgramInfoTopPanelViewController
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "ProgramInfoTopPanelViewController.h"


@interface ProgramInfoTopPanelViewController ()
@property(nonatomic, retain) SimilarShowBarView *barView;

@end

@implementation ProgramInfoTopPanelViewController

@synthesize barView = _barView;
@synthesize posterPic = _posterPic;


- (void)viewDidLoad {
  [super viewDidLoad];

  self.posterPic = [[[NINetworkImageView alloc] init] autorelease];
  self.posterPic.frame = CGRectMake(0, 0, 768, 355);
  self.posterPic.contentMode = UIViewContentModeScaleAspectFill;
  self.posterPic.image = [UIImage imageNamed:@"mentalist.jpg"];
  [self.view addSubview:self.posterPic];

  self.barView = [[[SimilarShowBarView alloc] init] autorelease];
  self.barView.frame = CGRectMake(0, 255, 500, 100);
  [self.view addSubview:self.barView];
}


- (void)dealloc {
  [_barView release];
  [_posterPic release];
  [super dealloc];
}


@end