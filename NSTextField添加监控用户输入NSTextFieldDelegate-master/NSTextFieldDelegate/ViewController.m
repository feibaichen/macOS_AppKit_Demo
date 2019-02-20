//
//  ViewController.m
//  NSTextFieldDelegate
//
//  Created by mooer on 2018/5/23.
//  Copyright © 2018年 mooer. All rights reserved.
//

#import "ViewController.h"
#import "MyNSTextField.h"
@interface ViewController ()<NSTextFieldNotifyingDelegate>
{
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    MyNSTextField *testTF = [[MyNSTextField alloc]init];
    testTF.delegate = self;
    testTF.frame = NSMakeRect( 300 ,100, 100, 100);
    testTF.stringValue = @"我是默认文字";
    [self.view addSubview:testTF];
    
    
}

-(void)textFieldDidChange:(NSTextField *)textField
{
    NSLog(@"textField === %@",textField.stringValue);
}



- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
