//
//  Channel_Container.m
//  ngb-ipad
//
//  Created by Yu Song on 9/5/13.
//
//

#import "Channel_Container.h"

@implementation Channel_Container
-(id)init
{
    if(self=[super init]){
        
    }
    return self;
}
-(void)Change_Channel:(NSString *)channel_id 
{
    NSString *session=[self session_id];
    NSString *base_url=@"http://api.cods-dev.ngb.biz:8888/rest/v3/";
    NSString *url_string=[[base_url stringByAppendingString:@"profile/session="] stringByAppendingString:session];
    NSMutableDictionary *data_dic=[[NSMutableDictionary alloc] init];
    [data_dic setObject:channel_id forKey:@"requested_channel_id"];
    NSData *data=[NSJSONSerialization dataWithJSONObject:data_dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *data_string=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:url_string];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSData *requestData = [NSData dataWithBytes:[data_string UTF8String] length:[data_string length]];
    
    [request setHTTPMethod:@"PUT"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    if (connection) {
        NSMutableData *receivedData = [[NSMutableData data] retain];
        NSDictionary *result_dic=[NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableLeaves error:nil];
        
    }
}
@end
