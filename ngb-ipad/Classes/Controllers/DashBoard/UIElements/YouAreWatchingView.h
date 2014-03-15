/*
 * YouAreWatchingView
 * ngb-ipad
 *
 * Created by Michael Apanowicz on 9/21/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "ProgramView.h"

#import "Fonts.h"
#import "Colors.h"
#import "PopupInviteFriends.h"


@interface YouAreWatchingView : UIView{
  UIImageView *_wholeElement;
  UIButton *_programNameButton;
  UILabel *_programName;
  UIImageView *_programImageView;
  UIButton *_inviteFriendsButton;
  PopupInviteFriends *popup;
  ProgramView *_actualWatchedProgram;
}

@property(nonatomic, retain) UIImageView *wholeElement;
@property(nonatomic, retain) UILabel *programName;
@property(nonatomic, retain) UIImageView *programImageView;
@property(nonatomic, retain) UIButton *programNameButton;
@property(nonatomic, retain) PopupInviteFriends *popup;
@property(nonatomic, retain) ProgramView *actualWatchedProgram;

- (void)changeWatchingProgramName:(NSString *)name;
@end