/*
 * ProgramInfoBottomPanelViewController
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "ProgramInfoBottomPanelViewController.h"


@interface ProgramInfoBottomPanelViewController ()
@property(nonatomic, retain) UIImageView *castGreenLineImg;
@property(nonatomic, retain) UILabel *castLabel;
@property(nonatomic, retain) UIButton *prevButton;
@property(nonatomic, retain) UIButton *nextButton;
@property(nonatomic, retain) UILabel *seasonLabel;


@end

@implementation ProgramInfoBottomPanelViewController
@synthesize actorsThumbnails = _actorsThumbnails;
@synthesize castGreenLineImg = _castGreenLineImg;
@synthesize castLabel = _castLabel;
@synthesize seasonGreenLineImg = _seasonGreenLineImg;
@synthesize seasonLabel = _seasonLabel;
@synthesize triviaProgramText = _triviaProgramText;
@synthesize episodeNameLabel = _episodeNameLabel;
@synthesize nextButton = _nextButton;
@synthesize prevButton = _prevButton;


- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
  [self initializeLabelComponents];
  [self initializeImageComponents];
  [self initializeButtonsComponents];
  [self initializeOtherUIComponents];
}


- (void)initializeLabelComponents {
  self.castLabel = [[[UILabel alloc] initWithFrame:CGRectMake(20, 250, 70, 20)] autorelease];
  self.castLabel.backgroundColor = [UIColor clearColor];
  self.castLabel.text = NSLocalizedString(@"prog.info.cast", nil);
  self.castLabel.textColor = [Colors blackColor];
  self.castLabel.font = [Fonts programInfoHeaderFont];
  [self.view addSubview:self.castLabel];

  self.seasonLabel = [[[UILabel alloc] initWithFrame:CGRectMake(20, 20, 270, 20)] autorelease];
  self.seasonLabel.backgroundColor = [UIColor clearColor];
  self.seasonLabel.textColor = [Colors blackColor];
  self.seasonLabel.font = [Fonts programInfoHeaderFont];
  [self.view addSubview:self.seasonLabel];

  self.episodeNameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(20, 55, 250, 20)] autorelease];
  self.episodeNameLabel.textColor = [Colors blackColor];
  self.episodeNameLabel.backgroundColor = [UIColor clearColor];
  [self.view addSubview:self.episodeNameLabel];
}


- (void)initializeImageComponents {
  self.castGreenLineImg = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 280, 450, 2)] autorelease];
  self.castGreenLineImg.backgroundColor = [UIColor clearColor];
  self.castGreenLineImg.image = [UIImage imageNamed:@"dashboard_header_line.png"];
  [self.view addSubview:self.castGreenLineImg];

  self.seasonGreenLineImg = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 50, 450, 2)] autorelease];
  self.seasonGreenLineImg.backgroundColor = [UIColor clearColor];
  self.seasonGreenLineImg.image = [UIImage imageNamed:@"dashboard_header_line.png"];
  [self.view addSubview:self.seasonGreenLineImg];
}


- (void)initializeButtonsComponents {
  self.prevButton = [[[UIButton alloc] initWithFrame:CGRectMake(20, 245, 50, 50)] autorelease];
  [self.prevButton setImage:[UIImage imageNamed:@"button_prev.png"] forState:UIControlStateNormal];
  [self.view addSubview:self.prevButton];

  self.nextButton = [[[UIButton alloc] initWithFrame:CGRectMake(66, 245, 50, 50)] autorelease];
  [self.nextButton setImage:[UIImage imageNamed:@"button_next.png"] forState:UIControlStateNormal];
  [self.view addSubview:self.nextButton];
}


- (void)initializeOtherUIComponents {
  self.triviaProgramText = [[[UITextView alloc] initWithFrame:CGRectMake(20, 80, 450, 170)] autorelease];
  self.triviaProgramText.backgroundColor = [UIColor clearColor];
  self.triviaProgramText.editable = NO;
  self.triviaProgramText.textColor = [Colors blackColor];
  [self.view addSubview:self.triviaProgramText];
}


- (void)setActorsThumbnailsView:(NSMutableArray *)actorsArray {
  for (UIView *view in self.actorsThumbnails.subviews) {
    [view removeFromSuperview];
  }
  self.actorsThumbnails = [[[ActorsThumbnails alloc] init] autorelease];
  if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft) ||
      ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)) {
    [self.actorsThumbnails setFrame:CGRectMake(445, 55, 250, 225)];
    [self.actorsThumbnails createComponent:actorsArray :YES];
  } else {
    self.actorsThumbnails.frame = CGRectMake(0, 335, 480, 180);
    [self.actorsThumbnails createComponent:actorsArray :NO];
  }
  [self.actorsThumbnails setBackgroundColor:[UIColor clearColor]];
  [self.view addSubview:self.actorsThumbnails];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
  [self rotate];
}


- (void)rotate {
  if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft) || ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)) {
    // Landscape
    [self.castLabel setFrame:CGRectMake(465, 20, 70, 20)];
    [self.castGreenLineImg setFrame:CGRectMake(465, 50, 250, 2)];
    [self.seasonGreenLineImg setFrame:CGRectMake(20, 50, 415, 2)];
    [self.actorsThumbnails setFrame:CGRectMake(445, 55, 250, 225)];
    self.triviaProgramText.frame = CGRectMake(20, 80, 410, 170);
    [self.actorsThumbnails repaintComponent:YES];
  } else {
    // Portrait
    [self.castLabel setFrame:CGRectMake(20, 300, 70, 20)];
    [self.castGreenLineImg setFrame:CGRectMake(20, 330, 450, 2)];
    [self.seasonGreenLineImg setFrame:CGRectMake(20, 50, 450, 2)];
    [self.actorsThumbnails setFrame:CGRectMake(0, 335, 480, 180)];
    self.triviaProgramText.frame = CGRectMake(20, 80, 450, 170);
    [self.actorsThumbnails repaintComponent:NO];
  }
}


- (void)setUpSeasonLabelText:(NSString *)seasonNo:(NSString *)episodeNo {
  if (seasonNo == nil && episodeNo == nil)
    self.seasonLabel.text = [NSString stringWithFormat:@"%@, %@", NSLocalizedString(@"prog.info.season", nil), NSLocalizedString(@"prog.info.episode", nil)];
  else
    self.seasonLabel.text = [NSString stringWithFormat:@"%@ %@, %@ %@", NSLocalizedString(@"prog.info.season", nil), seasonNo, NSLocalizedString(@"prog.info.episode", nil), episodeNo];
}


- (void)setUpTriviaText:(NSString *)text {
  self.triviaProgramText.text = text;
}


- (void)dealloc {
  [_actorsThumbnails release];
  [_castGreenLineImg release];
  [_castLabel release];
  [_seasonGreenLineImg release];
  [_seasonLabel release];
  [_triviaProgramText release];
  [_episodeNameLabel release];
  [_nextButton release];
  [_prevButton release];
  [super dealloc];
}
@end