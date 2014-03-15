/*
 * ProgramInfoLeftPanelViewController
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "BaseLeftPanelViewController.h"
#import "Colors.h"
#import "Fonts.h"
#import "Program.h"


@interface ProgramInfoLeftPanelViewController : BaseLeftPanelViewController {
  UIImageView *_descriptionDivider;
  UILabel *_aboutProgramLabel;
  UITextView *_programDescription;
  UILabel *_synopsisLabel;
  UIImageView *_synopsisDivider;
  UIScrollView *_scrollView;
  UIImageView *_synopsisImage;
}

@property(nonatomic, retain) UITextView *programDescription;
@property(nonatomic, retain) UIImageView *synopsisImage;

- (void)update:(Program *)program;


@end
