//
//  ActorButton.h
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "NINetworkImageView.h"
#import "Values.h"
#import "Colors.h"

@interface ActorButton : UIButton{
  NINetworkImageView *_actorAvatar;
  UILabel *_actorNameLabel;
}

@property(nonatomic, retain) NINetworkImageView *actorAvatar;
@property(nonatomic, retain) UILabel *actorNameLabel;


-(void)initializeComponent;
@end
