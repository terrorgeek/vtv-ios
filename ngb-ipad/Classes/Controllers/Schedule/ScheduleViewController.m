//
//  ScheduleViewController.m
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScheduleViewController.h"

@interface ScheduleViewController ()

@end

@implementation ScheduleViewController
@synthesize bannerView = _bannerView;
@synthesize scheduleView = _scheduleView;


- (id)init {
  self = [super init];
  if (self) {
  }
  return self;
}


- (void)viewDidLoad {
  [super viewDidLoad];
  self.bannerView = [[[BannerView alloc] initWithFrame:CGRectMake(0, 0, 768, 355)] autorelease];
  [self.view addSubview:self.bannerView];

  self.scheduleView = [[[ScheduleView alloc] initWithFrame:CGRectMake(0, 355, 768, 669)] autorelease];
  self.scheduleView.parentViewController = self;
  [self.view addSubview:self.scheduleView];
}


- (void)viewDidAppear:(BOOL)animated {
  if ([[ScheduleData instance] getProgram] != nil)
    [self.scheduleView update:[[ScheduleData instance] getProgram]];
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
  [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
  [self rotate];
}


- (void)rotate {
  if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft) ||
      ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)) {
    // Landscape
    self.bannerView.frame = CGRectMake(0, 0, 1024, 300);
    self.scheduleView.frame = CGRectMake(0, 300, 1024, 468);
  } else {
    // Portrait
    self.bannerView.frame = CGRectMake(0, 0, 768, 355);
    self.scheduleView.frame = CGRectMake(0, 355, 768, 669);
  }
}


- (void)update:(Program *)program withIcon:(UIImage *)icon {
  [self.bannerView update:program withIcon:icon];
}


- (void)dealloc {
  [_bannerView release];
  [_scheduleView release];
  [super dealloc];
}

@end
