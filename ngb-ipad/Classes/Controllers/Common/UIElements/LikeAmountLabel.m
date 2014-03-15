//
//  LikeAmountLabel.m
//  ngb-ipad
//
//  Created by Michael Apanowicz on 10/8/12.
//  Copyright (c) 2012 michal.apanowicz@miquido.com. All rights reserved.
//

#import "LikeAmountLabel.h"

@implementation LikeAmountLabel

@synthesize howManyLikesLabel = _howManyLikesLabel;
@synthesize localizedLabel = _localizedLabel;
@synthesize numberOfLikes = _numberOfLikes;

- (id)initWithFrame:(CGRect)frame andLikeAmount:(NSInteger)likes
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      self.numberOfLikes = likes;
      
      NSString *likeNumStr = [NSString stringWithFormat:@"%d",likes];
      self.howManyLikesLabel = [[[UILabel alloc] init] autorelease];
      [self.howManyLikesLabel setText:likeNumStr];
      [self.howManyLikesLabel setTextAlignment:UITextAlignmentLeft];
      [self.howManyLikesLabel setTextColor:[Colors orangeColor]];
      [self.howManyLikesLabel setFont:[Fonts boldFontWithSize12]];
      [self.howManyLikesLabel setBackgroundColor:[UIColor clearColor]];
      [self addSubview:self.howManyLikesLabel];
      
      NSString *localizedString = NSLocalizedString(@"dashboard.friendsLikeIt", nil);
      self.localizedLabel = [[[UILabel alloc] init] autorelease];
      [self.localizedLabel setText:localizedString];
      [self.localizedLabel setTextAlignment:UITextAlignmentLeft];
      [self.localizedLabel setTextColor:[Colors grayColor]];
      [self.localizedLabel setFont:[Fonts fontWithSize12]];
      [self.localizedLabel setBackgroundColor:[UIColor clearColor]];
      [self addSubview:self.localizedLabel];      
      
      [self setFrames:likeNumStr localizedStr:localizedString];
    }
    return self;
}

-(void)setFrames:(NSString *)likesStr localizedStr:(NSString *)localizedStr {
  CGSize likesSize = [likesStr sizeWithFont:[Fonts boldFontWithSize12]];
  [self.howManyLikesLabel setFrame:CGRectMake(0, 0, likesSize.width, 15)];
  CGSize localizedSize = [localizedStr sizeWithFont:[Fonts fontWithSize12]];
  [self.localizedLabel setFrame:CGRectMake(likesSize.width, 0, 100, 15)];
}

-(void)setNumberOfLikes:(NSInteger)numberOfLikes {
  _numberOfLikes = numberOfLikes; 
  NSString *likeNumStr = [NSString stringWithFormat:@"%d",numberOfLikes];
  [self.howManyLikesLabel setText:likeNumStr];
  NSString *localizedString = NSLocalizedString(@"dashboard.friendsLikeIt", nil);
  [self.localizedLabel setText:localizedString];
  [self setFrames:likeNumStr localizedStr:localizedString];
}

-(void)dealloc{
  [_howManyLikesLabel release];
  [_localizedLabel release];
  [super dealloc];
}

@end
