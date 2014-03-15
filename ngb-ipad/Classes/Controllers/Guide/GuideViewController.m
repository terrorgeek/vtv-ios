//
//  GuideViewController.m
//  ngb-ipad
//
//  Created by Julian Król on 09/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GuideViewController.h"
#import "Guide_Data_Controller.h"
//#import "Handle_OpenTok.h"
#import <Opentok/Opentok.h>

@implementation GuideViewController{
    OTSession* _session;
    OTPublisher* _publisher;
    OTSubscriber* _subscriber;
}
@synthesize landscapeMockUpImageView = _landscapeMockUpImageView;
@synthesize landscapeMockUp = _landscapeMockUp;
@synthesize portraitMockUp = _portraitMockUp;
@synthesize portraitMockUpImageView = _portraitMockUpImageView;
@synthesize presentationNo = _presentationNo;
static NSString* const kApiKey = @"38142652";    // Replace with your API Key
static NSString* const kSessionId = @"2_MX4zODE0MjY1Mn5-VHVlIEZlYiAyNSAwOToyMTo1NSBQU1QgMjAxNH4wLjIyOTk4ODR-"; // Replace with your generated Session ID
static NSString* const kToken = @"T1==cGFydG5lcl9pZD0zODE0MjY1MiZzZGtfdmVyc2lvbj10YnJ1YnktdGJyYi12MC45MS4yMDExLTAyLTE3JnNpZz01OTJlMjIwNTRkNjNiMDZiZjBjNjlhMzc5MzgyNmM0NjhiMjQ5ZTFiOnJvbGU9cHVibGlzaGVyJnNlc3Npb25faWQ9Ml9NWDR6T0RFME1qWTFNbjUtVkhWbElFWmxZaUF5TlNBd09Ub3lNVG8xTlNCUVUxUWdNakF4Tkg0d0xqSXlPVGs0T0RSLSZjcmVhdGVfdGltZT0xMzkzMzUzMzg2Jm5vbmNlPTAuNDMyNDc0NzMzNTg5ODI4NyZleHBpcmVfdGltZT0xMzk1OTQ1ODkwJmNvbm5lY3Rpb25fZGF0YT0=";
static bool subscribeToSelf = NO; // Change to NO if you want to subscribe to streams other than your own.


- (id)init {
    self = [super init];
    if (self) {
        self.presentationNo = 0;
    }
    return self;
}


- (void)loadView {
    [super loadView];
    _session = [[OTSession alloc] initWithSessionId:kSessionId
                                           delegate:self];
    
    //  self.opentok=[[Handle_OpenTok alloc] init];
    self.landscapeMockUp = [UIImage imageNamed:@"schedule_landscape.png"];
    self.portraitMockUp = [UIImage imageNamed:@"schedule_portrait.png"];
    self.landscapeMockUpImageView = [[[UIImageView alloc] initWithImage:self.landscapeMockUp] autorelease];
    [self.landscapeMockUpImageView setFrame:CGRectMake(0, 0, 1024, 700)];
    
    self.portraitMockUpImageView = [[[UIImageView alloc] initWithImage:self.portraitMockUp] autorelease];
    [self.portraitMockUpImageView setFrame:CGRectMake(0, 0, 770, 1024)];
    UIImage *mockupImg = [UIImage imageNamed:@"guide_mock.png"];
    UIImageView *mockup = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, mockupImg.size.width, mockupImg.size.height)] autorelease];
    [mockup setImage:mockupImg];
    [self.view addSubview:mockup];
    
    //       Guide_Data_Controller *guide_data_controller= [[Guide_Data_Controller alloc] init];
    //       self.channel_container=[[Channel_Container alloc] init];
    //       NSString *session_id=[guide_data_controller Login:NULL PASSWORD:NULL];
    //
    //       self.channel_container.session_id=session_id;
    //       guide_data_controller.session_id=session_id;
    //
    //        NSArray *channels=[guide_data_controller Get_Channel:session_id];
    //        NSString *count=[NSString stringWithFormat:@"%d",[channels count]];
    //    NSLog(@"%@",session_id);
    //    NSLog(@"%@",count);
    //        int y_co=0;
    //    NSMutableArray *all_channels=[[NSMutableArray alloc] init];
    //        for(NSDictionary *dic in channels)
    //        {
    //            NSString *channel_id=[dic objectForKey:@"id"];
    //            NSArray *guide=[guide_data_controller Get_Guide:channel_id withSessionId:session_id];
    //            NSMutableArray *entry_list=[[guide objectAtIndex:0] mutableCopy];
    //            NSMutableArray *relationship_list=[[guide objectAtIndex:1] mutableCopy];
    //
    //            int i=0;int x_co=0;
    //            int r_count=[relationship_list count];
    //            int e_count=[entry_list count];
    //            NSString *aString=[NSString stringWithFormat:@"%d",r_count];
    //            NSString *aString2=[NSString stringWithFormat:@"%d",e_count];
    //            int min=MIN(r_count, e_count);
    //            int index=0;
    //            NSMutableArray *single_channels_guides=[[NSMutableArray alloc] init];
    //
    //        for(i=0;i<min;i++){
    //            //now handle every program's info
    //            NSDictionary *program_entry=[entry_list objectAtIndex:i];
    //            NSDictionary *program_relation=[relationship_list objectAtIndex:i];
    //            NSString *program_name=[program_entry objectForKey:@"name"];
    //            NSString *start_time=[program_relation objectForKey:@"start_time"];
    //
    //            NSString *end_time=[program_relation objectForKey:@"end_time"];
    //            int time_gap=[self Get_Time_Gap_And_Return_Xco:start_time WithEndTime:end_time];
    //            if(index==0){
    //                x_co=[self Get_Time_Gap_And_Return_Xco:[self Get_Current_Time_Hour] WithEndTime:end_time]-300;
    //                index++;
    //            }
    //            NSString *s_time_display=[self Get_Date_By_Stipulate:start_time];
    //            NSString *e_time_display=[self Get_Date_By_Stipulate:end_time];
    //            GuideProgramButton *ncis1 = [[[GuideProgramButton alloc] initWithFrame:CGRectMake(10+x_co, 355+y_co, time_gap*7, 85)] autorelease];
    //            ncis1.channel_id=channel_id;
    //
    //            [ncis1 addTarget:self action:@selector(change_channel:) forControlEvents:UIControlEventTouchUpInside];
    //            [ncis1.programNameLabel setText:program_name];
    //            NSString *time=[[[s_time_display substringFromIndex:11] stringByAppendingString:@"-"] stringByAppendingString:[e_time_display substringFromIndex:11]];
    //
    //            [ncis1.dateLabel setText:time];
    //            ncis1.start_time=s_time_display;
    //            [self.view addSubview:ncis1];
    //            x_co+=time_gap*7;
    //
    //            [single_channels_guides addObject:ncis1];
    //        }
    //        [all_channels addObject:single_channels_guides];
    //        index=0;
    //        y_co+=97;
    //
    //}
    
    //    NSMutableArray *final_result=[[NSMutableArray alloc] init ];
    //    for (int i=0; i<[all_channels count]; i++) {
    //        NSMutableArray *temp=[self New_Bubble_Pop:[all_channels objectAtIndex:i]];
    //        [final_result addObject:temp];
    //    }
    
    
    
    
    //  ncis1 = [[[GuideProgramButton alloc] initWithFrame:CGRectMake(80, 645, 250, 85)] autorelease];
    //  [ncis1 addTarget:self action:@selector(changeToNCIS) forControlEvents:UIControlEventTouchUpInside];
    //  [ncis1.programNameLabel setText:@"NCIS"];
    //  [ncis1.dateLabel setText:@"1:00 pm - 2:00 pm"];
    //  [self.view addSubview:ncis1];
    //
    //
    //
    //  ncis2 = [[[GuideProgramButton alloc] initWithFrame:CGRectMake(332, 645, 250, 85)] autorelease];
    //  ncis2.channel_id=@"this is my new channel id!";
    //    [ncis2 addTarget:self action:@selector(changeToNCIS) forControlEvents:UIControlEventTouchUpInside];
    //
    //  [ncis2.programNameLabel setText:@"NCIS"];
    //  [ncis2.dateLabel setText:@"2:00 pm - 3:00 pm"];
    //  [self.view addSubview:ncis2];
    
    CGRect frame = CGRectMake(450, 200, 300, 50);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:@"disconnect talk" forState: UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    button.tag = 2000;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    CGRect frame2 = CGRectMake(50, 200, 300, 50);
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = frame2;
    [button2 setTitle:@"connect talk" forState: UIControlStateNormal];
    button2.backgroundColor = [UIColor clearColor];
    button2.tag = 2000;
    [button2 addTarget:self action:@selector(start_talk:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    
    ncis3 = [[[GuideProgramButton alloc] initWithFrame:CGRectMake(584, 645, 250, 85)] autorelease];
    [ncis3 addTarget:self action:@selector(changeToNCIS) forControlEvents:UIControlEventTouchUpInside];
    [ncis3.programNameLabel setText:@"NCIS"];
    [ncis3.dateLabel setText:@"3:00 pm - 4:00 pm"];
    [self.view addSubview:ncis3];
    
    mentalist1 = [[[GuideProgramButton alloc] initWithFrame:CGRectMake(78, 355, 250, 85)] autorelease];
    [mentalist1 addTarget:self action:@selector(changeToMentallist) forControlEvents:UIControlEventTouchUpInside];
    [mentalist1.programNameLabel setText:@"The Mentalist"];
    [mentalist1.dateLabel setText:@"1:00 pm - 2:00 pm"];
    [self.view addSubview:mentalist1];
    
    mentalist2 = [[[GuideProgramButton alloc] initWithFrame:CGRectMake(330, 355, 250, 85)] autorelease];
    [mentalist2 addTarget:self action:@selector(changeToMentallist) forControlEvents:UIControlEventTouchUpInside];
    [mentalist2.programNameLabel setText:@"The Mentalist"];
    [mentalist2.dateLabel setText:@"2:00 pm - 3:00 pm"];
    [self.view addSubview:mentalist2];
    
    mentalist3 = [[[GuideProgramButton alloc] initWithFrame:CGRectMake(582, 355, 250, 85)] autorelease];
    [mentalist3 addTarget:self action:@selector(changeToMentallist) forControlEvents:UIControlEventTouchUpInside];
    [mentalist3.programNameLabel setText:@"The Mentalist"];
    [mentalist3.dateLabel setText:@"3:00 pm - 4:00 pm"];
    [self.view addSubview:mentalist3];
    
    UIImageView *greenLine = [[[UIImageView alloc] initWithFrame:CGRectMake(294, 348, 1, 600)] autorelease];
    [greenLine setImage:[UIImage imageNamed:@"green_line.png"]];
    [self.view addSubview:greenLine];
}



-(IBAction) buttonClicked:(id)sender {
    //   [[self opentok] Disconnect_OpenTok_Session];
    [_session disconnect];
    //  _publisher=NULL;
    
    NSLog(@"Button click!!!!");
}
- (void)changeToMentallist {
    [[RemoteDataClient instance] putRequestChannelId:@"506c49f0-2431-d88b-1524-cd12e2374ee0"];
}


- (void)changeToNCIS {
    [[RemoteDataClient instance] putRequestChannelId:@"506c49f0-af3d-5af4-b90b-2e0c1aa56f5b"];
}

-(void)change_channel:(id)sender
{
    GuideProgramButton *s=(GuideProgramButton*)sender;
    //  [[self channel_container] Change_Channel:s.channel_id];
    [[RemoteDataClient instance] putRequestChannelId:s.channel_id];
}
//
//- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
//  [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
//  //[self rotate];
//}


- (void)viewDidAppear:(BOOL)animated {
    /*for (UIView *view in self.view.subviews)
     [view removeFromSuperview];
     self.presentationNo++;
     switch (self.presentationNo%3){
     case 0:
     self.landscapeMockUpImageView.image = [UIImage imageNamed:@"schedule_landscape.png"];
     self.portraitMockUpImageView.image = [UIImage imageNamed:@"schedule_portrait.png"];
     break;
     case 1:
     self.landscapeMockUpImageView.image = [UIImage imageNamed:@"schedule_landscape2.png"];
     self.portraitMockUpImageView.image = [UIImage imageNamed:@"schedule_portrait2.png"];
     break;
     case 2:
     self.landscapeMockUpImageView.image = [UIImage imageNamed:@"schedule_landscape3.png"];
     self.portraitMockUpImageView.image = [UIImage imageNamed:@"schedule_portrait3.png"];
     break;
     default:
     break;
     }
     [self.view addSubview:self.landscapeMockUpImageView];
     [self.view addSubview:self.portraitMockUpImageView];*/
}


- (void)rotate {
    if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft) ||
        ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)) {
        // Landscape
        [self.portraitMockUpImageView setHidden:YES];
        [self.landscapeMockUpImageView setHidden:NO];
    } else {
        // Portrait
        [self.portraitMockUpImageView setHidden:NO];
        [self.landscapeMockUpImageView setHidden:YES];
    }
    
}

- (void)dealloc {
    [_landscapeMockUpImageView release];
    [_landscapeMockUp release];
    [_portraitMockUp release];
    [_portraitMockUpImageView release];
    [super dealloc];
}
-(NSString*) Get_Date_By_Stipulate:(NSString*)date_string{
    NSDateFormatter* dateFormat2 = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    
    [dateFormat2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//设定时间格式,这里可以设置成自己需要的格式
    
    NSDate *date =[dateFormat2 dateFromString:date_string];
    
    NSDate *result_date=[NSDate dateWithTimeInterval:-(4*60*60) sinceDate:date];
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//设定时间格式,这里可以设置成自己需要的格式
    NSString *final=[dateFormat stringFromDate:result_date];
    return final;
}
//
-(int) Get_Time_Gap_And_Return_Xco:(NSString*)start_time WithEndTime:(NSString*)end_time{
    NSDateFormatter *dateformater=[[NSDateFormatter alloc] init];
    [dateformater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *start_date=[dateformater dateFromString:start_time];
    NSDate *end_date=[dateformater dateFromString:end_time];
    float sec=[end_date timeIntervalSinceDate:start_date];
    return (sec/60);
}
-(NSString*)Get_Current_Time_Hour{
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:00:00"];
    NSDate *now=[NSDate date];
    NSString *final=[dateformatter stringFromDate:now];
    return final;
}




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
    //    _publisher = [[OTPublisher alloc] initWithDelegate:self];
    //    [_publisher setName:[[UIDevice currentDevice] name]];
    if(_publisher!=NULL){
        [_session unpublish:_publisher];
        _publisher=NULL;
        _publisher = [[OTPublisher alloc] initWithDelegate:self];
        [_publisher setName:[[UIDevice currentDevice] name]];
        //  _publisher.publishAudio=NO;
        [_session publish:_publisher];
    }
    else{
        [_session publish:_publisher];
    }
    [self.view addSubview:_publisher.view];
    [_publisher.view setFrame:CGRectMake(0, 0, 5, 10)];
}

- (IBAction)start_talk:(id)sender {
    _session = [[OTSession alloc] initWithSessionId:kSessionId
                                           delegate:self];
    [self doConnect];
    NSLog(@"talk started!");
    //[self doPublish];
}

- (IBAction)stop_talk:(id)sender {
    NSLog(@"stop talk!!!!");
    [_session disconnect];
}

- (void)sessionDidConnect:(OTSession*)session
{
    // _publisher=NULL;
    // NSLog(@"sessionDidConnect (%@)", session.sessionId);
    [self doPublish];
}

- (void)sessionDidDisconnect:(OTSession*)session
{
    NSString* alertMessage = [NSString stringWithFormat:@"Session disconnected: (%@)", session.sessionId];
    //  NSLog(@"sessionDidDisconnect (%@)", alertMessage);
    //  [self showAlert:alertMessage];
}


- (void)session:(OTSession*)mySession didReceiveStream:(OTStream*)stream
{
    //  NSLog(@"session didReceiveStream (%@)", stream.streamId);
    
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

- (void)session:(OTSession*)session didDropStream:(OTStream*)stream{
    //   NSLog(@"session didDropStream (%@)", stream.streamId);
    //   NSLog(@"_subscriber.stream.streamId (%@)", _subscriber.stream.streamId);
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
    //  NSLog(@"subscriberDidConnectToStream (%@)", subscriber.stream.connection.connectionId);
    [subscriber.view setFrame:CGRectMake(0, 10, 10, 10)];
    [self.view addSubview:subscriber.view];
}

- (void)publisher:(OTPublisher*)publisher didFailWithError:(OTError*) error {
    // NSLog(@"publisher didFailWithError %@", error);
    [self showAlert:[NSString stringWithFormat:@"There was an error publishing."]];
}

- (void)subscriber:(OTSubscriber*)subscriber didFailWithError:(OTError*)error
{
    //   NSLog(@"subscriber %@ didFailWithError %@", subscriber.stream.streamId, error);
    [self showAlert:[NSString stringWithFormat:@"There was an error subscribing to stream %@", subscriber.stream.streamId]];
}

- (void)session:(OTSession*)session didFailWithError:(OTError*)error {
    // NSLog(@"sessionDidFail");
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
