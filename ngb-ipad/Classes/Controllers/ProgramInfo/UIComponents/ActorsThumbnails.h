//
//  ActorsThumbnails.h
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Actor.h"
#import "ActorButton.h"

@interface ActorsThumbnails : UIView {
  UIScrollView *_scrollView;
  NSMutableArray *_actorsArray;
}
@property(nonatomic, retain) UIScrollView *scrollView;


- (void)createComponent:(NSMutableArray *)actorsArray :(BOOL)isLandscape;

- (void)repaintComponent:(BOOL)isLandscape;

@end
