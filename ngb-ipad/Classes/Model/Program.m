//
//  Program.m
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Program.h"

@implementation Program
@synthesize id = _id;
@synthesize name = _name;
@synthesize description = _description;
@synthesize episodeName = _episodeName;
@synthesize literature = _literature;
@synthesize countries = _countries;
@synthesize producers = _producers;
@synthesize releaseDate = _releaseDate;
@synthesize genres = _genres;
@synthesize directors = _directors;
@synthesize seasonNumber = _seasonNumber;
@synthesize episodeNumber = _episodeNumber;
@synthesize trivia = _trivia;
@synthesize poster_id = _poster_id;
@synthesize general_id = _general_id;
@synthesize timetable = _timetable;
@synthesize defaultBannerPic = _defaultBannerPic;


- (void)dealloc {
  [_id release];
  [_name release];
  [_description release];
  [_episodeName release];
  [_literature release];
  [_countries release];
  [_producers release];
  [_releaseDate release];
  [_genres release];
  [_directors release];
  [_seasonNumber release];
  [_episodeNumber release];
  [_trivia release];
  [_poster_id release];
  [_general_id release];
  [_timetable release];
  [_defaultBannerPic release];
  [super dealloc];
}


@end
