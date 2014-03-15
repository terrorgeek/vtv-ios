//
//  GuideViewController.h
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "BaseTabViewController.h"
#import "GuideProgramButton.h"
#import "RemoteDataClient.h"
#import "Channel_Container.h"
#import "Handle_OpenTok.h"

@interface GuideViewController : BaseViewController<OTSessionDelegate, OTSubscriberDelegate, OTPublisherDelegate> {
  UIImage *_landscapeMockUp;
  UIImage *_portraitMockUp;
  UIImageView *_landscapeMockUpImageView;
  UIImageView *_portraitMockUpImageView;
  int _presentationNo;
  
 // GuideProgramButton *ncis1;
  GuideProgramButton *ncis2; 
  GuideProgramButton *ncis3; 
  GuideProgramButton *ncis4;
  
  GuideProgramButton *mentalist1; 
  GuideProgramButton *mentalist2; 
  GuideProgramButton *mentalist3; 
  GuideProgramButton *mentalist4; 
    Channel_Container *channel_container;
    Handle_OpenTok *opentok;
}
@property(nonatomic, retain) UIImageView *landscapeMockUpImageView;
@property(nonatomic, retain) UIImage *landscapeMockUp;
@property(nonatomic, retain) UIImage *portraitMockUp;
@property(nonatomic, retain) UIImageView *portraitMockUpImageView;
@property(nonatomic) int presentationNo;
@property(nonatomic,retain) Channel_Container *channel_container;
@property(nonatomic,retain) Handle_OpenTok *opentok;

@end
