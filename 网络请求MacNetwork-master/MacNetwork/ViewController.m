//
//  ViewController.m
//  MacNetwork
//
//  Created by mooer on 2018/8/31.
//  Copyright © 2018年 mooer. All rights reserved.
//

#import "ViewController.h"
#import "Https.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    [self postData];
    
}


- (void)postData
{
    //POST请求
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    @"top",@"type",
                                    @"64dec27b41eaef31a59c00930aa68e83",@"key",nil];
    
    Https *http = [[Https alloc]init];
    [http httpAction:dataDic actionType:testUrl finshedBlock:^(id data){
        
        NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        //        NSLog(@"我是拿到的返回值 ： %@",weatherDic);
        
        //        NSString *returnN = [weatherDic objectForKey:@"return"];
        NSData *content = [weatherDic objectForKey:@"reason"];
        NSLog(@"我是拿到的返回成功状态 ： %@",content);
        
        NSDictionary *contentDic = [NSDictionary dictionaryWithDictionary:[weatherDic objectForKey:@"result"]];
        NSArray *contentAre = [contentDic objectForKey:@"data"];
        NSDictionary *contentxDic = [NSDictionary dictionaryWithDictionary:contentAre[0]];
        NSLog(@"我是拿到的数据具体值 ： %@|||",[contentxDic objectForKey:@"title"]);
        
        //        [MyProgressHUD showWaitingWithTitle:@"我是测试提示" time:2];
        
        
        //        [contentDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj,BOOL *stop) {
        //            NSLog(@"key = %@ and obj = %@", key, @"");
        //        }];
    }];
    
    return;
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
