//
//  SocialPopUp.m
//  ngb-ipad
//
//  Created by Michael Apanowicz on 10/9/12.
//  Copyright (c) 2012 michal.apanowicz@miquido.com. All rights reserved.
//

#import "SocialPopUp.h"

@implementation SocialPopUp

@synthesize blackBackground = _blackBackground;
@synthesize popupBackground = _popupBackground;
@synthesize socialLogo = _socialLogo;
@synthesize sendButton = _sendButton;
@synthesize scrollView = _scrollView;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      UITapGestureRecognizer *singleTapGestureRecognizer = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)] autorelease];
      [singleTapGestureRecognizer setNumberOfTapsRequired:1];
      [self addGestureRecognizer:singleTapGestureRecognizer];

      
      self.blackBackground = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)] autorelease];
      [self.blackBackground setBackgroundColor:[UIColor blackColor]];
      [self.blackBackground setAlpha:0.4];
      [self addSubview:self.blackBackground];
      
      self.popupBackground = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 274, 321)] autorelease];
      [self addSubview:self.popupBackground];
         
      self.socialLogo = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 30, 30)] autorelease];
      [self addSubview:self.socialLogo];
      
      self.sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [self.sendButton setFrame:CGRectMake(217, 30, 40, 30)];
      [self.sendButton setImage:[UIImage imageNamed:@"notifications_button.png"] forState:UIControlStateNormal];
      [self addSubview:self.sendButton];  
      
      self.scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(20, 70, 233, 224)] autorelease];
      [self addSubview:self.scrollView];
      
      UITextField *txt = [[[UITextField alloc] initWithFrame:CGRectMake(60, 30, 154, 30)] autorelease];
      [txt setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"notifications_text_field.png"]]];
      [self addSubview:txt];
    }
    return self;
}


- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
  [self setHidden:YES];
}


-(void)dealloc{
  [_blackBackground release];
  [_popupBackground release];
  [_socialLogo release];
  [_sendButton release];
  [_scrollView release];
  [super dealloc];
}

@end
