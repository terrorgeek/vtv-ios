//
//  ScheduleView.m
//  ngb-ipad
//
//  Created by Julian Król on 10/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScheduleView.h"
#import "ScheduleViewController.h"

@interface ScheduleView ()
@property(nonatomic, retain) UIButton *leftButton;
@property(nonatomic, retain) UIButton *rightButton;
@property(nonatomic, retain) UIButton *dayButton;
@property(nonatomic, retain) UIButton *weekButton;
@property(nonatomic, retain) UIButton *monthButton;
@property(nonatomic, retain) UIImageView *tableBackground;
@property(nonatomic, retain) NSMutableArray *buttonsArray;
@property(nonatomic, retain) Program *oldProgram;


@end

@implementation ScheduleView
@synthesize leftButton = _leftButton;
@synthesize rightButton = _rightButton;
@synthesize dayButton = _dayButton;
@synthesize weekButton = _weekButton;
@synthesize monthButton = _monthButton;
@synthesize tableBackground = _tableBackground;
@synthesize parentViewController = _parentViewController;
@synthesize buttonsArray = _buttonsArray;
@synthesize oldProgram = _oldProgram;


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.buttonsArray = [[[NSMutableArray alloc] init] autorelease];
    [self setUpButtons];
    [self generateHourLabels];
    [self generateDayLabels];
    [self addProgramButtons];
  }
  return self;
}


- (void)setUpButtons {
  self.leftButton = [[[UIButton alloc] initWithFrame:CGRectMake(10, 10, 46, 32)] autorelease];
  [self.leftButton setImage:[UIImage imageNamed:@"button_prev.png"] forState:UIControlStateNormal];
  [self addSubview:self.leftButton];

  self.rightButton = [[[UIButton alloc] initWithFrame:CGRectMake(57, 10, 46, 32)] autorelease];
  [self.rightButton setImage:[UIImage imageNamed:@"button_next.png"] forState:UIControlStateNormal];
  [self addSubview:self.rightButton];

  self.dayButton = [[[UIButton alloc] initWithFrame:CGRectMake(600, 10, 40, 32)] autorelease];
  [self.dayButton setBackgroundImage:[UIImage imageNamed:@"popup_green_button.png"] forState:UIControlStateNormal];
  self.dayButton.titleLabel.font = [UIFont systemFontOfSize:12];
  [self.dayButton setTitle:NSLocalizedString(@"day", nil) forState:UIControlStateNormal];
  [self addSubview:self.dayButton];

  self.weekButton = [[[UIButton alloc] initWithFrame:CGRectMake(650, 10, 40, 32)] autorelease];
  [self.weekButton setBackgroundImage:[UIImage imageNamed:@"popup_green_button.png"] forState:UIControlStateNormal];
  self.weekButton.titleLabel.font = [UIFont systemFontOfSize:12];
  [self.weekButton setTitle:NSLocalizedString(@"week", nil) forState:UIControlStateNormal];
  [self addSubview:self.weekButton];

  self.monthButton = [[[UIButton alloc] initWithFrame:CGRectMake(700, 10, 40, 32)] autorelease];
  [self.monthButton setBackgroundImage:[UIImage imageNamed:@"popup_green_button.png"] forState:UIControlStateNormal];
  self.monthButton.titleLabel.font = [UIFont systemFontOfSize:12];
  [self.monthButton setTitle:NSLocalizedString(@"month", nil) forState:UIControlStateNormal];
  [self addSubview:self.monthButton];

  self.tableBackground = [[[UIImageView alloc] initWithFrame:CGRectMake(10, 70, 750, 540)] autorelease];
  self.tableBackground.image = [UIImage imageNamed:@"guide_table.png"];
  [self addSubview:self.tableBackground];
}


- (void)generateHourLabels {
  NSDate *hours = [NSDate date];
  NSDateFormatter *timeFormatter = [[[NSDateFormatter alloc] init] autorelease];
  [timeFormatter setDateFormat:@"hh a"];
  hours = [hours dateByAddingTimeInterval:-3600];
  for (int i = 0; i < 6; ++i) {
    if (i != 0)
      hours = [hours dateByAddingTimeInterval:3600];
    UILabel *hourLabel = [[[UILabel alloc] initWithFrame:CGRectMake(22, 129 + 75 * i, 60, 20)] autorelease];
    hourLabel.text = [NSString stringWithFormat:@"%@", [timeFormatter stringFromDate:hours]];
    hourLabel.font = [UIFont systemFontOfSize:14];
    hourLabel.backgroundColor = [UIColor clearColor];
    hourLabel.textColor = [UIColor darkGrayColor];
    [self addSubview:hourLabel];
  }
}


- (void)generateDayLabels {
  NSDate *now = [NSDate date];
  NSDateFormatter *weekday = [[[NSDateFormatter alloc] init] autorelease];
  [weekday setDateFormat:@"EEE MM/dd"];
  for (int i = 0; i < 7; ++i) {
    if (i != 0)
      now = [now dateByAddingTimeInterval:86400];
    UILabel *dayLabel = [[[UILabel alloc] initWithFrame:CGRectMake(90 + 98 * i, 35, 80, 100)] autorelease];
    dayLabel.text = [NSString stringWithFormat:@"%@", [weekday stringFromDate:now]];
    dayLabel.font = [UIFont systemFontOfSize:14];
    dayLabel.backgroundColor = [UIColor clearColor];
    dayLabel.textColor = [UIColor darkGrayColor];
    [self addSubview:dayLabel];
  }
}


- (void)addProgramButtons {
  ProgramButton *howIMetButton = [[[ProgramButton alloc] initWithFrame:CGRectMake(77, 107, 91, 65)] autorelease];
  Program *program = [[[Program alloc] init] autorelease];
  program.name = NSLocalizedString(@"prog.1.name", nil);
  program.description = NSLocalizedString(@"prog.1.desc", nil);
  program.producers = NSLocalizedString(@"prog.1.stars", nil);
  program.defaultBannerPic = NSLocalizedString(@"prog.1.banner", nil);
  program.timetable = NSLocalizedString(@"prog.1.date", nil);
  howIMetButton.program = program;
  [howIMetButton addTarget:self action:@selector(programButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
  [howIMetButton setUpMovieName:program.name];
  [howIMetButton setUpImage:NSLocalizedString(@"prog.1.icon", nil) isFromWeb:NO];
  [howIMetButton setUpTimetable:program.timetable];
  [self.buttonsArray addObject:howIMetButton];
  [self addSubview:howIMetButton];

  ProgramButton *lordOfTheRingButton = [[[ProgramButton alloc] initWithFrame:CGRectMake(176, 185, 91, 208)] autorelease];
  Program *program2 = [[[Program alloc] init] autorelease];
  program2.name = NSLocalizedString(@"prog.2.name", nil);
  program2.description = NSLocalizedString(@"prog.2.desc", nil);
  program2.producers = NSLocalizedString(@"prog.2.stars", nil);
  program2.defaultBannerPic = NSLocalizedString(@"prog.2.banner", nil);
  program2.timetable = NSLocalizedString(@"prog.2.date", nil);
  lordOfTheRingButton.program = program2;
  [lordOfTheRingButton addTarget:self action:@selector(programButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
  [lordOfTheRingButton setUpMovieName:program2.name];
  [lordOfTheRingButton setUpImage:NSLocalizedString(@"prog.2.icon", nil) isFromWeb:NO];
  [lordOfTheRingButton setUpTimetable:program2.timetable];
  [self.buttonsArray addObject:lordOfTheRingButton];
  [self addSubview:lordOfTheRingButton];

  ProgramButton *uefaChampionshipButton = [[[ProgramButton alloc] initWithFrame:CGRectMake(567, 400, 91, 165)] autorelease];
  Program *program3 = [[[Program alloc] init] autorelease];
  program3.description = NSLocalizedString(@"prog.3.desc", nil);
  program3.name = NSLocalizedString(@"prog.3.name", nil);
  program3.producers = NSLocalizedString(@"prog.3.stars", nil);
  program3.defaultBannerPic = NSLocalizedString(@"prog.3.banner", nil);
  program3.timetable = NSLocalizedString(@"prog.3.date", nil);
  uefaChampionshipButton.program = program3;
  [uefaChampionshipButton addTarget:self action:@selector(programButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
  [uefaChampionshipButton setUpMovieName:program3.name];
  [uefaChampionshipButton setUpImage:NSLocalizedString(@"prog.3.icon", nil) isFromWeb:NO];
  [uefaChampionshipButton setUpTimetable:program3.timetable];
  [self.buttonsArray addObject:uefaChampionshipButton];
  [self addSubview:uefaChampionshipButton];
}


#pragma mark - buttons action
- (void)programButtonClicked:(id)sender {
  ProgramButton *clickedButton = sender;
  [self.parentViewController update:clickedButton.program withIcon:clickedButton.programIcon.image];
  for (ProgramButton *button in self.buttonsArray) {
    [button changeToUnselectedBackground];
  }
  [clickedButton changeToSelectedBackground];
}


- (void)update:(Program *)program {
  if (![self.oldProgram.name isEqualToString:program.name]) {
    ProgramButton *newProgramButton = [[[ProgramButton alloc] initWithFrame:CGRectMake(77, 250, 91, 120)] autorelease];
    newProgramButton.program = program;
    [newProgramButton setUpMovieName:program.name];
    [newProgramButton setUpImage:NSLocalizedString(@"icon.for.future.program.in.schedule", nil) isFromWeb:NO];
    [newProgramButton addTarget:self action:@selector(programButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonsArray addObject:newProgramButton];
    [self addSubview:newProgramButton];
    self.oldProgram = program;
  }
}


- (void)dealloc {
  [_leftButton release];
  [_rightButton release];
  [_dayButton release];
  [_weekButton release];
  [_monthButton release];
  [_tableBackground release];
  [_parentViewController release];
  [_buttonsArray release];
  [_oldProgram release];
  [super dealloc];
}


@end
