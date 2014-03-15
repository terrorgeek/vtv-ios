//
//  BaseTabViewController.h
//  ngb-ipad
//
//  Created by Julian Król on 9/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "BaseLeftPanelViewController.h"
#import "BaseTopPanelViewController.h"
#import "BaseBottomPanelViewController.h"

@interface BaseTabViewController : BaseViewController {
  BaseLeftPanelViewController *_leftPanel;
  BaseTopPanelViewController *_topPanel;
  BaseBottomPanelViewController *_bottomPanel;
  CGFloat _leftPanelWidth;
  CGFloat _topPanelHeight;
}

@property(nonatomic, readonly) BaseLeftPanelViewController *leftPanel;
@property(nonatomic, readonly) BaseTopPanelViewController *topPanel;
@property(nonatomic, readonly) BaseBottomPanelViewController *bottomPanel;
@property(nonatomic) CGFloat leftPanelWidth;
@property(nonatomic) CGFloat topPanelHeight;

- (BaseLeftPanelViewController *)createLeftPanel;

- (BaseTopPanelViewController *)createTopPanel;

- (BaseBottomPanelViewController *)createBottomPanel;


- (void)setUpLeftPanel:(BaseLeftPanelViewController *)controller;

- (void)setUpTopPanel:(BaseTopPanelViewController *)controller;

- (void)setUpBottomPanel:(BaseBottomPanelViewController *)controller;
@end
