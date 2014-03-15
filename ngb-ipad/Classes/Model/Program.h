//
//  Program.h
//  ngb-ipad
//
//  Created by Julian Król on 09/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface Program : NSObject{
  NSString *_id;
  NSString *_name;
  NSString *_description;
  NSString *_episodeName;
  NSString *_literature;
  NSString *_countries;
  NSString *_producers;
  NSString *_releaseDate;
  NSString *_genres;
  NSString *_directors;
  NSString *_seasonNumber;
  NSString *_episodeNumber;
  NSString *_trivia;
  NSString *_poster_id;
  NSString *_general_id;
  NSString *_timetable;
  NSString *_defaultBannerPic;
}

@property(nonatomic, copy) NSString *id;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *description;
@property(nonatomic, copy) NSString *episodeName;
@property(nonatomic, copy) NSString *literature;
@property(nonatomic, copy) NSString *countries;
@property(nonatomic, copy) NSString *producers;
@property(nonatomic, copy) NSString *releaseDate;
@property(nonatomic, copy) NSString *genres;
@property(nonatomic, copy) NSString *directors;
@property(nonatomic, copy) NSString *seasonNumber;
@property(nonatomic, copy) NSString *episodeNumber;
@property(nonatomic, copy) NSString *trivia;
@property(nonatomic, copy) NSString *poster_id;
@property(nonatomic, copy) NSString *general_id;
@property(nonatomic, copy) NSString *timetable;
@property(nonatomic, copy) NSString *defaultBannerPic;


@end
