//
//  DashboardFeaturedShow.m
//  ngb-ipad
//
//  Created by Michael Apanowicz on 10/9/12.
//  Copyright (c) 2012 michal.apanowicz@miquido.com. All rights reserved.
//

#import "DashboardFeaturedShow.h"

@implementation DashboardFeaturedShow

@synthesize featuredShowImageView = _featuredShowImageView;
@synthesize programNameLabel = _programNameLabel;
@synthesize tuneInButton = _tuneInButton; 
@synthesize thumbUpButton = _thumbUpButton;
@synthesize thumbDownButton = _thumbDownButton;
@synthesize clockLabel = _clockLabel;
@synthesize pmAmLabel = _pmAmLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      self.featuredShowImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 744, 358)] autorelease];
      [self addSubview:self.featuredShowImageView];
      
      blackBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 210, frame.size.width, 100)];
      [blackBackground setImage:[UIImage imageNamed:@"program_info_banner_shows_background@2x.png"]];
      [self addSubview:blackBackground];
      
      //dashborad.featuredShow
      featuredLabel = [[[UILabel alloc] initWithFrame:CGRectMake(30, 20, 150, 20)] autorelease];
      [featuredLabel setTextAlignment:UITextAlignmentLeft];
      [featuredLabel setTextColor:[Colors whiteColor]];
      [featuredLabel setFont:[Fonts fontWithSize18]];
      [featuredLabel setBackgroundColor:[UIColor clearColor]];
      [blackBackground addSubview:featuredLabel];
      
      
      self.programNameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(180, 20, 300, 20)] autorelease];
      [self.programNameLabel setTextAlignment:UITextAlignmentLeft];
      [self.programNameLabel setTextColor:[Colors whiteColor]];
      [self.programNameLabel setFont:[Fonts fontWithSize18]];
      [self.programNameLabel setBackgroundColor:[UIColor clearColor]];
      [blackBackground addSubview:self.programNameLabel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
