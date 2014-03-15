/* ErrorResponse
 *
 * Created by raho on 8/12/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 */
#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"
#import "AFNetworking.h"


@interface ErrorResponse : NSObject {
@private
  NSInteger _serverStatusCode;
  NSInteger _errorCode;
  NSString *_errorMessage;
  NSString *_whatFailed;
  int _errorTag;
}
@property(nonatomic) NSInteger serverStatusCode;
@property(nonatomic) NSInteger errorCode;
@property(nonatomic, copy) NSString *errorMessage;
@property(nonatomic, copy) NSString *whatFailed;
@property(nonatomic) int errorTag;


- (id)initWithErrorCode:(NSInteger)errorCode errorMessage:(NSString *)errorMessage;

+ (id)objectWithErrorCode:(NSInteger)errorCode errorMessage:(NSString *)errorMessage;

+ (id)objectForDictionary:(NSDictionary *)dictionary;

+ (id)objectForOperation:(AFHTTPRequestOperation *)operation andError:(NSError *)error;


@end