/*
 * WallView
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/21/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "WallView.h"


@implementation WallView {

}
@synthesize wallLabel = _wallLabel;
@synthesize dividerImageView = _dividerImageView;
@synthesize scrollView = _scrollView;
@synthesize contentView = _contentView;


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self setBackgroundColor:[UIColor clearColor]];

    self.wallLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 235, 22)] autorelease];
    [self.wallLabel setText:NSLocalizedString(@"dashboard.friendsWatching", nil)];
    [self.wallLabel setTextColor:[Colors blackColor]];
    [self.wallLabel setTextAlignment:UITextAlignmentLeft];
    [self.wallLabel setFont:[Fonts fontWithSize20]];
    [self.wallLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.wallLabel];

    self.dividerImageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dashboard_header_line.png"]] autorelease];
    [self.dividerImageView setFrame:CGRectMake(0, 25, 235, 2)];
    [self addSubview:self.dividerImageView];

    self.scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 35, 235, 235)] autorelease];
    [self defineContentView];
    [self.scrollView setContentSize:self.contentView.frame.size];
    [self addSubview:self.scrollView];
  }

  return self;
}

- (void)defineContentView {
  self.contentView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 235, 1000)] autorelease];

  CGFloat height = 0;
  CGFloat padding = 10;
  for (int i = 0; i < 4; ++i) {
    WallMsgBase *wallMsgView = nil;
    if (i % 4 == 0) {
      wallMsgView = [[[WallMsgBase alloc] initWithFrame:CGRectMake(0, height, 235, 128)] autorelease];
      [wallMsgView.friendName setText:@"Doorie Lee"];
      [wallMsgView.friendAvatar setImage:[UIImage imageNamed:@"dashboard_krzysztof@2x.png"]];
      [wallMsgView.program.programNameLabel setText:@"NCIS"];
      [wallMsgView.program.programImageView setImage:[UIImage imageNamed:@"dashboard_hearts.png"]];
      [wallMsgView.program.likeAmountView setNumberOfLikes:3];
      [wallMsgView.program.progressBar setImage:[UIImage imageNamed:@"10minutes@2x.png"]];
      wallMsgView.program.friendsButton.titleLabel.text = @"506c49f0-2431-d88b-1524-cd12e2374ee0";
      [wallMsgView.program.friendsButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
      [wallMsgView.program.friendsButton setImage:[UIImage imageNamed:@"dashboard_icon_watch.png"] forState:UIControlStateNormal];
    }
    else if (i % 4 == 1) {
      wallMsgView = [[[WallMsgBase alloc] initWithFrame:CGRectMake(0, height, 235, 128)] autorelease];
      [wallMsgView.friendName setText:@"Monika Borowska"];
      [wallMsgView.friendAvatar setImage:[UIImage imageNamed:@"dashboard_monika@2x.png"]];
      [wallMsgView.program.programNameLabel setText:@"Desperate Housewifes"];
      [wallMsgView.program.programImageView setImage:[UIImage imageNamed:@"dashboard_housewifes@2x.png"]];
      [wallMsgView.program.likeAmountView setNumberOfLikes:1];
      [wallMsgView.program.progressBar setImage:[UIImage imageNamed:@"6minutes@2x.png"]];
      wallMsgView.program.friendsButton.titleLabel.text = @"506c49f0-af3d-5af4-b90b-2e0c1aa56f5b";
      [wallMsgView.program.friendsButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
      [wallMsgView.program.friendsButton setImage:[UIImage imageNamed:@"dashboard_icon_watch.png"] forState:UIControlStateNormal];
    }
    else if (i % 4 == 2) {
      wallMsgView = [[[WallMsgBase alloc] initWithFrame:CGRectMake(0, height, 235, 128)] autorelease];
      [wallMsgView.friendName setText:@"Surykatka"];
      [wallMsgView.friendAvatar setImage:[UIImage imageNamed:@"dashboard_surkatka@2x.png"]];
      [wallMsgView.program.programNameLabel setText:@"NFL Kickoff"];
      [wallMsgView.program.programImageView setImage:[UIImage imageNamed:@"dashboard_nfl@2x.png"]];
      [wallMsgView.program.likeAmountView setNumberOfLikes:15];
      [wallMsgView.program.progressBar setImage:[UIImage imageNamed:@"2minutes@2x.png"]];
      wallMsgView.program.friendsButton.titleLabel.text = @"506c49f0-2431-d88b-1524-cd12e2374ee0";
      [wallMsgView.program.friendsButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
      [wallMsgView.program.friendsButton setImage:[UIImage imageNamed:@"dashboard_icon_watch.png"] forState:UIControlStateNormal];
    } else {
      wallMsgView = [[[WallMsgBase alloc] initWithFrame:CGRectMake(0, height, 235, 128)] autorelease];
      [wallMsgView.friendName setText:@"Sebastian Kowalsky"];
      [wallMsgView.friendAvatar setImage:[UIImage imageNamed:@"program_info_cast_sample_photo.png"]];
      [wallMsgView.program.programNameLabel setText:@"Championship"];
      [wallMsgView.program.programImageView setImage:[UIImage imageNamed:@"dashboard_championship.png"]];
      [wallMsgView.program.likeAmountView setNumberOfLikes:15];
      [wallMsgView.program.progressBar setImage:[UIImage imageNamed:@"10minutes@2x.png"]];
      wallMsgView.program.friendsButton.titleLabel.text = @"506c49f0-af3d-5af4-b90b-2e0c1aa56f5b";
      [wallMsgView.program.friendsButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
      [wallMsgView.program.friendsButton setImage:[UIImage imageNamed:@"dashboard_icon_watch.png"] forState:UIControlStateNormal];
    }
    height += wallMsgView.frame.size.height + padding;
    [self.contentView addSubview:wallMsgView];
  }
  [self.contentView setFrame:CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.y, self.contentView.frame.size.width, height + 40)];
  [self.scrollView addSubview:self.contentView];
}


- (void)buttonPressed:(id)sender {
  UIButton *clickedButton = (UIButton *) sender;
  NSLog(@"CLICKED: %@",clickedButton.titleLabel.text);
  [[RemoteDataClient instance] putRequestChannelId:clickedButton.titleLabel.text];
  [WToast showWithText:@"Tune in action"];
}


- (void)dealloc {
  [_wallLabel release];
  [_dividerImageView release];
  [_scrollView release];
  [_contentView release];
  [super dealloc];
}


@end