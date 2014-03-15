//
//  BaseTabViewController.m
//  ngb-ipad
//
//  Created by Julian Król on 9/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
////

#import "BaseTabViewController.h"

@interface BaseTabViewController ()
@property(nonatomic, readwrite, retain) BaseLeftPanelViewController *leftPanel;
@property(nonatomic, readwrite, retain) BaseTopPanelViewController *topPanel;
@property(nonatomic, readwrite, retain) BaseBottomPanelViewController *bottomPanel;


@end

@implementation BaseTabViewController
@synthesize leftPanel = _leftPanel;
@synthesize topPanel = _topPanel;
@synthesize bottomPanel = _bottomPanel;
@synthesize leftPanelWidth = _leftPanelWidth;
@synthesize topPanelHeight = _topPanelHeight;


- (id)init {
  self = [super init];
  if (self) {
    self.leftPanelWidth = 250;
    self.topPanelHeight = 350;
  }
  return self;
}


- (void)initializeComponents {
  self.leftPanel = [self createLeftPanel];
  [self.view addSubview:self.leftPanel.view];

  self.topPanel = [self createTopPanel];
  [self.view addSubview:self.topPanel.view];

  self.bottomPanel = [self createBottomPanel];
  [self.view addSubview:self.bottomPanel.view];

  self.leftPanel.view.frame = CGRectMake(0, 355, 280, 580);
  self.topPanel.view.frame = CGRectMake(0, 0, 768, 355);
  self.bottomPanel.view.frame = CGRectMake(280, 355, 488, 580);
}


- (BaseLeftPanelViewController *)createLeftPanel {
  [self doesNotRecognizeSelector:_cmd];
  return nil;
}

- (BaseTopPanelViewController *)createTopPanel {
  [self doesNotRecognizeSelector:_cmd];
  return nil;
}

- (BaseBottomPanelViewController *)createBottomPanel {
  [self doesNotRecognizeSelector:_cmd];
  return nil;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initializeComponents];
}


- (void)viewDidUnload {
  [super viewDidUnload];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self rotateScreen];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];

  [UIView animateWithDuration:0.5 animations:^void() {
    [self.view setAlpha:0];
  }                completion:^void(BOOL animated) {
    [self rotateScreen];

  }];

}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
  [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
  [UIView animateWithDuration:0.5 animations:^void() {
    [self.view setAlpha:1];
  }];
}

- (void)rotateScreen {
  [self.leftPanel rotate];
  [self.bottomPanel rotate];
  if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft) || ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)) {
    // Landscape
    self.leftPanel.view.frame = CGRectMake(0, 0, 280, 730);
    self.topPanel.view.frame = CGRectMake(280, 0, 768, 355);
    self.bottomPanel.view.frame = CGRectMake(280, 355, 768, 375);
  } else {
    // Portrait
    self.leftPanel.view.frame = CGRectMake(0, 355, 280, 600);
    self.topPanel.view.frame = CGRectMake(0, 0, 768, 355);
    self.bottomPanel.view.frame = CGRectMake(280, 355, 488, 600);
  }

}

- (void)setUpLeftPanel:(BaseLeftPanelViewController *)controller {
  self.leftPanel = controller;
}


- (void)setUpTopPanel:(BaseTopPanelViewController *)controller {
  self.topPanel = controller;
}


- (void)setUpBottomPanel:(BaseBottomPanelViewController *)controller {
  self.bottomPanel = controller;
}


- (void)dealloc {
  [_bottomPanel release];
  [_leftPanel release];
  [_topPanel release];
  [super dealloc];
}

@end
