//
//  ViewController.m
//  WJWindowLogs
//
//  Created by 彭维剑 on 2018/12/3.
//  Copyright © 2018 pengweijian. All rights reserved.
//

#import "ViewController.h"
#import "WJLogRecorder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 50, 100, 50);
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(showLog:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    NSLog(@"ViewController---viewWillAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    NSLog(@"ViewController---viewWillDisappear");
}

- (void)showLog:(UIButton *)btn
{
    NSLog(@"---showLog");
    [[WJLogRecorder sharedRecorder] showRecord:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
}


@end
