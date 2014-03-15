//
//  BannerView.m
//  ngb-ipad
//
//  Created by Julian Król on 10/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BannerView.h"

@interface BannerView ()
@property(nonatomic, retain) UIButton *friends;
@property(nonatomic, retain) UIButton *thumbUp;
@property(nonatomic, retain) UIButton *thumbDown;
@property(nonatomic, retain) UIButton *calendar;
@property(nonatomic, retain) UIButton *tuneIn;
@property(nonatomic, retain) UIButton *readMore;
@property(nonatomic, retain) UIImageView *leftDivider;
@property(nonatomic, retain) UIImageView *rightDivider;
@property(nonatomic, retain) UILabel *similarShows;
@property(nonatomic, retain) UILabel *showName;
@property(nonatomic, retain) UISegmentedControl *segmentControl;
@property(nonatomic, retain) UILabel *channelNameLabel;
@property(nonatomic, retain) UILabel *movieDateLabel;
@property(nonatomic, retain) UITextView *movieDescription;
@property(nonatomic, retain) UIImageView *filtr;
@property(nonatomic, retain) UILabel *starsLabel;
@property(nonatomic, retain) UILabel *producersName;
@property(nonatomic, retain) UIImageView *mockShow2;
@property(nonatomic, retain) UIImageView *mockShow1;


@end

@implementation BannerView
@synthesize friends = _friends;
@synthesize thumbUp = _thumbUp;
@synthesize thumbDown = _thumbDown;
@synthesize calendar = _calendar;
@synthesize tuneIn = _tuneIn;
@synthesize readMore = _readMore;
@synthesize posterPicture = _posterPicture;
@synthesize leftDivider = _leftDivider;
@synthesize rightDivider = _rightDivider;
@synthesize similarShows = _similarShows;
@synthesize showName = _showName;
@synthesize miniMoviePic = _miniMoviePic;
@synthesize segmentControl = _segmentControl;
@synthesize channelNameLabel = _channelNameLabel;
@synthesize movieDateLabel = _movieDateLabel;
@synthesize movieDescription = _movieDescription;
@synthesize filtr = _filtr;
@synthesize starsLabel = _starsLabel;
@synthesize producersName = _producersName;
@synthesize mockShow1 = _mockShow1;
@synthesize mockShow2 = _mockShow2;


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self setUpImages];
    [self setUpButtons];
    [self setUpLabels];
    [self setUpSegment];
    [self setUpTextView];
  }
  return self;
}


- (void)setUpImages {
  self.posterPicture = [[[NINetworkImageView alloc] initWithFrame:CGRectMake(0, 0, 768, 355)] autorelease];
  self.posterPicture.image = [UIImage imageNamed:@"dashboard_featured_show_landscape.png"];
  [self addSubview:self.posterPicture];

  self.filtr = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 768, 355)] autorelease];
  self.filtr.backgroundColor = [UIColor blackColor];
  self.filtr.alpha = 0.25;
  [self addSubview:self.filtr];

  self.miniMoviePic = [[[NINetworkImageView alloc] initWithFrame:CGRectMake(340, 60, 80, 80)] autorelease];
  self.miniMoviePic.image = [UIImage imageNamed:@"mentalist_icon.png"];
  [self addSubview:self.miniMoviePic];

  self.leftDivider = [[[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 280, 2)] autorelease];
  self.leftDivider.image = [UIImage imageNamed:@"dashboard_header_line.png"];
  [self addSubview:self.leftDivider];

  self.rightDivider = [[[UIImageView alloc] initWithFrame:CGRectMake(340, 50, 400, 2)] autorelease];
  self.rightDivider.image = [UIImage imageNamed:@"dashboard_header_line.png"];
  [self addSubview:self.rightDivider];

  self.mockShow1 = [[[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 280, 80)] autorelease];
  self.mockShow1.image = [UIImage imageNamed:@"guide_friends_item_1.png"];
  [self addSubview:self.mockShow1];

  self.mockShow2 = [[[UIImageView alloc] initWithFrame:CGRectMake(10, 200, 280, 80)] autorelease];
  self.mockShow2.image = [UIImage imageNamed:@"guide_friends_item_2.png"];
  [self addSubview:self.mockShow2];
}


- (void)setUpButtons {
  self.friends = [[[UIButton alloc] initWithFrame:CGRectMake(450, 280, 45, 40)] autorelease];
  [self.friends setImage:[UIImage imageNamed:@"dashboard_invite_friends.png"] forState:UIControlStateNormal];
  [self.friends addTarget:self action:@selector(friendsAction) forControlEvents:UIControlEventTouchUpInside];
  [self addSubview:self.friends];

  self.tuneIn = [[[UIButton alloc] initWithFrame:CGRectMake(510, 287, 45, 26)] autorelease];
  [self.tuneIn setImage:[UIImage imageNamed:@"dashboard_icon_watch.png"] forState:UIControlStateNormal];
  [self.tuneIn addTarget:self action:@selector(tuneInAction) forControlEvents:UIControlEventTouchUpInside];
  self.tuneIn.backgroundColor = [UIColor clearColor];
  [self addSubview:self.tuneIn];

  self.calendar = [[[UIButton alloc] initWithFrame:CGRectMake(570, 287, 45, 26)] autorelease];
  [self.calendar setImage:[UIImage imageNamed:@"dashboard_icon_calendar.png"] forState:UIControlStateNormal];
  [self.calendar addTarget:self action:@selector(calendarAction) forControlEvents:UIControlEventTouchUpInside];
  [self addSubview:self.calendar];

  self.thumbUp = [[[UIButton alloc] initWithFrame:CGRectMake(660, 280, 30, 40)] autorelease];
  [self.thumbUp setImage:[UIImage imageNamed:@"dashboard_thumb_up.png"] forState:UIControlStateNormal];
  [self.thumbUp addTarget:self action:@selector(thumbUpAction) forControlEvents:UIControlEventTouchUpInside];
  [self addSubview:self.thumbUp];

  self.thumbDown = [[[UIButton alloc] initWithFrame:CGRectMake(700, 280, 30, 40)] autorelease];
  [self.thumbDown setImage:[UIImage imageNamed:@"dashboard_thumb_down.png"] forState:UIControlStateNormal];
  [self.thumbDown addTarget:self action:@selector(thumbDownAction) forControlEvents:UIControlEventTouchUpInside];
  [self addSubview:self.thumbDown];

  self.readMore = [[[UIButton alloc] initWithFrame:CGRectMake(340, 150, 80, 30)] autorelease];
  [self.readMore setBackgroundImage:[UIImage imageNamed:@"popup_green_button.png"] forState:UIControlStateNormal];
  self.readMore.titleLabel.font = [UIFont systemFontOfSize:10];
  [self.readMore setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [self.readMore setTitle:NSLocalizedString(@"read.more", nil) forState:UIControlStateNormal];
  [self addSubview:self.readMore];
}


- (void)setUpLabels {
  self.similarShows = [[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)] autorelease];
  self.similarShows.textColor = [UIColor whiteColor];
  self.similarShows.backgroundColor = [UIColor clearColor];
  self.similarShows.text = NSLocalizedString(@"similar.shows", nil);
  self.similarShows.font = [UIFont systemFontOfSize:20];
  [self addSubview:self.similarShows];

  self.showName = [[[UILabel alloc] initWithFrame:CGRectMake(340, 10, 300, 30)] autorelease];
  self.showName.textColor = [UIColor whiteColor];
  self.showName.backgroundColor = [UIColor clearColor];
  self.showName.font = [UIFont systemFontOfSize:20];
  self.showName.text = NSLocalizedString(@"game.of.throne", nil);
  [self addSubview:self.showName];

  self.channelNameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(440, 60, 50, 25)] autorelease];
  self.channelNameLabel.backgroundColor = [UIColor clearColor];
  self.channelNameLabel.textColor = [UIColor whiteColor];
  self.channelNameLabel.text = NSLocalizedString(@"channel.name.on.schedule.banner", nil);
  self.channelNameLabel.font = [UIFont boldSystemFontOfSize:18];
  [self addSubview:self.channelNameLabel];

  self.movieDateLabel = [[[UILabel alloc] initWithFrame:CGRectMake(490, 60, 200, 20)] autorelease];
  self.movieDateLabel.textColor = [UIColor whiteColor];
  self.movieDateLabel.font = [UIFont systemFontOfSize:14];
  self.movieDateLabel.text = NSLocalizedString(@"default.date.on.schedule.banner", nil);
  self.movieDateLabel.backgroundColor = [UIColor clearColor];
  [self addSubview:self.movieDateLabel];

  self.starsLabel = [[[UILabel alloc] initWithFrame:CGRectMake(440, 200, 60, 20)] autorelease];
  self.starsLabel.textColor = [UIColor whiteColor];
  self.starsLabel.font = [UIFont boldSystemFontOfSize:14];
  self.starsLabel.text = NSLocalizedString(@"stars.dots", nil);
  self.starsLabel.backgroundColor = [UIColor clearColor];
  [self addSubview:self.starsLabel];

  self.producersName = [[[UILabel alloc] initWithFrame:CGRectMake(500, 200, 200, 40)] autorelease];
  self.producersName.text = @"Bob Smith";
  self.producersName.numberOfLines = 2;
  self.producersName.backgroundColor = [UIColor clearColor];
  self.producersName.font = [UIFont boldSystemFontOfSize:14];
  self.producersName.textColor = [UIColor whiteColor];
  [self addSubview:self.producersName];
}


- (void)setUpTextView {
  self.movieDescription = [[[UITextView alloc] initWithFrame:CGRectMake(430, 100, 300, 100)] autorelease];
  self.movieDescription.backgroundColor = [UIColor clearColor];
  self.movieDescription.textColor = [UIColor whiteColor];
  self.movieDescription.font = [UIFont boldSystemFontOfSize:14];
  [self.movieDescription setEditable:NO];
  self.movieDescription.text = @"Lore ipsum";
  [self addSubview:self.movieDescription];
}


- (void)setUpSegment {
  NSArray *buttonsArray = [[NSArray alloc] initWithObjects:NSLocalizedString(@"friends", nil), NSLocalizedString(@"similar.shows", nil), nil];
  self.segmentControl = [[[UISegmentedControl alloc] initWithItems:buttonsArray] autorelease];
  self.segmentControl.frame = CGRectMake(10, 60, 280, 30);
  [self.segmentControl setSegmentedControlStyle:UISegmentedControlStyleBar];
  [self.segmentControl setTintColor:[UIColor colorWithRed:(CGFloat) 183 / 255 green:(CGFloat) 207 / 255 blue:(CGFloat) 95 / 255 alpha:1.0]];
  [self addSubview:self.segmentControl];
  [buttonsArray release];
}


#pragma mark - buttons' actions
- (void)friendsAction {
  [self.window.rootViewController.view addSubview:[PopupInviteFriends instance]];
}


- (void)tuneInAction {
  [WToast showWithText:NSLocalizedString(@"tuned.in", nil) length:kWTShort];
}


- (void)calendarAction {
  [WToast showWithText:NSLocalizedString(@"added.to.calendar", nil) length:kWTShort];
}


- (void)thumbUpAction {
  [WToast showWithText:NSLocalizedString(@"dashboard.thumbUp", nil) length:kWTShort];
}


- (void)thumbDownAction {
  [WToast showWithText:NSLocalizedString(@"dashboard.thumbDown", nil) length:kWTShort];
}


#pragma mark - update Action
- (void)update:(Program *)program withIcon:(UIImage *)icon {
  self.movieDescription.text = program.description;
  self.showName.text = program.name;
  self.producersName.text = program.producers;
  if (program.poster_id != nil) {
    [self.posterPicture setPathToNetworkImage:[NSString stringWithFormat:@"%@%@?width=768", API_IMAGES_SERVER, program.poster_id] contentMode:UIViewContentModeScaleAspectFill];
  } else {
    self.posterPicture.contentMode = UIViewContentModeScaleAspectFill;
    self.posterPicture.image = [UIImage imageNamed:program.defaultBannerPic];
  }
  self.movieDateLabel.text = program.timetable;
  self.miniMoviePic.image = icon;
}


- (void)dealloc {
  [_friends release];
  [_thumbUp release];
  [_thumbDown release];
  [_calendar release];
  [_tuneIn release];
  [_readMore release];
  [_posterPicture release];
  [_leftDivider release];
  [_rightDivider release];
  [_similarShows release];
  [_showName release];
  [_miniMoviePic release];
  [_segmentControl release];
  [_channelNameLabel release];
  [_movieDateLabel release];
  [_movieDescription release];
  [_filtr release];
  [_starsLabel release];
  [_producersName release];
  [_mockShow1 release];
  [_mockShow2 release];
  [super dealloc];
}


@end
