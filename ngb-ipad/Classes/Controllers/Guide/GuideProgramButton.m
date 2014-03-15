//
//  GuideProgramButton.m
//  ngb-ipad
//
//  Created by Michael Apanowicz on 10/9/12.
//  Copyright (c) 2012 michal.apanowicz@miquido.com. All rights reserved.
//

#import "GuideProgramButton.h"

@implementation GuideProgramButton

@synthesize backgroundImageView = _backgroundImageView;
@synthesize programNameLabel = _programNameLabel;
@synthesize dateLabel = _dateLabel;
@synthesize thumbUpButton = _thumbUpButton;
@synthesize thumbDownButton = _thumbDownButton;
@synthesize friendButton = _friendButton;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      self.backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
      [self.backgroundImageView setImage:[UIImage imageNamed:@"guide_button_background@2x.png"]];
      [self addSubview:self.backgroundImageView];
      
      self.programNameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(7, 8, 200, 14)] autorelease];
      [self.programNameLabel setFont:[Fonts boldFontWithSize12]];
      [self.programNameLabel setTextAlignment:UITextAlignmentLeft];
      [self.programNameLabel setTextColor:[Colors blackColor]];
      [self.programNameLabel setBackgroundColor:[UIColor clearColor]];
      [self addSubview:self.programNameLabel];
      
      self.dateLabel = [[[UILabel alloc] initWithFrame:CGRectMake(7, 22, 200, 14)] autorelease];
      [self.dateLabel setFont:[Fonts fontWithSize12]];
      [self.dateLabel setTextAlignment:UITextAlignmentLeft];
      [self.dateLabel setTextColor:[Colors blackColor]];
      [self.dateLabel setBackgroundColor:[UIColor clearColor]];
      [self addSubview:self.dateLabel];
      
      self.thumbUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [self.thumbUpButton setFrame:CGRectMake(7, 53, 25, 25)];
      [self.thumbUpButton setBackgroundImage:[UIImage imageNamed:@"dashboard_thumb_up.png"] forState:UIControlStateNormal];
      [self addSubview:self.thumbUpButton];
      
      self.thumbDownButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [self.thumbDownButton setFrame:CGRectMake(35, 53, 25, 25)];
      [self.thumbDownButton setBackgroundImage:[UIImage imageNamed:@"dashboard_thumb_down.png"] forState:UIControlStateNormal];
      [self addSubview:self.thumbDownButton];
      
      self.friendButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [self.friendButton setFrame:CGRectMake(205, 52, 22, 24)];
      [self.friendButton setBackgroundImage:[UIImage imageNamed:@"guide_friends@2x.png"] forState:UIControlStateNormal];
      [self addSubview:self.friendButton];
      
           
    }
    return self;
}

-(void)dealloc{
  [_backgroundImageView release];
  [_programNameLabel release];
  [_dateLabel release];
  [_thumbUpButton release];
  [_friendButton release];
  [super dealloc];
}

@end
