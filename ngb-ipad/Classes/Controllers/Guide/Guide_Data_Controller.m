//
//  Guide_Data_Controller.m
//  ngb-ipad
//
//  Created by Yu Song on 8/30/13.
//
//

#import "Guide_Data_Controller.h"

@implementation Guide_Data_Controller
-(id)init
{
    if(self=[super init]){
        self.base_url=@"http://api.cods-dev.ngb.biz:8888/rest/v3/";
    }
    return self;
}
-(NSString*)Login:(NSString *)Name PASSWORD:(NSString *)password
{
    NSError *error;
    NSString *login=@"";
    NSURL *url = [NSURL URLWithString:@"http://api.cods-dev.ngb.biz:8888/rest/v3/login?login=bob.smith@cods.pyctex.net&password=103891baca2751a856b094db796e3fee"];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str = [[NSString alloc] initWithData:received encoding:NSUTF8StringEncoding];
    NSDictionary *json_dic=[NSJSONSerialization JSONObjectWithData:received options:NSJSONReadingMutableLeaves error:&error];
    
    self.session_id=[json_dic objectForKey:@"id"];
    return self.session_id;
}

-(NSArray*)Get_Channel:(NSString *)session_id
{
    NSString *url_string=[[self.base_url stringByAppendingString:@"channels?session="] stringByAppendingString:session_id];
    NSURL *url=[NSURL URLWithString:url_string];
    NSURLRequest *request=[[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:nil
                                                     error:nil];
    NSDictionary *json_dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSArray *result_array=[json_dic objectForKey:@"entry_list"];
    return result_array;
}
-(NSArray*)Get_Guide:(NSString *)channel_id withSessionId:(NSString*)session_id
{
    NSString *url_string=[[[[[[[[self.base_url stringByAppendingString:@"channels/"] stringByAppendingString:channel_id] stringByAppendingString:@"/guide?session=" ] stringByAppendingString:session_id] stringByAppendingString:@"&start_time="] stringByAppendingString:[self Get_Date_By_Hour:4]] stringByAppendingString:@"&end_time="] stringByAppendingString:[self Get_Date_By_Hour:10]];
  //  NSLog(@"%@",url_string);
    NSURL *url=[NSURL URLWithString:url_string];
    NSURLRequest *request=[[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *json_dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSArray *entry_list=[json_dic objectForKey:@"entry_list"];
    NSArray *relation_list=[json_dic objectForKey:@"relationship_list"];
    NSMutableArray *result=[[NSMutableArray alloc] init];
    [result addObject:entry_list];
    [result addObject:relation_list];
    return result;
}

-(NSString*)Get_Date_By_Hour:(int)hour{
    NSDate *r=[NSDate date];
    
    NSDate *date=[NSDate date];
    NSDate *start_time=[NSDate dateWithTimeIntervalSinceNow:hour*60*60];
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"Y-MM-dd+HH:00:00"];
    NSString *str=[NSString stringWithFormat:@"%@",[formatter stringFromDate:start_time]];
    return str;
}
@end
