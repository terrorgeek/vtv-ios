/*
 * ProgramInfoLeftPanelViewController
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "ProgramInfoLeftPanelViewController.h"


@interface ProgramInfoLeftPanelViewController ()
@property(nonatomic, retain) UIImageView *descriptionDivider;
@property(nonatomic, retain) UILabel *aboutProgramLabel;
@property(nonatomic, retain) UIScrollView *scrollView;
@property(nonatomic, retain) UILabel *synopsisLabel;
@property(nonatomic, retain) UIImageView *synopsisDivider;


@end

@implementation ProgramInfoLeftPanelViewController
@synthesize descriptionDivider = _descriptionDivider;
@synthesize aboutProgramLabel = _aboutProgramLabel;
@synthesize programDescription = _programDescription;
@synthesize synopsisDivider = _synopsisDivider;
@synthesize synopsisLabel = _synopsisLabel;
@synthesize scrollView = _scrollView;
@synthesize synopsisImage = _synopsisImage;


- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_left.png"]];
  [self initializeComponents];
}


- (void)initializeComponents {
  self.aboutProgramLabel = [[[UILabel alloc] initWithFrame:CGRectMake(25, 20, 240, 30)] autorelease];
  self.aboutProgramLabel.textColor = [Colors blackColor];
  self.aboutProgramLabel.backgroundColor = [UIColor clearColor];
  self.aboutProgramLabel.font = [Fonts programInfoHeaderFont];
  [self.view addSubview:self.aboutProgramLabel];

  self.descriptionDivider = [[[UIImageView alloc] initWithFrame:CGRectMake(25, 50, 235, 2)] autorelease];
  self.descriptionDivider.image = [UIImage imageNamed:@"dashboard_header_line.png"];
  [self.view addSubview:self.descriptionDivider];

  self.programDescription = [[[UITextView alloc] initWithFrame:CGRectMake(15, 60, 245, 150)] autorelease];
  self.programDescription.backgroundColor = [UIColor clearColor];
  self.programDescription.textColor = [Colors blackColor];
  self.programDescription.editable = NO;
  [self.view addSubview:self.programDescription];

  self.synopsisLabel = [[[UILabel alloc] initWithFrame:CGRectMake(25, 220, 200, 30)] autorelease];
  self.synopsisLabel.backgroundColor = [UIColor clearColor];
  self.synopsisLabel.text = NSLocalizedString(@"prog.info.available.episodes", nil);
  self.synopsisLabel.textColor = [Colors blackColor];
  self.synopsisLabel.font = [Fonts programInfoHeaderFont];
  [self.view addSubview:self.synopsisLabel];

  self.synopsisDivider = [[[UIImageView alloc] initWithFrame:CGRectMake(25, 250, 235, 2)] autorelease];
  self.synopsisDivider.image = [UIImage imageNamed:@"dashboard_header_line.png"];
  [self.view addSubview:self.synopsisDivider];

  self.scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(25, 260, 250, 400)] autorelease];
  self.scrollView.contentSize = CGSizeMake(235, 430);
  [self.view addSubview:self.scrollView];

  self.synopsisImage = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 235, 415)] autorelease];
  self.synopsisImage.image = [UIImage imageNamed:@"program_info_synopsis.png"];
  [self.scrollView addSubview:self.synopsisImage];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
  [self rotate];
}


- (void)rotate {

  if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft) || ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)) {
    // Landscape
    //[self.aboutProgramLabel setFrame:CGRectMake(25, 20, 200, 30)];
    //[self.descriptionDivider setFrame:CGRectMake(25, 50, 235, 2)];
    //[self.programDescription setFrame:CGRectMake(15, 60, 245, 150)];
    //[self.synopsisLabel setFrame:CGRectMake(25, 220, 200, 30)];
    //[self.synopsisDivider setFrame:CGRectMake(25, 250, 235, 2)];
    [self.scrollView setFrame:CGRectMake(25, 260, 250, 400)];
    //[self.synopsisImage setFrame:CGRectMake(0, 0, 235, 415)];
  } else {
    // Portrait
    //[self.aboutProgramLabel setFrame:CGRectMake(25, 20, 200, 30)];
    //[self.descriptionDivider setFrame:CGRectMake(25, 50, 235, 2)];
    //[self.programDescription setFrame:CGRectMake(15, 60, 245, 150)];
    //[self.synopsisLabel setFrame:CGRectMake(25, 220, 200, 30)];
    //[self.synopsisDivider setFrame:CGRectMake(25, 250, 235, 2)];
    [self.scrollView setFrame:CGRectMake(25, 260, 250, 300)];
    //[self.synopsisImage setFrame:CGRectMake(0, 0, 235, 415)];
  }
}


- (void)update:(Program *)program {
  self.aboutProgramLabel.text = program.name;
}


- (void)dealloc {
  [_descriptionDivider release];
  [_aboutProgramLabel release];
  [_programDescription release];
  [_synopsisDivider release];
  [_synopsisLabel release];
  [_scrollView release];
  [_synopsisImage release];
  [super dealloc];
}


@end