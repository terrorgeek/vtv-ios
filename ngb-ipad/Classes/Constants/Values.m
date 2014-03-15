//
//  Constants.m
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Values.h"

NSString const *API_BASE_LINK_REQUEST = @"http://api.cods-dev.ngb.biz:8888/rest/v3/";//@"http://api.cods-dev.ngb.biz:8888/rest/v3/"; //@"http://api.cods.pyctex.net/rest/v3/";
NSString const *API_LOGIN = @"login";
NSString const *API_PROFILES = @"profiles";
NSString const *API_PROFILE = @"profile";
NSString const *API_SESSION = @"session=";
NSString const *API_NOTIFICATION=@"notification";
NSString const *API_NOTIFICATIONS = @"notifications";
NSString const *API_CHANNELS = @"channels";
NSString const *API_GUIDE = @"guide";
NSString const *API_PROGRAMS = @"programs";
NSString const *API_ACTORS = @"actors";
NSString const *API_FRIENDS = @"friends";
NSString const *API_NUMENTRIES = @"numentries=";
NSString const *API_NUMENTRIES_VALUE = @"100";
NSString const *API_IMAGES = @"images";
NSString const *API_FORMAT_IMAGE = @"format=image";
NSString const *API_IMAGES_SERVER = @"http://img.cods.pyctex.net/";
NSString const *API_START_TIME = @"start_time";
NSString const *API_END_TIME = @"end_time";
NSString const *API_SCHEDULE = @"schedule";

NSString const *PASSWORD = @"BobSmith";
NSString const *DATA_LOGIN = @"login";

float const NOTIFICATIONS_TIME_INTERVAL = 3.0;
float const CHECKING_PROGRAM_TIME_INTERVAL = 3.0;
float const RELOAD_PROFILE_INFO = 3.0;

float const ACTOR_PICTURE_WIDTH = 65.0;
float const ACTOR_PICTURE_HEIGHT = 70.0;

float const NORMAL_SPEED_ANIMATION = 0.5;

NSString const *NOTIFICATION_SESSION_OBTAINED = @"NotificationSessionObtained";
NSString const *NOTIFICATION_HIDE_POSTER_LOADER = @"PosterLoader";
NSString const *NOTIFICATION_UPDATE_SCHEDULE = @"ScheuleUpdateNotification";