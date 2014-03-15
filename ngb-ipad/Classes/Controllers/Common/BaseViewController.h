//
//  BaseViewController.h
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "NGBToolBar.h"
@interface BaseViewController : UIViewController {
  NGBToolBar *_toolBar;
}

@property(nonatomic, retain) NGBToolBar *toolBar;

@end
