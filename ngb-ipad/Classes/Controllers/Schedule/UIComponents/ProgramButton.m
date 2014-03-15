//
//  ProgramButton.m
//  ngb-ipad
//
//  Created by Julian Król on 10/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProgramButton.h"

@interface ProgramButton ()
@property(nonatomic, retain) UILabel *timetable;
@property(nonatomic, retain) UILabel *movieName;
@property(nonatomic, retain) UIImageView *myBackgroundView;


@end

@implementation ProgramButton
@synthesize programIcon = _programIcon;
@synthesize movieName = _movieName;
@synthesize timetable = _timetable;
@synthesize program = _program;
@synthesize myBackgroundView = _myBackgroundView;


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.myBackgroundView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)] autorelease];
    self.myBackgroundView.layer.cornerRadius = 5.0;
    self.myBackgroundView.layer.masksToBounds = YES;
    self.myBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"schedule_program_background.png"]];
    [self addSubview:self.myBackgroundView];

    [self initializeLabels];
    [self initializeImages];
  }
  return self;
}


- (void)initializeLabels {
  self.movieName = [[[UILabel alloc] initWithFrame:CGRectMake(3, 5, 85, 30)] autorelease];
  self.movieName.backgroundColor = [UIColor clearColor];
  self.movieName.font = [UIFont boldSystemFontOfSize:12];
  [self addSubview:self.movieName];

  self.timetable = [[[UILabel alloc] initWithFrame:CGRectMake(3, 30, 85, 15)] autorelease];
  self.timetable.textColor = [UIColor darkGrayColor];
  self.timetable.backgroundColor = [UIColor clearColor];
  self.timetable.font = [UIFont systemFontOfSize:9];
  [self addSubview:self.timetable];
}


- (void)initializeImages {
  self.programIcon = [[[NINetworkImageView alloc] initWithFrame:CGRectMake(5, 65, 50, 50)] autorelease];
  self.programIcon.alpha = 0;
  [self addSubview:self.programIcon];
}


- (void)setUpMovieName:(NSString *)movieNameStr {
  if ([movieNameStr length] > 20) {
    self.movieName.frame = CGRectMake(5, 2, 80, 45);
    self.timetable.frame = CGRectMake(5, 47, 80, 15);
    self.movieName.numberOfLines = 3;
  } else if ([movieNameStr length] > 12) {
    self.movieName.numberOfLines = 2;
  }
  self.movieName.text = movieNameStr;
}


- (void)setUpTimetable:(NSString *)timetableStr {
  self.timetable.text = timetableStr;
}


- (void)setUpImage:(NSString *)pathToImg isFromWeb:(BOOL)isFromWeb {
  self.programIcon.alpha = 1;
  if (isFromWeb) {
    [self.programIcon setPathToNetworkImage:pathToImg
                             forDisplaySize:CGSizeMake(50, 50)
                                contentMode:UIViewContentModeScaleAspectFit];
  } else {
    self.programIcon.image = [UIImage imageNamed:pathToImg];
  }
}


#pragma mark - changing background
- (void)changeToSelectedBackground {
  self.myBackgroundView.backgroundColor = [UIColor colorWithRed:(CGFloat) 183 / 255 green:(CGFloat) 207 / 255 blue:(CGFloat) 95 / 255 alpha:1.0];
}


- (void)changeToUnselectedBackground {
  self.myBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"schedule_program_background.png"]];
}


- (void)dealloc {
  [_programIcon release];
  [_movieName release];
  [_timetable release];
  [_program release];
  [_myBackgroundView release];
  [super dealloc];
}


@end
