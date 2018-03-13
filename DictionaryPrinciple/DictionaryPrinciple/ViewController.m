//
//  ViewController.m
//  DictionaryPrinciple
//
//  Created by bolin on 2018/3/13.
//  Copyright © 2018年 bolin. All rights reserved.
//

#import "ViewController.h"
#import "CustomDictionary.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CustomDictionary *dict = [CustomDictionary dictionary];
    [dict setValue:@"哈哈" forKey:@"李"];
    [dict setValue:@"大家好" forKey:@"李"];
    [dict setValue:@"123" forKey:@"数字"];
    [dict setValue:@"23456" forKey:@"数字"];
    
    NSLog(@"%@", [dict valueForKey:@"李"]);
    NSLog(@"%@", [dict valueForKey:@"数字"]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
