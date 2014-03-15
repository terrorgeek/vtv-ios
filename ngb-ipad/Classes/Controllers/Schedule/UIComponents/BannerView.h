//
//  BannerView.h
//  ngb-ipad
//
//  Created by Julian Król on 10/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WToast.h"
#import "NINetworkImageView.h"
#import "PopupInviteFriends.h"
#import "Program.h"
#import "ConfigurationManager.h"

@interface BannerView : UIView {
  UIButton *_friends;
  UIButton *_thumbUp;
  UIButton *_thumbDown;
  UIButton *_calendar;
  UIButton *_tuneIn;
  UIButton *_readMore;
  NINetworkImageView *_posterPicture;
  NINetworkImageView *_miniMoviePic;
  UIImageView *_leftDivider;
  UIImageView *_rightDivider;
  UIImageView *_filtr;
  UIImageView *_mockShow1;
  UIImageView *_mockShow2;
  UILabel *_similarShows;
  UILabel *_showName;
  UILabel *_channelNameLabel;
  UILabel *_movieDateLabel;
  UILabel *_starsLabel;
  UILabel *_producersName;
  UITextView *_movieDescription;
  UISegmentedControl *_segmentControl;
}

@property(nonatomic, retain) NINetworkImageView *posterPicture;
@property(nonatomic, retain) NINetworkImageView *miniMoviePic;


- (void)update:(Program *)program withIcon:(UIImage *)icon;


@end
