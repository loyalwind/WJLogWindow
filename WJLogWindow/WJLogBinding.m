//
//  WJLogBinding.m
//  WJWindowLogs
//
//  Created by 彭维剑 on 2018/12/3.
//  Copyright © 2018 pengweijian. All rights reserved.
//

#import "WJLogBinding.h"
#import "fishhook.h"

static void (*orig_NSLog)(NSString * _Nonnull format, ...);
static void (*orig_NSLogv)(NSString * _Nonnull format, va_list args);
static int (*orig_printf)(const char *fmt, ...);

void wj_NSLog(NSString *format, ...);
void wj_NSLogv(NSString * _Nonnull format, va_list args);
int  wj_Printf(const char *fmt, ...);

@interface WJLogBinding ()
/** 所有输出日志  */
@property (nonatomic, strong) NSMutableArray *logs;
@end
static WJLogBinding *__instance = nil;

@implementation WJLogBinding

+ (instancetype)sharedLog
{
    if (__instance) return __instance;
    
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __instance = [super allocWithZone:zone];
    });
    return __instance;
}

- (instancetype)init
{
    if (self = [super init]) {
    
    }
    return self;
}

- (NSMutableArray *)logs
{
    if (!_logs) {
        _logs = [NSMutableArray array];
    }
    return _logs;
}

- (NSArray *)allLogs
{
    return self.logs;
}

+ (void)load
{
    struct rebinding bindings[] = {
        {"NSLog",  wj_NSLog,  (void **)&orig_NSLog},
        {"NSLogv", wj_NSLogv, (void **)&orig_NSLogv},
        {"printf", wj_Printf, (void **)&orig_printf},
    };
    
    size_t count = sizeof(bindings)/sizeof(bindings[0]);
    rebind_symbols(bindings, count);
}
@end


void wj_NSLog(NSString *format, ...)
{
    va_list args;
    if (format) {
        va_start(args, format);
        wj_NSLogv(format, args);
        va_end(args);
    }
}

void wj_NSLogv(NSString * _Nonnull format, va_list args)
{
    NSString *logInfo = [[NSString alloc] initWithFormat:format arguments:args];
    [[WJLogBinding sharedLog].logs addObject:logInfo];
    orig_NSLogv(format, args);
}

int wj_Printf(const char *fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    
    NSString *format = [NSString stringWithUTF8String:fmt];
    NSString *logInfo = [[NSString alloc] initWithFormat:format arguments:args];
    [[WJLogBinding sharedLog].logs addObject:logInfo];
    va_end(args);
    return orig_printf(logInfo.UTF8String);
}
