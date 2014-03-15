//
//  FriendRequestView.h
//  ngb-ipad
//
//  Created by Julian Król on 10/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Values.h"

@interface FriendRequestView : UIView {
  UIButton *_accept;
  UIButton *_discard;
}
- (id)initWithFrame:(CGRect)frame andImage:(NSString *)imageName;

- (void)initializeButtons;


@end
