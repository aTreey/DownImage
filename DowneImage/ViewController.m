//
//  ViewController.m
//  DowneImage
//
//  Created by Hongpeng Yu on 2017/2/12.
//  Copyright © 2017年 Hongpeng Yu. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"


@interface ViewController ()
@property (nonatomic, strong) NSArray *appInfos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.appInfos = [Model appInfos];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
