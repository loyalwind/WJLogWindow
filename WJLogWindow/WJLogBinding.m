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

void newNSLog(NSString *format, ...);
void newNSLogv(NSString * _Nonnull format, va_list args);
int newPrintf(const char *fmt, ...);

void newNSLog(NSString *format, ...)
{
    va_list args;
    if (format) {
        va_start(args, format);
        newNSLogv(format, args);
        va_end(args);
    }
}

void newNSLogv(NSString * _Nonnull format, va_list args)
{
//    NSString *logInfo = [[NSString alloc] initWithFormat:format arguments:args];
    orig_NSLogv(format, args);
}

int newPrintf(const char *fmt, ...)
{
    va_list args;
    va_start(args, fmt);

    NSString *format = [NSString stringWithUTF8String:fmt];
    NSString *logInfo = [[NSString alloc] initWithFormat:format arguments:args];

    va_end(args);
    return orig_printf(logInfo.UTF8String);
}


@implementation WJLogBinding
+ (void)load
{
    struct rebinding bindings[] = {
        {"NSLog",  newNSLog,  (void **)&orig_NSLog},
        {"NSLogv", newNSLogv, (void **)&orig_NSLogv},
        {"printf", newPrintf, (void **)&orig_printf},
    };
    size_t count = sizeof(bindings)/sizeof(bindings[0]);
    
    rebind_symbols(bindings, count);
}
@end
