//
//  UpcommingShowViewWide.m
//  ngb-ipad
//
//  Created by Michael Apanowicz on 10/9/12.
//  Copyright (c) 2012 michal.apanowicz@miquido.com. All rights reserved.
//

#import "UpcommingShowViewWide.h"

@implementation UpcommingShowViewWide

@synthesize backgroundImageView = _backgroundImageView;
@synthesize showImageView = _showImageView;
@synthesize showNameLabel = _showNameLabel;
@synthesize addFriendsButton = _addFriendsButton;
@synthesize showDate = _showDate;
@synthesize show = _show;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      // Initialization code
      UIImage *backgroundImage = [UIImage imageNamed:@"dashboard_upcoming_background.png"];
      [backgroundImage stretchableImageWithLeftCapWidth:10 topCapHeight:10];
      self.backgroundImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)] autorelease];
      [self.backgroundImageView setImage:backgroundImage];
      [self addSubview:self.backgroundImageView];
      
      self.showImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(7, 7, 60, 60)] autorelease];
      [self addSubview:self.showImageView];
      
      self.showNameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(75, 10, 190, 20)] autorelease];
      [self.showNameLabel setTextAlignment:UITextAlignmentLeft];
      [self.showNameLabel setTextColor:[Colors blackColor]];
      [self.showNameLabel setFont:[Fonts boldFontWithSize14]];
      [self.showNameLabel setBackgroundColor:[UIColor clearColor]];
      [self addSubview:self.showNameLabel];
      
      self.addFriendsButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [self.addFriendsButton setFrame:CGRectMake(170, 42, 50, 25)];
      [self.addFriendsButton setBackgroundImage:[UIImage imageNamed:@"dashboard_invite_friends.png"] forState:UIControlStateNormal];
      [self addSubview:self.addFriendsButton];
      
      self.showDate = [[UILabel alloc] initWithFrame:CGRectMake(7,70,200,15)];
      [self.showDate setTextAlignment:UITextAlignmentLeft];
      [self.showDate setTextColor:[Colors grayColor]];
      [self.showDate setFont:[Fonts boldFontWithSize10]];
      [self.showDate setBackgroundColor:[UIColor clearColor]];
      [self addSubview:self.showDate];
      
    }
    return self;
}

- (void)dealloc {
  [_backgroundImageView release];
  [_showImageView release];
  [_showNameLabel release];
  [_addFriendsButton release];
  [_showDate release];
  [_show release];
  [super dealloc];
}


@end
