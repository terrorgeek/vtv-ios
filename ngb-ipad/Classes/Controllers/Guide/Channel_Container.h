//
//  Channel_Container.h
//  ngb-ipad
//
//  Created by Yu Song on 9/5/13.
//
//

#import <Foundation/Foundation.h>
#import "GuideProgramButton.h"
#import "Foundation/NSJSONSerialization.h"
#import "JSONKit.h"
@interface Channel_Container : NSObject
{
    NSString *session_id;
}
@property NSString *program_name;
@property NSString *start_time;
@property NSString *end_time;
@property GuideProgramButton *guide_program_button;
@property(nonatomic,retain) NSString *session_id;

-(void)Change_Channel:(NSString*)channel_id;
@end
