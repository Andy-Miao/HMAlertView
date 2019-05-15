//
//  ViewController.m
//  HMAlertView
//
//  Created by 胡苗 on 2019/4/17.
//  Copyright © 2019年 胡苗. All rights reserved.
//

#import "ViewController.h"
#import "HMAlertView.h"
@interface ViewController ()

@property (nonatomic, strong) HMAlertView *alertView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _alertView = [[HMAlertView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _alertView.hm_block = ^(NSInteger tag) {
        NSLog(@"当前点击的是：%ld",tag);
    };
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
     [_alertView hm_showAlertView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
