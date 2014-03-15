//
//  BaseViewController.m
//  ngb-ipad
//
//  Created by Julian Król on 9/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

@synthesize toolBar = _toolBar;

- (id)init {
  self = [super init];
  if (self) {
  }
  return self;
}


- (void)viewDidLoad {
  [super viewDidLoad];
  self.toolBar = [[[NGBToolBar alloc] initWithFrame:CGRectMake(0, 0, 1024, 45)] autorelease];
  [self.navigationController.navigationBar addSubview:self.toolBar];
}


- (void)viewDidUnload {
  [super viewDidUnload];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
  [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
  [self rotate];
}


- (void)rotate {  
  if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft) || ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)) {
    // Landscape
    [self.toolBar.searchBar setFrame:CGRectMake(800, 7, 180, 30)];
    [self.toolBar.microphoneButton setFrame:CGRectMake(987, 4, 35, 35)];
  } else {
    // Portrait
    [self.toolBar.searchBar setFrame:CGRectMake(546, 7, 180, 30)];
    [self.toolBar.microphoneButton setFrame:CGRectMake(733, 4, 35, 35)];    
  }  
}


@end
