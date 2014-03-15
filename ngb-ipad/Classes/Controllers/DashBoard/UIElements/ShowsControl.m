/*
 * ShowsControl
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/22/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import "ShowsControl.h"


@implementation ShowsControl {

}
@synthesize arrayOfButtons = _arrayOfButtons;
@synthesize activeSegment;

- (id)initWithFrame:(CGRect)frame andFirstName:(NSString *)name1 second:(NSString *)name2 third:(NSString *)name3{
  self = [super initWithFrame:frame];
  if (self) {
    self.arrayOfButtons = [[[NSMutableArray alloc] init] autorelease];
    ShowsControlButton *firstBut = [self createButtonWithFrame:CGRectMake(0, 0, frame.size.width/3, frame.size.height) andImage:[UIImage imageNamed:@"tab_left@2x.png"] andImageForSelected:[UIImage imageNamed:@"tab_left_selected@2x.png"]]; //TODO Make smaller
    [firstBut addTarget:self action:@selector(setSelected:) forControlEvents:UIControlEventTouchUpInside];
    [firstBut.title setText:name1];
    [self addSubview:firstBut];
    [firstBut setSelected:YES];
    activeSegment = 0;

    ShowsControlButton *secondBut = [self createButtonWithFrame:CGRectMake(frame.size.width/3, 0, frame.size.width/3, frame.size.height) andImage:[UIImage imageNamed:@"tab_middle@2x.png"] andImageForSelected:[UIImage imageNamed:@"tab_middle_selected@2x.png"]];
    [secondBut addTarget:self action:@selector(setSelected:) forControlEvents:UIControlEventTouchUpInside];
    [secondBut.title setText:name2];
    [self addSubview:secondBut];

    ShowsControlButton *thirdBut = [self createButtonWithFrame:CGRectMake(2*frame.size.width/3, 0, frame.size.width/3, frame.size.height) andImage:[UIImage imageNamed:@"tab_right@2x.png"] andImageForSelected:[UIImage imageNamed:@"tab_right_selected@2x.png"]];
    [thirdBut addTarget:self action:@selector(setSelected:) forControlEvents:UIControlEventTouchUpInside];
    [thirdBut.title setText:name3];
    [self addSubview:thirdBut];

    [self.arrayOfButtons addObject:firstBut];
    [self.arrayOfButtons addObject:secondBut];
    [self.arrayOfButtons addObject:thirdBut];


  }
  return self;
}

-(IBAction)setSelected:(id)sender{
  int whichWasTap = -1;
  for(int i=0; i<self.arrayOfButtons.count;i++){
    ShowsControlButton *but = [self.arrayOfButtons objectAtIndex:(NSUInteger)i];
    if(but == sender){
      [but setSelected:YES];
      activeSegment = i;
      whichWasTap = i;
    } else{
      [but setSelected:NO];
    }
  }
  if(whichWasTap == -1){
    @throw [NSException exceptionWithName:@"Bad responder" reason:@"This object cannot be a sender" userInfo:nil];
  }
}

- (void)setFrame:(CGRect)frame {
  [super setFrame:frame];
  int howManyButtons = self.arrayOfButtons.count;
  for(int i=0; i<howManyButtons; i++){
    ShowsControlButton *but = [self.arrayOfButtons objectAtIndex:(NSUInteger)i];
    but.frame = CGRectMake(i*(frame.size.width/howManyButtons), 0, frame.size.width/howManyButtons, frame.size.height);
  }
}


-(ShowsControlButton *)createButtonWithFrame:(CGRect)frame andImage:(UIImage *)img andImageForSelected:(UIImage *)selectedImg{
  ShowsControlButton *button = [[[ShowsControlButton alloc] initWithFrame:frame] autorelease];
  [button setImage:img forState:UIControlStateNormal];
  [button setImage:selectedImg forState:UIControlStateSelected];
  return button;
}


- (void)dealloc {
  [_arrayOfButtons release];
  [super dealloc];
}


@end