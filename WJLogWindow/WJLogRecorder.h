//
//  WJLogRecorder.h
//  WJWindowLogs
//
//  Created by 彭维剑 on 2018/12/3.
//  Copyright © 2018 pengweijian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WJLogRecorder : NSObject
+ (instancetype)sharedRecorder;
- (void)showRecord:(BOOL)isShow;
@end

NS_ASSUME_NONNULL_END
