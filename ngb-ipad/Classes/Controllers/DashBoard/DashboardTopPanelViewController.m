/*
 * DashboardTopPanelViewController
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "DashboardTopPanelViewController.h"
#import "DashBoardViewController.h"


@interface DashboardTopPanelViewController ()
@property(nonatomic, retain) UIButton *calendarButton;
@property(nonatomic, retain) UILabel *programNameLabel;
@property(nonatomic, retain) FeaturedView *featuredShowView;
@property(nonatomic, retain) Program *program;
@property(nonatomic, copy) NSString *timeTableStr;


@end

@implementation DashboardTopPanelViewController {

}
@synthesize featuredShowView = _featuredShowView;
@synthesize calendarButton = _calendarButton;
@synthesize programNameLabel = _programNameLabel;
@synthesize program = _program;
@synthesize guide_id = _guide_id;
@synthesize timeTableStr = _timeTableStr;


- (void)viewDidLoad {
  [super viewDidLoad];
  self.featuredShowView = [[[FeaturedView alloc] initWithImage:[UIImage imageNamed:@"dashboard_featured_show_landscape.png"] andPoint:CGPointMake(0, 0)] autorelease];
  [self initializeLabels];
  [self initializeButtons];
  [self.view addSubview:self.featuredShowView];
}


- (void)initializeLabels {
  UILabel *featuredLabel = [[[UILabel alloc] initWithFrame:CGRectMake(30, 20 + self.featuredShowView.blackFrame.origin.y, 150, 20)] autorelease];
  [featuredLabel setText:NSLocalizedString(@"dashborad.featuredShow", nil)];
  [featuredLabel setTextAlignment:UITextAlignmentLeft];
  [featuredLabel setTextColor:[Colors whiteColor]];
  [featuredLabel setFont:[Fonts fontWithSize20]];
  [featuredLabel setBackgroundColor:[UIColor clearColor]];
  [self.featuredShowView addSubview:featuredLabel];

  self.programNameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(170, 20 + self.featuredShowView.blackFrame.origin.y, 350, 22)] autorelease];
  [self.programNameLabel setText:NSLocalizedString(@"game.of.throne", nil)];
  [self.programNameLabel setTextColor:[Colors whiteColor]];
  [self.programNameLabel setFont:[Fonts boldFontWithSize20]];
  [self.programNameLabel setBackgroundColor:[UIColor clearColor]];
  [self.featuredShowView addSubview:self.programNameLabel];
}


- (void)initializeButtons {
  UIButton *tuneInButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [tuneInButton setImage:[UIImage imageNamed:@"dashboard_icon_watch.png"] forState:UIControlStateNormal];
  [tuneInButton setFrame:CGRectMake(30, 50 + self.featuredShowView.blackFrame.origin.y, 50, 25)];
  [tuneInButton addTarget:self action:@selector(tuneInButtonPressed) forControlEvents:UIControlEventTouchUpInside];
  [self.featuredShowView addSubview:tuneInButton];

  UIButton *thumbUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [thumbUpButton setImage:[UIImage imageNamed:@"dashboard_thumb_up.png"] forState:UIControlStateNormal];
  [thumbUpButton setFrame:CGRectMake(85, 50 + self.featuredShowView.blackFrame.origin.y, 25, 25)];
  [thumbUpButton addTarget:self action:@selector(thumbUpButtonPressed) forControlEvents:UIControlEventTouchUpInside];
  [self.featuredShowView addSubview:thumbUpButton];

  UIButton *thumbDownButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [thumbDownButton setImage:[UIImage imageNamed:@"dashboard_thumb_down.png"] forState:UIControlStateNormal];
  [thumbDownButton setFrame:CGRectMake(115, 50 + self.featuredShowView.blackFrame.origin.y, 25, 25)];
  [thumbDownButton addTarget:self action:@selector(thumbDownButtonPressed) forControlEvents:UIControlEventTouchUpInside];
  [self.featuredShowView addSubview:thumbDownButton];

  self.calendarButton = [[[UIButton alloc] initWithFrame:CGRectMake(145, 50 + self.featuredShowView.blackFrame.origin.y, 50, 25)] autorelease];
  [self.calendarButton setImage:[UIImage imageNamed:@"dashboard_icon_calendar.png"] forState:UIControlStateNormal];
  [self.calendarButton addTarget:self action:@selector(addToCalendar) forControlEvents:UIControlEventTouchUpInside];
  [self.featuredShowView addSubview:self.calendarButton];
}


- (void)tuneInButtonPressed {
  [WToast showWithText:@"Tuned in Game of Thrones"];
}


- (void)thumbUpButtonPressed {
  [WToast showWithText:@"Thumb up button pressed"];
}


- (void)thumbDownButtonPressed {
  [WToast showWithText:@"Thumb down button pressed"];
}


- (void)addToCalendar {
  if (self.guide_id != nil) {
    [WToast showWithText:@"Added to calendar"];
    [self.parentVC addEventToUpcomingShows:self.program];
    [self postDataToSchedule];
    [[ScheduleData instance] setUpProgram:self.program];
  }
}


- (void)postDataToSchedule {
  [[RemoteDataClient instance] postDataToSchedule:self.guide_id];
}


- (void)update:(Program *)program {
  self.program = program;
  if (self.timeTableStr != nil)
    self.programNameLabel.text = [NSString stringWithFormat:@"%@ %@", program.name, self.timeTableStr];
  else
    self.programNameLabel.text = program.name;
  [self.featuredShowView.backgroundImageView setPathToNetworkImage:[NSString stringWithFormat:@"%@%@?width=768", API_IMAGES_SERVER, program.poster_id]];
}


- (void)setStartTime:(NSString *)startStr andEndTime:(NSString *)endStr {
  self.timeTableStr = [NSString stringWithFormat:@"%@ - %@", startStr, endStr];
}


- (void)dealloc {
  [_featuredShowView release];
  [_calendarButton release];
  [_programNameLabel release];
  [_program release];
  [_guide_id release];
  [_timeTableStr release];
  [super dealloc];
}


@end