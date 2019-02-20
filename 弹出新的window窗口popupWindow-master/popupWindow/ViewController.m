//
//  ViewController.m
//  popupWindow
//
//  Created by mooer on 2018/5/23.
//  Copyright © 2018年 mooer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSWindowDelegate>
{
    NSWindow *testWindow;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    NSButton *btn = [[NSButton alloc]initWithFrame:NSMakeRect( 100 ,100, 100, 100)];
    btn.bezelStyle =  NSRoundedBezelStyle;
    [btn setButtonType:0];
    [btn setTitle:@"我是弹出按钮"];
    btn.wantsLayer = YES;
    btn.layer.backgroundColor = [NSColor redColor].CGColor;
    [btn setAction:@selector(btnMethods:)];
    [self.view addSubview:btn];
    
    NSRect frame = CGRectMake(100, 500, 500, 200);
    NSUInteger style =  NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable;
    testWindow = [[NSWindow alloc]initWithContentRect:frame styleMask:style backing:NSBackingStoreBuffered defer:YES];
    testWindow.title = @"弹出窗口";
    testWindow.delegate = self;
    
}

- (void)btnMethods:(NSButton *)but
{
    
    [testWindow orderFront:self];
    
    
    NSButton *btn = [[NSButton alloc]initWithFrame:NSMakeRect( 110 ,105, 100, 50)];
    btn.bezelStyle =  NSRoundedBezelStyle;
    [btn setButtonType:0];
    [btn setTitle:@"点击我返回"];
    btn.wantsLayer = YES;
    btn.layer.backgroundColor = [NSColor redColor].CGColor;
    [btn setAction:@selector(returnMethods:)];
    [testWindow.contentView addSubview:btn];

}

- (void)returnMethods:(NSButton *)but
{
    [testWindow orderOut:self];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
