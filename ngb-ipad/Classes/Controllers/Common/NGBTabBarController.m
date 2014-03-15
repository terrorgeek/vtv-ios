//
//  NGBTabBarController.m
//  ngb-ipad
//
//  Created by Julian Król on 9/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NGBTabBarController.h"

@interface NGBTabBarController ()

@end

@implementation NGBTabBarController

- (id)init {
  self = [super init];
  if (self) {
    [self initializeComponent];
  }
  return self;
}


- (void)initializeComponent {
  [self setViewControllers:[self createTabViewControllers]];

  UITabBar *tabBar = self.tabBar;
  tabBar.backgroundImage = [UIImage imageNamed:@"tab_bar_background_portrait.png"];

  CGFloat xAdjustment = 0.0;
  CGFloat yAdjustment = -3.0;

  NSDictionary *const textAttributesNormal = [NSDictionary dictionaryWithObjectsAndKeys:[Colors darkenGrayColor], UITextAttributeTextColor, nil];
  NSDictionary *const textAttributesHighlighted = [NSDictionary dictionaryWithObjectsAndKeys:[Colors greenColor], UITextAttributeTextColor, nil];

  for (UITabBarItem *item in tabBar.items) {
    [item setTitlePositionAdjustment:UIOffsetMake(xAdjustment, yAdjustment)];
    [item setTitleTextAttributes:textAttributesNormal forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttributesHighlighted forState:UIControlStateSelected];
  }

  UITabBarItem *dashBoardItem = [tabBar.items objectAtIndex:0];
  [dashBoardItem setTitle:NSLocalizedString(@"tab.dashboard", nil) inActiveImage:[UIImage imageNamed:@"tab_bar_icon_dashboard_selected.png"] andActiveImage:[UIImage imageNamed:@"tab_bar_icon_dashboard_selected.png"]];

  UITabBarItem *programInfoItem = [tabBar.items objectAtIndex:1];
  [programInfoItem setTitle:NSLocalizedString(@"tab.programInfo", nil) inActiveImage:[UIImage imageNamed:@"tab_bar_icon_program_info.png"] andActiveImage:[UIImage imageNamed:@"tab_bar_icon_program_info_active.png"]];

  UITabBarItem *scheduleItem = [tabBar.items objectAtIndex:2];
  [scheduleItem setTitle:NSLocalizedString(@"tab.guide", nil) inActiveImage:[UIImage imageNamed:@"tab_bar_icon_schedule.png"] andActiveImage:[UIImage imageNamed:@"tab_bar_icon_guide_active.png"]];

  UITabBarItem *calendar = [tabBar.items objectAtIndex:3];
  [calendar setTitle:NSLocalizedString(@"tab.schedule", nil) inActiveImage:[UIImage imageNamed:@"tab_bar_icon_calendar.png"] andActiveImage:[UIImage imageNamed:@"tab_bar_icon_schedule_active.png"]];

  UITabBarItem *friends = [tabBar.items objectAtIndex:4];
  [friends setTitle:NSLocalizedString(@"tab.friends", nil) inActiveImage:[UIImage imageNamed:@"tab_bar_icon_friends.png"] andActiveImage:[UIImage imageNamed:@"tab_bar_icon_friends_active.png"]];

  UITabBarItem *settings = [tabBar.items objectAtIndex:5];
  [settings setTitle:NSLocalizedString(@"tab.settings", nil) inActiveImage:[UIImage imageNamed:@"tab_bar_icon_settings.png"] andActiveImage:[UIImage imageNamed:@"tab_bar_icon_settings.png"]];
}

- (NSArray *)createTabViewControllers {
  UINavigationController *dashBoardNC = [[[UINavigationController alloc] initWithRootViewController:[[[DashBoardViewController alloc] init] autorelease]] autorelease];
  [dashBoardNC.navigationBar setHidden:NO];
  UINavigationController *programInfoNC = [[[UINavigationController alloc] initWithRootViewController:[[[ProgramInfoViewController alloc] init] autorelease]] autorelease];
  [programInfoNC.navigationBar setHidden:NO];
  UINavigationController *scheduleNC = [[[UINavigationController alloc] initWithRootViewController:[[[GuideViewController alloc] init] autorelease]] autorelease];
  [scheduleNC.navigationBar setHidden:NO];
  UINavigationController *calendarNC = [[[UINavigationController alloc] initWithRootViewController:[[[ScheduleViewController alloc] init] autorelease]] autorelease];
  [calendarNC.navigationBar setHidden:NO];
  UINavigationController *friendsNC = [[[UINavigationController alloc] initWithRootViewController:[[[FriendsViewController alloc] init] autorelease]] autorelease];
  [friendsNC.navigationBar setHidden:NO];
  UINavigationController *settingsNC = [[[UINavigationController alloc] initWithRootViewController:[[[SettingsViewController alloc] init] autorelease]] autorelease];

  return [NSArray arrayWithObjects:dashBoardNC, programInfoNC, scheduleNC, calendarNC, friendsNC, settingsNC, nil];
}

- (void)viewDidLoad {
  [super viewDidLoad];
}


- (void)viewDidUnload {
  [super viewDidUnload];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

@end
