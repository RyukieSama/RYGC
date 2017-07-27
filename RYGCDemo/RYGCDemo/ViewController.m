//
//  ViewController.m
//  RYGCDemo
//
//  Created by 王荣庆 on 2017/7/27.
//  Copyright © 2017年 Ryukie. All rights reserved.
//

#import "ViewController.h"
#import <GameKit/GameKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if ([self checkGC]) {
        NSLog(@"可以整!");
        [self userLogin];
    }
    
}

- (BOOL)checkGC {
//    3.     Class gcClass = (NSClassFromString(@"GKLocalPlayer"));
//    4.     NSString *reqSysVer = @"4.1";
//    5.     NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
//    6.     BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
//    7.
//    8.     return (gcClass && osVersionSupported);
    
    Class gcClass = (NSClassFromString(@"GKLocalPlayer"));
    NSString *reqSysv = @"4.1";
    NSString *curSysv = [[UIDevice currentDevice] systemVersion];
    BOOL osVerOK = ([curSysv compare:reqSysv options:NSNumericSearch] != NSOrderedAscending);
    
    return (gcClass && osVerOK);
}

- (void)userLogin {
    [GKLocalPlayer localPlayer].authenticateHandler = ^(UIViewController * _Nullable viewController, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"登录成功");
        } else {
            NSLog(@"%@",error);
        }
    };
//    4.2用户登录
//    1. - (void) authenticateLocalPlayer
//    2. {
//        3.     [[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:^(NSError *error){
//            4.         if (error == nil) {
//                5.             //成功处理
//                6.             NSLog(@"成功");
//                7.             NSLog(@"1--alias--.%@",[GKLocalPlayer localPlayer].alias);
//                8.             NSLog(@"2--authenticated--.%d",[GKLocalPlayer localPlayer].authenticated);
//                9.             NSLog(@"3--isFriend--.%d",[GKLocalPlayer localPlayer].isFriend);
//                10.             NSLog(@"4--playerID--.%@",[GKLocalPlayer localPlayer].playerID);
//                11.             NSLog(@"5--underage--.%d",[GKLocalPlayer localPlayer].underage);
//                12.         }else {
//                    13.             //错误处理
//                    14.             NSLog(@"失败  %@",error);
//                    15.         }
//            16.     }];
//        17. }
//    对于开
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
