//
//  WJLogRecorder.m
//  WJWindowLogs
//
//  Created by 彭维剑 on 2018/12/3.
//  Copyright © 2018 pengweijian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJLogRecorder.h"
#import "WJLogViewController.h"

@interface WJLogRecorder ()
/** 窗口  */
@property (nonatomic, strong) UIWindow *window;
@end


static WJLogRecorder *__instance = nil;

@implementation WJLogRecorder

+ (instancetype)sharedRecorder
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

#pragma mark - lazy
- (UIWindow *)window
{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.rootViewController = [[WJLogViewController alloc] init];
        _window.windowLevel = UIWindowLevelNormal + 100;
    }
    return _window;
}
- (void)showRecord:(BOOL)isShow
{
    self.window.hidden = !isShow;

    if (isShow) {
        
    }else{
        
    }
}
@end
