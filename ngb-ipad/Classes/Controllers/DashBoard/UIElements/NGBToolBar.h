//
//  NGBToolBar.h
//  ngb-ipad
//
//  Created by Michael Apanowicz on 10/8/12.
//  Copyright (c) 2012 michal.apanowicz@miquido.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotificationsManager.h"
#import "NotificationsPopUp.h"
#import "SocialPopUp.h"
#import "Colors.h"
#import "WToast.h"
#import "CustomBadge.h"

@interface NGBToolBar : UIView {
  UIButton *_notificationButton;
  UIButton *_facebookButton;
  UIButton *_twitterButton;
  UISearchBar *_searchBar;
  UIButton *_microphoneButton;
  NotificationsPopUp *_notifPopUpRef;
  SocialPopUp *_facebookPopUp;
  SocialPopUp *_twitterPopUp;
  UILabel *_titleLabel;
  CustomBadge *_notificationBadge;
}

@property(nonatomic, retain) UILabel *descriptionLabel;
@property(nonatomic, retain) UISearchBar *searchBar;
@property(nonatomic, retain) UIButton *microphoneButton;
@property(nonatomic, retain) SocialPopUp *facebookPopUp;
@property(nonatomic, retain) SocialPopUp *twitterPopUp;
@property(nonatomic, retain) CustomBadge *notificationBadge;


- (void)changeBadgeNumber:(NSInteger)num;

@end
