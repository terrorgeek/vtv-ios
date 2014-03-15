/* ErrorResponse
 *
 * Created by raho on 8/12/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 */
#import "ErrorResponse.h"

@implementation ErrorResponse {

}
@synthesize serverStatusCode = _serverStatusCode;
@synthesize errorCode = _errorCode;
@synthesize errorMessage = _errorMessage;
@synthesize whatFailed = _whatFailed;
@synthesize errorTag = _errorTag;


- (id)initWithErrorCode:(NSInteger)errorCode errorMessage:(NSString *)errorMessage {
  self = [super init];
  if (self) {
    _errorCode = errorCode;
    _errorMessage = [errorMessage copy];
  }

  return self;
}


+ (id)objectWithErrorCode:(NSInteger)errorCode errorMessage:(NSString *)errorMessage {
  return [[[ErrorResponse alloc] initWithErrorCode:errorCode errorMessage:errorMessage] autorelease];
}


+ (id)objectForDictionary:(NSDictionary *)dictionary {
  return [[[ErrorResponse alloc] initWithErrorCode:[(NSNumber *) [dictionary objectForKey:@"error_code"] integerValue] errorMessage:[dictionary objectForKey:@"error_msg"]] autorelease];
}


+ (id)objectForOperation:(AFHTTPRequestOperation *)operation andError:(NSError *)error {
  return [[[ErrorResponse alloc] initWithErrorCode:900 errorMessage:[NSString stringWithFormat:@"%@ %@", [error.userInfo objectForKey:@"NSErrorFailingURLKey"],
                                                                                               [error.userInfo objectForKey:@"NSLocalizedDescription"]]] autorelease];
}


- (void)dealloc {
  [_errorMessage release];
  [_whatFailed release];
  [super dealloc];
}


@end