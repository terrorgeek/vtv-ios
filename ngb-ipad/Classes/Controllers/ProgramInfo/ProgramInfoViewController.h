//
//  ProgramInfoViewController.h
//  ngb-ipad
//
//  Created by Julian Król on 9/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseTabViewController.h"
#import "ProgramInfoLeftPanelViewController.h"
#import "ProgramInfoTopPanelViewController.h"
#import "ProgramInfoBottomPanelViewController.h"
#import "RemoteDataClient.h"
#import "MBProgressHUD.h"

@interface ProgramInfoViewController : BaseTabViewController<GetActorsForProgramDelegate>{
  Program *_oldProgram;
}
@property(nonatomic, retain) Program *oldProgram;


@end
