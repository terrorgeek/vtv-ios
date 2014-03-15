/* BasicDelegate
 *
 * Created by jkrol on 9/20/12.
 * Copyright 2012 MiQUiDO <http://www.miquido.com/>. All rights reserved.
 */
@class ErrorResponse;

@protocol BasicDelegate <NSObject>
- (void)onError:(ErrorResponse *)error;
@end