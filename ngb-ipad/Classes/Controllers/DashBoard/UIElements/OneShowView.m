/*
 * ShowView
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/25/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "OneShowView.h"


@implementation OneShowView {

}
@synthesize background = _background;
@synthesize showImageView = _showImageView;
@synthesize showNameLabel = _showNameLabel;
@synthesize likesLabelsView = _likesLabelsView;
@synthesize dateLabel = _dateLabel;
@synthesize thumbUp = _thumbUp;
@synthesize thumbDown = _thumbDown;
@synthesize friendButton = _friendButton;


- (id)initWithFrame:(CGRect)frame withIndex:(int)index {
  self = [super initWithFrame:frame];
  if (self) {
    self.background = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dashboard_upcoming_background.png"]] autorelease];
    [self.background setFrame:CGRectMake(0, 0, 208, 91)];
    [self addSubview:self.background];

    self.showImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(7, 7, 60, 60)] autorelease];
    [self addSubview:self.showImageView];

    self.showNameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(73, 10, 120, 16)] autorelease];
    [self.showNameLabel setFont:[Fonts boldFontWithSize14]];
    [self.showNameLabel setTextColor:[Colors blackColor]];
    [self.showNameLabel setTextAlignment:UITextAlignmentLeft];
    [self.showNameLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.showNameLabel];

    self.likesLabelsView = [[[LikeAmountLabel alloc] initWithFrame:CGRectMake(73, 25, 120, 15) andLikeAmount:10] autorelease];
    [self addSubview:self.likesLabelsView];

    self.thumbUp = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *thumbUpImage = [UIImage imageNamed:@"dashboard_thumb_up.png"];
    [self.thumbUp setBackgroundImage:thumbUpImage forState:UIControlStateNormal];
    [self.thumbUp setFrame:CGRectMake(87, 44, thumbUpImage.size.width, thumbUpImage.size.height)];
    [self.thumbUp addTarget:self action:@selector(onThumbUpPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.thumbUp];

    self.thumbDown = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *thumbDownImage = [UIImage imageNamed:@"dashboard_thumb_down.png"];
    [self.thumbDown setBackgroundImage:thumbDownImage forState:UIControlStateNormal];
    [self.thumbDown setFrame:CGRectMake(116, 44, thumbDownImage.size.width, thumbDownImage.size.height)];
    [self.thumbDown addTarget:self action:@selector(onThumbDownPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.thumbDown];

    self.friendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *friendsImage = [UIImage imageNamed:@"dashboard_invite_friends.png"]; // TODO Michal - change size of picture
    [self.friendButton setBackgroundImage:friendsImage forState:UIControlStateNormal];
    [self.friendButton setFrame:CGRectMake(145, 44, friendsImage.size.width, friendsImage.size.height)];
    [self.friendButton addTarget:self action:@selector(onFriendsPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.friendButton];

    self.dateLabel = [[[UILabel alloc] initWithFrame:CGRectMake(7, 72, 200, 14)] autorelease];
    [self.dateLabel setFont:[Fonts boldFontWithSize10]];
    [self.dateLabel setTextAlignment:UITextAlignmentLeft];
    [self.dateLabel setTextColor:[Colors grayColor]];
    [self.dateLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.dateLabel];

    [self fillWithDummyData:index];
  }

  return self;
}

- (void)fillWithDummyData :(int)i{
    int secondRandom = arc4random() % 10;
    switch (i) {
      case 0:
        [self.showImageView setImage:[UIImage imageNamed:@"dashboard_black@2x.png"]];
        [self.showNameLabel setText:@"Black sheep"];
        [self.dateLabel setText:@"Sun 12:55pm - 14:30pm"];
        [self.likesLabelsView setNumberOfLikes:i + secondRandom];
        break;
      case 1:
        [self.showImageView setImage:[UIImage imageNamed:@"dashboard_championship@2x.png"]];
        [self.showNameLabel setText:@"Champions League"];
        [self.dateLabel setText:@"Tue 2:45pm - 4:45pm"];
        [self.likesLabelsView setNumberOfLikes:i + secondRandom];
        break;
      case 2:
        [self.showImageView setImage:[UIImage imageNamed:@"dashboard_dances@2x.png"]];
        [self.showNameLabel setText:@"Dances With Wolves"];
        [self.dateLabel setText:@"Wed 5:55pm - 8:35pm"];
        [self.likesLabelsView setNumberOfLikes:i + secondRandom];
        break;
      case 3:
        [self.showImageView setImage:[UIImage imageNamed:@"dashboard_mlb@2x.png"]];
        [self.showNameLabel setText:@"MLB"];
        [self.dateLabel setText:@"Mon 5:00pm - 7:15pm"];
        [self.likesLabelsView setNumberOfLikes:i + secondRandom];
        break;
      case 4:
        [self.showImageView setImage:[UIImage imageNamed:@"dashboard_diary@2x.png"]];
        [self.showNameLabel setText:@"Vampire Diares"];
        [self.dateLabel setText:@"Thu 8:00pm - 9:00pm"];
        [self.likesLabelsView setNumberOfLikes:i + secondRandom];
        break;
      case 5:
        [self.showImageView setImage:[UIImage imageNamed:@"dashboard_nfl@2x.png"]];
        [self.showNameLabel setText:@"NFL"];
        [self.dateLabel setText:@"Sat 21:00pm - 23:20pm"];
        [self.likesLabelsView setNumberOfLikes:i + secondRandom];
        break;
      case 6:
        [self.showImageView setImage:[UIImage imageNamed:@"dashboard_hearts.png"]];
        [self.showNameLabel setText:@"True Blood"];
        [self.dateLabel setText:@"Sat 11:00pm - 12:00pm"];
        [self.likesLabelsView setNumberOfLikes:i + secondRandom];
        break;
      case 7:
        [self.showImageView setImage:[UIImage imageNamed:@"dashboard_housewifes@2x.png"]];
        [self.showNameLabel setText:@"Housewives"];
        [self.dateLabel setText:@"Mon 08:00pm - 08:40pm"];
        [self.likesLabelsView setNumberOfLikes:i + secondRandom];
        break;
      default:
        [self.showImageView setImage:[UIImage imageNamed:@"dashboard_black@2x.png"]];
        [self.showNameLabel setText:@"Roller Coaster"];
        [self.dateLabel setText:@"Fri 14:00pm - 15:55pm"];
        [self.likesLabelsView setNumberOfLikes:i + secondRandom];
        break;
    }
}


#pragma mark - Buttons actions
- (void)onThumbUpPressed {
  [WToast showWithText:NSLocalizedString(@"dashboard.thumbUp", nil) length:kWTShort];
}


- (void)onThumbDownPressed {
  [WToast showWithText:NSLocalizedString(@"dashboard.thumbDown", nil) length:kWTShort];
}


- (void)onFriendsPressed {
  [self.window.rootViewController.view addSubview:[PopupInviteFriends instance]];
}


- (void)dealloc {
  [_background release];
  [_thumbUp release];
  [_thumbDown release];
  [_friendButton release];
  [_showImageView release];
  [_showNameLabel release];
  [_likesLabelsView release];
  [_dateLabel release];
  [super dealloc];
}


@end