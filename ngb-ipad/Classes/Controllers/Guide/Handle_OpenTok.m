//
//  OpenTok.m
//  ngb-ipad
//
//  Created by Yu Song on 9/3/13.
//
//

#import "Handle_OpenTok.h"

@implementation Handle_OpenTok
{
    OTSession* _session;
    OTPublisher* _publisher;
    OTSubscriber* _subscriber;
}
static double widgetHeight = 240;
static double widgetWidth = 320;

// *** Fill the following variables using your own Project info from the Dashboard  ***
// ***                  (https://dashboard.tokbox.com/projects)                     ***
static bool chat_bool=NO;
static NSString* const kApiKey = @"38142652";
static NSString*  kSessionId = @"1_MX4zODE0MjY1Mn5-TW9uIEphbiAwNiAwODo1MTowMiBQU1QgMjAxNH4wLjgxNzY5Mjc2fg";
static NSString*  kToken = @"T1==cGFydG5lcl9pZD0zODE0MjY1MiZzZGtfdmVyc2lvbj10YnJ1YnktdGJyYi12MC45MS4yMDExLTAyLTE3JnNpZz0wNDBlNWRjM2QwNzk4OGQ3ZmNiZDA5MDc5NWQxOTljMDA5ZGYwMWE2OnJvbGU9cHVibGlzaGVyJnNlc3Npb25faWQ9MV9NWDR6T0RFME1qWTFNbjUtVFc5dUlFcGhiaUF3TmlBd09EbzFNVG93TWlCUVUxUWdNakF4Tkg0d0xqZ3hOelk1TWpjMmZnJmNyZWF0ZV90aW1lPTEzODkwMjcwODQmbm9uY2U9MC41MjM3MTM4NzQ1NTgwNjY3JmV4cGlyZV90aW1lPTEzOTE2MTk0NzEmY29ubmVjdGlvbl9kYXRhPQ==";
static bool subscribeToSelf = NO; // Change to NO if you want to subscribe to streams other than your own.

#pragma mark - View lifecycle

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    [[[UIAlertView alloc] initWithTitle:@"这里是标题" message:@"这里显示的是Message信息" delegate:self cancelButtonTitle:@"Cancel按钮" otherButtonTitles:@"OK",@"Hello",@"World", nil] show];
//   _session = [[OTSession alloc] initWithSessionId:kSessionId
//                                          delegate:self];
//   [self doConnect];
//  NSString *r=[self Login];
//}



- (NSString*)Login
{
    NSError *error;
    NSURL *url = [NSURL URLWithString:@"http://api.cods-dev.ngb.biz/rest/v3/login?login=bob.smith@cods.pyctex.net&password=103891baca2751a856b094db796e3fee"];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSString *str = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    
    NSDictionary *json_dic=[NSJSONSerialization JSONObjectWithData:received options:NSJSONReadingMutableLeaves error:&error];
    
    NSString *session_id=[json_dic objectForKey:@"id"];
    
    self.session_id=session_id;
    //  NSLog(@"login session id:%@",self.session_id);
    // NSLog(@"%@",session_id);
    //  [self Check_Notifications:session_id];
    
    //    NSDate *scheduledTime= [NSDate dateWithTimeIntervalSinceNow:2.0];
    //    NSTimer *timer=[[NSTimer alloc] initWithFireDate:scheduledTime
    //                                            interval:5
    //                                              target:self
    //                                            selector:@selector(task)
    //                                            userInfo:NULL
    //                                             repeats:NO];
    //    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    //    [runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
    return session_id;
}
-(void)Start_Monitor_Notification:(NSString*)session_id
{
    NSString *session=session_id;
    NSDate *scheduledTime= [NSDate dateWithTimeIntervalSinceNow:2.0];
    NSTimer *timer=[[NSTimer alloc] initWithFireDate:scheduledTime
                                            interval:3
                                              target:self
                                            selector:@selector(task:)
                                            userInfo:session
                                             repeats:YES];
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
}



- (NSString*)Get_Token_By_Session:(NSString*)session_id{
    NSError *error;
    NSString *url_base=@"http://opentok.ngb.biz/vtv-web/OpentokSDK/generate_token_for_http_request.php";
    NSString *param=@"?talk_session_id=";
    NSString *temp_url=[url_base stringByAppendingString:param];
    NSString *final_url=[temp_url stringByAppendingString:session_id];
    NSURL *url=[NSURL URLWithString:final_url];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    return str;
}

- (void) Check_Notifications:(NSString*)session_id;
{
    // NSString *session_id=self.session_id;
    NSString *url_str1=@"http://api.cods-dev.ngb.biz/rest/v3/profile/notifications?session=";
    NSString *session_str=session_id;
    NSString *url_str2=[url_str1 stringByAppendingString: session_str];
    NSURL *url = [NSURL URLWithString:url_str2];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         
     }];
    NSError *error;
    NSHTTPURLResponse *response;
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest
                                         returningResponse:&response
                                                     error:&error];
    NSDictionary *json_dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    NSArray *array=[json_dic objectForKey:@"entry_list"];
    NSLog(@"still EXE!!!");
    for(NSDictionary *ddd in array)
    {
        NSString *type=[ddd objectForKey:@"type"];
        NSString *status=[ddd objectForKey:@"status"];
        if([type isEqualToString:@"talk"] && [status isEqualToString:@"new"]&&chat_bool==NO)
        {
            // chat_bool=YES;
            NSLog(@"You have a new Notify!!!!!");
            NSString *subject_id=[ddd objectForKey:@"subject_id"];
            NSArray *array=[subject_id componentsSeparatedByString:@","];
            NSString *invite_session_id=[array objectAtIndex:1];
            NSString *invitor=[array objectAtIndex:2];
            NSString *notification_id=[ddd objectForKey:@"id"];
            //     NSString *invite_token=[array objectAtIndex:3];
            NSString *invite_token=[self Get_Token_By_Session:invite_session_id];
            //   kSessionId=invite_session_id;
            //   kToken=invite_token;
            
            
            //            kSessionId=@"1_MX4zODE0MjY1Mn5-VGh1IFNlcCAwNSAxMToyNDozMCBQRFQgMjAxM34wLjYzNzQzNDM2fg";
            //            kToken=@"T1==cGFydG5lcl9pZD0zODE0MjY1MiZzaWc9ZjhkNDRhYjIzNzc1ODRmMTlkNzc4MjJhZTMyNmJmZGJhM2UxYjMyYjpzZXNzaW9uX2lkPTFfTVg0ek9ERTBNalkxTW41LVZHaDFJRk5sY0NBd05TQXhNVG95TkRvek1DQlFSRlFnTWpBeE0zNHdMall6TnpRek5ETTJmZyZjcmVhdGVfdGltZT0xMzc4NDA1NTU3JnJvbGU9bW9kZXJhdG9yJm5vbmNlPTEzNzg0MDU1NTcuMTAwMjExODIxNjI4ODAmZXhwaXJlX3RpbWU9MTM3ODgzNzU1NyZjb25uZWN0aW9uX2RhdGE9aGVsbG8rd29ybGQlMjE=";
            _session = [[OTSession alloc] initWithSessionId:kSessionId
                                                   delegate:self];
            [self doConnect];
            NSString *content=[invitor stringByAppendingString:@" wanna talk to you!"];
            [[[UIAlertView alloc] initWithTitle:@"message" message:content delegate:self cancelButtonTitle:invitor otherButtonTitles:NULL, nil] show];
            [Handle_OpenTok Delete_Notification:notification_id withSessionId:session_id];
            return;
        }
    }
    if (error ==nil ) {
        // Success mechanism
    }
    else
    {
        //Failure Mechanism
    }
}
+(void)Delete_Notification:(NSString*)notification_id withSessionId:(NSString*)session_id
{
    //    NSString *request_url=[[[[API_BASE_LINK_REQUEST stringByAppendingString:@"notifications/"] stringByAppendingString:@""] stringByAppendingString:@"session="] stringByAppendingString:session_id];
    NSString *request_url=@"http://opentok.ngb.biz/vtv-web/talk_notify/delete_notify.php";
    request_url=[[request_url stringByAppendingString:@"?notify_id="] stringByAppendingString:notification_id];
    NSLog(@"my request url:%@",request_url);
    NSMutableDictionary *data_dic=[[NSMutableDictionary alloc] init];
    [data_dic setObject:notification_id forKey:@"notification-id"];
    NSData *data=[NSJSONSerialization dataWithJSONObject:data_dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *data_string=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //  NSURL *url = [NSURL URLWithString:request_url];
    //  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
    //                                                         cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSData *requestData = [NSData dataWithBytes:[data_string UTF8String] length:[data_string length]];
    
    //      [request setHTTPMethod:@"DELETE"];
    //    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    //    [request setHTTPBody: requestData];
    
    //   NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    NSURL *url = [NSURL URLWithString:request_url];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
}
-(void)task: (id)sender{
    NSString *session_id=(NSString*)[sender userInfo];
    [self Check_Notifications:session_id];
    //  NSLog(@"this is task!");
}

- (void) receivedData:(NSString*)data
{
    // NSLog(@"wocaonima%@",data);
}

- (void) emptyReply{}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return NO;
    } else {
        return YES;
    }
}

- (void)updateSubscriber {
    for (NSString* streamId in _session.streams) {
        OTStream* stream = [_session.streams valueForKey:streamId];
        if (![stream.connection.connectionId isEqualToString: _session.connection.connectionId]) {
            _subscriber = [[OTSubscriber alloc] initWithStream:stream delegate:self];
            break;
        }
    }
}

#pragma mark - OpenTok methods

- (void)doConnect
{
    [_session connectWithApiKey:kApiKey token:kToken];
}

- (void)doPublish
{
    _publisher = [[OTPublisher alloc] initWithDelegate:self];
    _publisher.publishVideo=FALSE;
    _publisher.publishAudio=NO;
    [_publisher setName:[[UIDevice currentDevice] name]];
    [_session publish:_publisher];
    //    [self.view addSubview:_publisher.view];
    [_publisher.view setFrame:CGRectMake(0, 0, widgetWidth, widgetHeight)];
}

- (void)sessionDidConnect:(OTSession*)session
{
    NSLog(@"sessionDidConnect (%@)", session.sessionId);
    [self doPublish];
}

- (void)sessionDidDisconnect:(OTSession*)session
{
    NSString* alertMessage = [NSString stringWithFormat:@"Session disconnected: (%@)", session.sessionId];
    NSLog(@"sessionDidDisconnect (%@)", alertMessage);
    [self showAlert:alertMessage];
}


- (void)session:(OTSession*)mySession didReceiveStream:(OTStream*)stream
{
    NSLog(@"session didReceiveStream (%@)", stream.streamId);
    
    // See the declaration of subscribeToSelf above.
    if ( (subscribeToSelf && [stream.connection.connectionId isEqualToString: _session.connection.connectionId])
        ||
        (!subscribeToSelf && ![stream.connection.connectionId isEqualToString: _session.connection.connectionId])
        ) {
        if (!_subscriber) {
            _subscriber = [[OTSubscriber alloc] initWithStream:stream delegate:self];
        }
    }
}
-(void)Disconnect_OpenTok_Session
{
    [_session disconnect];
}
- (void)session:(OTSession*)session didDropStream:(OTStream*)stream{
    NSLog(@"session didDropStream (%@)", stream.streamId);
    //  NSLog(@"_subscriber.stream.streamId (%@)", _subscriber.stream.streamId);
    if (!subscribeToSelf
        && _subscriber
        && [_subscriber.stream.streamId isEqualToString: stream.streamId])
    {
        _subscriber = nil;
        [self updateSubscriber];
    }
}

- (void)subscriberDidConnectToStream:(OTSubscriber*)subscriber
{
    NSLog(@"subscriberDidConnectToStream (%@)", subscriber.stream.connection.connectionId);
    [subscriber.view setFrame:CGRectMake(0, widgetHeight, widgetWidth, widgetHeight)];
    //   [self.view addSubview:subscriber.view];
}

- (void)publisher:(OTPublisher*)publisher didFailWithError:(OTError*) error {
    NSLog(@"publisher didFailWithError %@", error);
    [self showAlert:[NSString stringWithFormat:@"There was an error publishing."]];
}

- (void)subscriber:(OTSubscriber*)subscriber didFailWithError:(OTError*)error
{
    NSLog(@"subscriber %@ didFailWithError %@", subscriber.stream.streamId, error);
    [self showAlert:[NSString stringWithFormat:@"There was an error subscribing to stream %@", subscriber.stream.streamId]];
}

- (void)session:(OTSession*)session didFailWithError:(OTError*)error {
    NSLog(@"sessionDidFail");
    NSLog(@"This is the error description: %@\nThis is the error code: %d", error.description, error.code);
    [self showAlert:[NSString stringWithFormat:@"There was an error connecting to session %@", session.sessionId]];
}


- (void)showAlert:(NSString*)string {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message from video session"
                                                    message:string
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
