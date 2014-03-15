//
//  UITabBarItem+Customization.m
//  ngb-ipad
//
//  Created by Julian Król on 9/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UITabBarItem+Customization.h"


@implementation UITabBarItem (Customization)

- (void)setTitle:(NSString *)title inActiveImage:(UIImage *)inactiveImage andActiveImage:(UIImage *)activeImage {
  [self setFinishedSelectedImage:activeImage withFinishedUnselectedImage:inactiveImage];
  [self setTitle:title];
}

@end
