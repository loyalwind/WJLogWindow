//
//  WJLogViewController.m
//  WJWindowLogs
//
//  Created by 彭维剑 on 2018/12/3.
//  Copyright © 2018 pengweijian. All rights reserved.
//

#import "WJLogViewController.h"
#import "WJLogRecorder.h"
#import "WJLogBinding.h"

@interface WJLogViewController ()

@end

@implementation WJLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [WJLogBinding class];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(250, 50, 100, 50);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(closeLog:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    NSLog(@"WJLogViewController---viewWillAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    NSLog(@"WJLogViewController---viewWillDisappear");
}

- (void)closeLog:(UIButton *)btn
{
    NSLog(@"---closeLog");

    [[WJLogRecorder sharedRecorder] showRecord:NO];
}

@end
