//
//  Guide_Data_Controller.h
//  ngb-ipad
//
//  Created by Yu Song on 8/30/13.
//
//

#import <Foundation/Foundation.h>
#import <Foundation/NSJSONSerialization.h>
@interface Guide_Data_Controller : NSObject
  @property NSString *session_id;
  @property  NSString *login;
  @property  NSString *password;
  @property NSString *base_url;

-(NSString*)Login:(NSString*)Name PASSWORD:(NSString*)password;
-(NSArray*)Get_Channel:(NSString*)session_id;
-(NSArray*)Get_Guide:(NSString*)channel_id withSessionId:(NSString*)session_id;

-(NSString*)Get_Date_By_Hour:(int)hour;
-(NSString*)Get_Current_Time_Hour;
@end
