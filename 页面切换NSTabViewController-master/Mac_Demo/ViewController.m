//
//  ViewController.m
//  Mac_Demo
//
//  Created by sycf_ios on 2017/8/8.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
-(void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender{
    [self.view.window close];
}

@end
