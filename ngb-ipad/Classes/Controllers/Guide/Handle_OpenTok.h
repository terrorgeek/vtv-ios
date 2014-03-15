//
//  OpenTok.h
//  ngb-ipad
//
//  Created by Yu Song on 9/3/13.
//
//

#import <Foundation/Foundation.h>
#import <Opentok/Opentok.h>
#import <Foundation/NSJSONSerialization.h>
#import "Values.h"
@interface Handle_OpenTok : NSObject <OTSessionDelegate, OTSubscriberDelegate, OTPublisherDelegate>
//  @property NSDate *scheduledTime;
@property NSString *talk_session_id;
@property NSString *token;
@property NSString *session_id;

- (void)doConnect;
- (void)doPublish;
- (void)showAlert:(NSString*)string;
- (void)Start_Monitor_Notification:(NSString*)session_id;
- (void) Check_Notifications;
- (NSString*)Login;
+(void)Delete_Notification:(NSString*)notification_id withSessionId:(NSString*)session_id;
-(void)Disconnect_OpenTok_Session;
@end
