//
//  BaseLeftPanelViewController.h
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface BaseLeftPanelViewController : UIViewController{
  id _parentVC;
}
@property(nonatomic, retain) id parentVC;

-(void)rotate;

@end
