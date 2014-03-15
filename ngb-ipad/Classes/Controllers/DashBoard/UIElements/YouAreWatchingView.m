/*
 * YouAreWatchingView
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/21/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "YouAreWatchingView.h"


@implementation YouAreWatchingView {

}
@synthesize wholeElement = _wholeElement;
@synthesize programName = _programName;
@synthesize programImageView = _programImageView;
@synthesize programNameButton = _programNameButton;
@synthesize popup;
@synthesize actualWatchedProgram = _actualWatchedProgram;


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    UIImage *resizableBackground = [[UIImage imageNamed:@"dashboard_upcoming_background.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    self.wholeElement = [[[UIImageView alloc] initWithImage:resizableBackground] autorelease];
    self.wholeElement.frame = CGRectMake(0, 0, 235, 88);
    [self addSubview:self.wholeElement];

    self.programImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(5, 12, 60, 60)] autorelease];
    [self.programImageView setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.programImageView];

    self.popup = [PopupInviteFriends instance];

    self.actualWatchedProgram = [[[ProgramView alloc] initWithFrame:CGRectMake(0, 0, 235, 88)] autorelease];
    [self.actualWatchedProgram.progressBar setImage:[UIImage imageNamed:@"10minutes@2x.png"]];
    [self.actualWatchedProgram.friendsButton addTarget:self action:@selector(showPopup) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.actualWatchedProgram];

    return self;
  }
}


- (void)showPopup {
  [self.window.rootViewController.view addSubview:self.popup];
}


/*
 *  jk added to fit font size to the length of the programme name
 */
- (void)changeWatchingProgramName:(NSString *)name {
  if ([name length] > 12) {
    self.programName.numberOfLines = 2;
    self.programName.font = [Fonts fontWithSize10];
  } else {
    self.programName.font = [Fonts fontWithSize12];
  }
  self.programName.text = name;
  [self.actualWatchedProgram.programNameLabel setText:name];
}


- (void)dealloc {
  [_programName release];
  [_programImageView release];
  [_wholeElement release];
  [_programNameButton release];
  [popup release];
  [_actualWatchedProgram release];
  [super dealloc];
}


@end