//
//  WJLogBinding.h
//  WJWindowLogs
//
//  Created by 彭维剑 on 2018/12/3.
//  Copyright © 2018 pengweijian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WJLogBinding : NSObject
+ (instancetype)sharedLog;
/** 所有输出日志  */
@property (nonatomic, strong, readonly) NSArray *allLogs;
@end

NS_ASSUME_NONNULL_END
