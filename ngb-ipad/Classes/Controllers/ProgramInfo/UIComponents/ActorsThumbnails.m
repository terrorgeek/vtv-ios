//
//  ActorsThumbnails.m
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ActorsThumbnails.h"

@interface ActorsThumbnails ()
@property(nonatomic, retain) NSMutableArray *actorsArray;

@end

@implementation ActorsThumbnails
@synthesize scrollView = _scrollView;
@synthesize actorsArray = _actorsArray;


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
  }
  return self;
}


- (void)createComponent:(NSMutableArray *)actorsArray :(BOOL)isLandscape {
  self.scrollView = [[[UIScrollView alloc] init] autorelease];
  self.actorsArray = actorsArray;
  [self repaintComponent:isLandscape];
  [self addSubview:self.scrollView];
}


- (void)repaintComponent:(BOOL)isLandscape {
  [self clearComponent];
  int iconsInRow = isLandscape ? 3 : 5;
  if (isLandscape)
    self.scrollView.frame = CGRectMake(0, 0, 480, 240);
  else
    self.scrollView.frame = CGRectMake(0, 0, 480, 220);
  self.scrollView.contentSize = CGSizeMake(iconsInRow * ACTOR_PICTURE_WIDTH + 30, (ACTOR_PICTURE_HEIGHT + 40) * (CGFloat) ceil((double) [self.actorsArray count] / (double) iconsInRow));
  int i = 0;
  for (Actor *actor in self.actorsArray) {
    ActorButton *actorButton = [[ActorButton alloc] init];
    [actorButton initializeComponent];
    if (isLandscape)
      actorButton.frame = CGRectMake((i % iconsInRow) * (ACTOR_PICTURE_WIDTH + 30) + 15, (ACTOR_PICTURE_HEIGHT + 40) * (i / iconsInRow), ACTOR_PICTURE_WIDTH, ACTOR_PICTURE_HEIGHT + 20);
    else
      actorButton.frame = CGRectMake((i % iconsInRow) * (ACTOR_PICTURE_WIDTH + 30) + 20, (ACTOR_PICTURE_HEIGHT + 40) * (i / iconsInRow), ACTOR_PICTURE_WIDTH, ACTOR_PICTURE_HEIGHT + 20);

    actorButton.actorAvatar.image = [UIImage imageNamed:@"unknown-person.png"];
    if (![actor.avatar isEqualToString:@""]) {
      NSString *pathToAvatar = [NSString stringWithFormat:@"%@%@/%@?%@&width=75", API_BASE_LINK_REQUEST, API_IMAGES, actor.avatar, API_FORMAT_IMAGE];
      NSLog(@"%@", pathToAvatar);
      [actorButton.actorAvatar setPathToNetworkImage:pathToAvatar forDisplaySize:CGSizeMake(ACTOR_PICTURE_WIDTH, ACTOR_PICTURE_HEIGHT) contentMode:UIViewContentModeScaleAspectFit];
    }

    actorButton.actorNameLabel.text = actor.name;
    [self.scrollView addSubview:actorButton];
    [actorButton release];
    ++i;
  }
}


- (void)clearComponent {
  for (UIView *view in self.scrollView.subviews) {
    [view removeFromSuperview];
  }
}


- (void)dealloc {
  [_scrollView release];
  [_actorsArray release];
  [super dealloc];
}


@end
