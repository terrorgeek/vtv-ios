/*
 * PopupInviteFriends
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/22/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "PopupInviteFriends.h"


@implementation PopupInviteFriends {

}
@synthesize popupBackground = _popupBackground;
@synthesize scrollView = _scrollView;
@synthesize sendButton = _sendButton;
@synthesize messageTextView = _messageTextView;
@synthesize blackBackground = _blackBackground;
@synthesize contentView = _contentView;
@synthesize divider = _divider;
@synthesize friendsArray = _friendsArray;
@synthesize popupWithoutBlack = _popupWithoutBlack;

+ (PopupInviteFriends *)instance {
  static PopupInviteFriends *_instance = nil;

  @synchronized (self) {
    if (_instance == nil) {
      _instance = [[self alloc] initWithFrame:CGRectMake(0, 0, 1500, 1500)];
    }
  }

  return _instance;
}

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.blackBackground = [[[UIView alloc] initWithFrame:frame] autorelease];
    [self.blackBackground setBackgroundColor:[UIColor blackColor]];
    [self.blackBackground setAlpha:0.4];
    [self addSubview:self.blackBackground];

    UITapGestureRecognizer *singleTap = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(blackAreaTap)] autorelease];
    [singleTap setNumberOfTapsRequired:1];
    [self.blackBackground addGestureRecognizer:singleTap];

    self.popupWithoutBlack = [[[UIView alloc] initWithFrame:CGRectMake(280, 380, 531, 432)] autorelease];
    [self addSubview:self.popupWithoutBlack];

    self.popupBackground = [[[UIImageView alloc] init] autorelease];
    [self.popupBackground setImage:[UIImage imageNamed:@"popup_background.png"]];
    [self.popupBackground setFrame:CGRectMake(0, 0, self.popupWithoutBlack.frame.size.width, self.popupWithoutBlack.frame.size.height)];
    [self.popupWithoutBlack addSubview:self.popupBackground];

    self.scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(23, 15, 490, 315)] autorelease];
    [self.scrollView setBackgroundColor:[UIColor clearColor]];

    self.contentView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 490, (CGFloat) ceil(self.friendsArray.count / 2))] autorelease];
    [self.contentView setBackgroundColor:[UIColor clearColor]];

    [self.scrollView setContentSize:self.contentView.frame.size];
    [self.scrollView addSubview:self.contentView];
    [self.popupWithoutBlack addSubview:self.scrollView];

    self.divider = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"program_info_list_divider@2x.png"]] autorelease];
    [self.divider setFrame:CGRectMake(23, 350, 490, 2)];
    [self.popupWithoutBlack addSubview:self.divider];

    self.sendButton = [[[PopupGreenButton alloc] initWithFrame:CGRectMake(386, 365, 126, 52)] autorelease];
    [self.sendButton.title setText:NSLocalizedString(@"dashboard.popup.send", nil)];
    [self.sendButton addTarget:self action:@selector(blackAreaTap) forControlEvents:UIControlEventTouchUpInside];
    [self.popupWithoutBlack addSubview:self.sendButton];

    [self setUpTextView];
  }
  return self;
}

/*
 * jk extracted method for initializing and customizing text view
 */
- (void)setUpTextView {
  UIImageView *backgroundUnderMessageTextView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup_input_text_background.png"]] autorelease];
  [backgroundUnderMessageTextView setFrame:CGRectMake(23, 365, 356, 50)];
  [self.popupWithoutBlack addSubview:backgroundUnderMessageTextView];

  self.messageTextView = [[[UITextView alloc] initWithFrame:backgroundUnderMessageTextView.frame] autorelease];
  self.messageTextView.delegate = self;
  [self.popupWithoutBlack addSubview:self.messageTextView];
}

- (void)fillWithFriends {
  if (self.friendsArray.count > 0) {
    [self.contentView removeFromSuperview];
    self.contentView.frame = CGRectMake(0, 0, self.contentView.frame.size.width, (CGFloat) (120 * ceil(self.friendsArray.count / 2)));
    for (int i = 0; i < self.friendsArray.count; i++) {
      FriendButton *button = [[FriendButton alloc] initWithPoint:CGPointMake(i % 2 * 252, i / 2 * 82)];
      Friend *friend = [self.friendsArray objectAtIndex:(NSUInteger) i];
      [button.friendName setText:[NSString stringWithFormat:@"%@ %@", friend.firstName, friend.lastName]];
      if (![((Friend *) [self.friendsArray objectAtIndex:(NSUInteger) i]).avatarId isEqualToString:@""]) {
        [button.avatar setPathToNetworkImage:[self generatePatchToPic:((Friend *) [self.friendsArray objectAtIndex:(NSUInteger) i]).avatarId]
                              forDisplaySize:CGSizeMake(50, 50)
                                 contentMode:UIViewContentModeScaleAspectFit];
      }
      [self.contentView addSubview:button];
      [button release];
    }
    [self.scrollView addSubview:self.contentView];
    [self.scrollView setContentSize:self.contentView.frame.size];
  } else {
    [self blackAreaTap];
  }
}


- (NSString *)generatePatchToPic:(NSString *)avatarID {
  return [NSString stringWithFormat:@"%@%@/%@?%@", API_BASE_LINK_REQUEST, API_IMAGES, avatarID, API_FORMAT_IMAGE];
}

- (void)blackAreaTap {
  [self removeFromSuperview];
  //self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

#pragma mark - UITextViewDelegate protocol methods
- (void)textViewDidBeginEditing:(UITextView *)textView {
  [UIView animateWithDuration:NORMAL_SPEED_ANIMATION animations:^{
    self.frame = CGRectMake(0, -150, self.frame.size.width, self.frame.size.height);
  }                completion:nil];
}


- (void)textViewDidEndEditing:(UITextView *)textView {
  [UIView animateWithDuration:NORMAL_SPEED_ANIMATION animations:^{
    self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
  }                completion:nil];
}

- (void)dealloc {
  [_popupBackground release];
  [_scrollView release];
  [_sendButton release];
  [_messageTextView release];
  [_blackBackground release];
  [_contentView release];
  [_divider release];
  [_friendsArray release];
  [_popupWithoutBlack release];
  [super dealloc];
}


@end