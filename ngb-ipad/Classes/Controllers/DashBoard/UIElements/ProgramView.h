//
//  ProgramView.h
//  ngb-ipad
//
//  Created by Michael Apanowicz on 10/8/12.
//  Copyright (c) 2012 michal.apanowicz@miquido.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LikeAmountLabel.h"
#import "WToast.h"

@interface ProgramView : UIView {
  UIImageView *_programImageView;
  UILabel *_programNameLabel;
  UIButton *_friendsButton;
  LikeAmountLabel *_likeAmountView;
  UIImageView *_progressBar;
  UIButton *_likeButton;
  UIButton *_dislikeButton;
}

@property(nonatomic, retain) UIImageView *programImageView;
@property(nonatomic, retain) UILabel *programNameLabel;
@property(nonatomic, retain) UIButton *friendsButton;
@property(nonatomic, retain) LikeAmountLabel *likeAmountView;
@property(nonatomic, retain) UIImageView *progressBar;


@end
