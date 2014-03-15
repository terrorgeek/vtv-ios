/*
 * ProgramInfoBottomPanelViewController
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "BaseBottomPanelViewController.h"
#import "ActorsThumbnails.h"
#import "Colors.h"
#import "Fonts.h"

@interface ProgramInfoBottomPanelViewController : BaseBottomPanelViewController {
  ActorsThumbnails *_actorsThumbnails;
  UILabel *_castLabel;
  UIImageView *_castGreenLineImg;
  UILabel *_seasonLabel;
  UIImageView *_seasonGreenLineImg;
  UITextView *_triviaProgramText;
  UILabel *_episodeNameLabel;
  UIButton *_nextButton;
  UIButton *_prevButton;
}

@property(nonatomic, retain) ActorsThumbnails *actorsThumbnails;
@property(nonatomic, retain) UIImageView *seasonGreenLineImg;
@property(nonatomic, retain) UITextView *triviaProgramText;
@property(nonatomic, retain) UILabel *episodeNameLabel;


- (void)setActorsThumbnailsView:(NSMutableArray *)actorsArray;

- (void)setUpSeasonLabelText:(NSString *)seasonNo:(NSString *)episodeNo;

- (void)setUpTriviaText:(NSString *)text;

@end
