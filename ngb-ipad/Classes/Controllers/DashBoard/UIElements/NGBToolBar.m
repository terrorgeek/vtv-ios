//
//  NGBToolBar.m
//  ngb-ipad
//
//  Created by Michael Apanowicz on 10/8/12.
//  Copyright (c) 2012 michal.apanowicz@miquido.com. All rights reserved.
//

#import "NGBToolBar.h"

@interface NGBToolBar ()
@property(nonatomic, retain) UIButton *notificationButton;
@property(nonatomic, retain) UIButton *facebookButton;
@property(nonatomic, retain) UIButton *twitterButton;
@property(nonatomic, retain) NotificationsPopUp *notifPopUpRef;
@property(nonatomic, retain) UILabel *titleLabel;


@end

@implementation NGBToolBar

@synthesize notificationButton = _notificationButton;
@synthesize facebookButton = _facebookButton;
@synthesize twitterButton = _twitterButton;
@synthesize searchBar = _searchBar;
@synthesize microphoneButton = _microphoneButton;
@synthesize notifPopUpRef = _notifPopUpRef;
@synthesize facebookPopUp = _facebookPopUp;
@synthesize twitterPopUp = _twitterPopUp;
@synthesize descriptionLabel = _descriptionLabel;
@synthesize notificationBadge = _notificationBadge;
@synthesize titleLabel = _titleLabel;


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    UIImage *backgroundImage = [UIImage imageNamed:@"toolbar_background.png"];
    UIImageView *backgroundImageView = [[[UIImageView alloc] initWithImage:backgroundImage] autorelease];
    [backgroundImageView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [self addSubview:backgroundImageView];

    self.notificationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.notificationButton setFrame:CGRectMake(10, 7, 30, 30)];
    [self.notificationButton setBackgroundColor:[UIColor clearColor]];
    [self.notificationButton setImage:[UIImage imageNamed:@"toolbar_notifications.png"] forState:UIControlStateNormal];
    [self.notificationButton addTarget:self action:@selector(showNotifications) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.notificationButton];

    self.notificationBadge = [CustomBadge customBadgeWithString:@"3" withStringColor:[UIColor whiteColor] withInsetColor:[UIColor orangeColor] withBadgeFrame:NO withBadgeFrameColor:[UIColor whiteColor] withScale:0.7 withShining:YES];

    [self.notificationBadge setFrame:CGRectMake(30, 1, 20, 20)];
    [self addSubview:self.notificationBadge];

    self.facebookButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.facebookButton setFrame:CGRectMake(50, 7, 30, 30)];
    [self.facebookButton setBackgroundColor:[UIColor clearColor]];
    [self.facebookButton setImage:[UIImage imageNamed:@"toolbar_facebook.png"] forState:UIControlStateNormal];
    [self.facebookButton addTarget:self action:@selector(showFacebookNotifications) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.facebookButton];

    self.twitterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.twitterButton setFrame:CGRectMake(90, 7, 30, 30)];
    [self.twitterButton setBackgroundColor:[UIColor clearColor]];
    [self.twitterButton setImage:[UIImage imageNamed:@"toolbar_twitter.png"] forState:UIControlStateNormal];
    [self.twitterButton addTarget:self action:@selector(showTwitterNotifications) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.twitterButton];

    self.searchBar = [[[UISearchBar alloc] initWithFrame:CGRectMake(546, 7, 180, 30)] autorelease];
    [self.searchBar setBackgroundImage:nil];
    [[self.searchBar.subviews objectAtIndex:0] removeFromSuperview];
    [self addSubview:self.searchBar];

    self.microphoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.microphoneButton setFrame:CGRectMake(733, 4, 35, 35)];
    [self.microphoneButton setBackgroundColor:[UIColor clearColor]];
    [self.microphoneButton setImage:[UIImage imageNamed:@"toolbar_microphone.png"] forState:UIControlStateNormal];
    [self.microphoneButton addTarget:self action:@selector(microphonePressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.microphoneButton];

    self.titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(200, 5, 368, 30)] autorelease];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textColor = [Colors blackColor];
    self.titleLabel.text = NSLocalizedString(@"title.kovue", nil);
    self.titleLabel.textAlignment = UITextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:28];
    [self addSubview:self.titleLabel];

  }
  return self;
}

#pragma mark - Buttons actions

- (void)showFacebookNotifications {
  if (self.facebookPopUp == nil) {
    [self chceckAndRemoveNotifications];
    [self chceckAndRemoveTwitter];

    SocialPopUp *popUp = [[[SocialPopUp alloc] initWithFrame:CGRectMake(0, 64, 1024, 1024)] autorelease];
    self.facebookPopUp = popUp;
    [self.facebookPopUp.popupBackground setImage:[UIImage imageNamed:@"notifications_facebook_background.png"]];
    [self.facebookPopUp.socialLogo setImage:[UIImage imageNamed:@"notifications_facebook_logo.png"]];

    UIImageView *fb1 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 233, 72)] autorelease];
    [fb1 setImage:[UIImage imageNamed:@"notifications_facebook1.png"]];
    [self.facebookPopUp.scrollView addSubview:fb1];

    UIImageView *fb2 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 78, 233, 72)] autorelease];
    [fb2 setImage:[UIImage imageNamed:@"notifications_facebook2.png"]];
    [self.facebookPopUp.scrollView addSubview:fb2];

    UIImageView *fb3 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 156, 233, 72)] autorelease];
    [fb3 setImage:[UIImage imageNamed:@"notifications_facebook3.png"]];
    [self.facebookPopUp.scrollView addSubview:fb3];

    UIImageView *fb4 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 234, 233, 72)] autorelease];
    [fb4 setImage:[UIImage imageNamed:@"notifications_facebook1.png"]];
    [self.facebookPopUp.scrollView addSubview:fb4];

    [self.facebookPopUp.scrollView setContentSize:CGSizeMake(233, 306)];

    [self.window.rootViewController.view addSubview:popUp];
  } else {
    [self chceckAndRemoveFacebook];
  }
}

- (void)showTwitterNotifications {
  if (self.twitterPopUp == nil) {
    [self chceckAndRemoveFacebook];
    [self chceckAndRemoveNotifications];

    SocialPopUp *popUp = [[[SocialPopUp alloc] initWithFrame:CGRectMake(0, 64, 1024, 1024)] autorelease];
    self.twitterPopUp = popUp;
    [self.twitterPopUp.popupBackground setImage:[UIImage imageNamed:@"notifications_twitter_background@2x.png"]];
    [self.twitterPopUp.socialLogo setImage:[UIImage imageNamed:@"notifications_twitter_logo@2x.png"]];
    UIImageView *tweet1 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 233, 72)] autorelease];
    [tweet1 setImage:[UIImage imageNamed:@"notifications_tweet1@2x.png"]];
    [self.twitterPopUp.scrollView addSubview:tweet1];

    UIImageView *tweet2 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 78, 233, 72)] autorelease];
    [tweet2 setImage:[UIImage imageNamed:@"notifications_tweet2@2x.png"]];
    [self.twitterPopUp.scrollView addSubview:tweet2];

    UIImageView *tweet3 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 156, 233, 72)] autorelease];
    [tweet3 setImage:[UIImage imageNamed:@"notifications_tweet3@2x.png"]];
    [self.twitterPopUp.scrollView addSubview:tweet3];

    UIImageView *tweet4 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 234, 233, 72)] autorelease];
    [tweet4 setImage:[UIImage imageNamed:@"notifications_tweet1@2x.png"]];
    [self.twitterPopUp.scrollView addSubview:tweet4];

    [self.twitterPopUp.scrollView setContentSize:CGSizeMake(233, 306)];


    [self.window.rootViewController.view addSubview:popUp];
  } else {
    [self chceckAndRemoveTwitter];
  }
}

- (void)showNotifications {
  if (self.notifPopUpRef == nil) {
    [self chceckAndRemoveFacebook];
    [self chceckAndRemoveTwitter];

    NotificationsPopUp *pop = [[[NotificationsPopUp alloc] initWithFrame:CGRectMake(0, 64, 1024, 1024)] autorelease];
    self.notifPopUpRef = pop;
    [self.window.rootViewController.view addSubview:pop];
  } else {
    [self chceckAndRemoveNotifications];
  }
}

#pragma mark - Removing Screens
- (void)chceckAndRemoveNotifications {
  if (self.notifPopUpRef != nil) {
    self.notifPopUpRef.hidden = YES;
    self.notifPopUpRef = nil;
  }
}

- (void)chceckAndRemoveTwitter {
  if (self.twitterPopUp != nil) {
    [self.twitterPopUp setHidden:YES];
    self.twitterPopUp = nil;
  }
}

- (void)chceckAndRemoveFacebook {
  if (self.facebookPopUp != nil) {
    [self.facebookPopUp setHidden:YES];
    self.facebookPopUp = nil;
  }
}

- (void)microphonePressed {
  [WToast showWithText:@"Voice Search"];
}

- (void)changeBadgeNumber:(NSInteger)num {
  [self.notificationBadge setBadgeText:[NSString stringWithFormat:@"%d", num]];
}

- (void)dealloc {
  [_notificationButton release];
  [_facebookButton release];
  [_twitterButton release];
  [_searchBar release];
  [_microphoneButton release];
  [_notifPopUpRef release];
  [_descriptionLabel release];
  [_facebookPopUp release];
  [_twitterPopUp release];
  [_notificationBadge release];
  [_titleLabel release];
  [super dealloc];
}

@end
