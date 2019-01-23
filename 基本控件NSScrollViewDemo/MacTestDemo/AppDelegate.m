//
//  AppDelegate.m
//  MacTestDemo
//
//  Created by MacOS on 2019/1/23.
//  Copyright © 2019 MacOS. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<NSWindowDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic,strong)NSScrollView *scrollView;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    //监控window变化
    self.window.delegate = self;
    [self.window center];
    self.window.maxSize = NSMakeSize(1280, 800);
    self.window.minSize = NSMakeSize(1080, 720);
    
    NSScrollView *scrollView = [[NSScrollView alloc] initWithFrame:CGRectMake(0, 0, 100, self.window.frame.size.height - 20)];
    self.scrollView = scrollView;
    [self.window.contentView addSubview:scrollView];
    
    scrollView.hasHorizontalScroller = NO;
    scrollView.hasVerticalScroller = YES;
    
    //相当于contenSize
    NSView *contentView = [[NSView alloc] initWithFrame:CGRectMake(0, 0, 100, self.window.frame.size.height * 2)];
    scrollView.documentView = contentView;
    
    //垂直方向的滚动条
    NSScroller *scroller = [[NSScroller alloc] initWithFrame:CGRectMake(0, 0, 20, 10)];
    scrollView.verticalScroller = scroller;
    [scroller setScrollerStyle:NSScrollerStyleOverlay];
    
    for (int i = 0; i < 50; i++) {
        NSButton *bt = [[NSButton alloc] initWithFrame:CGRectMake(0, i * 20, 100, 20)];
        
        [bt setButtonType:NSButtonTypeOnOff];
        [bt setTitle:[NSString stringWithFormat:@"第%d个标题",i]];
        bt.tag = i;
        bt.state = NSControlStateValueOn;
        [contentView addSubview:bt];
        
        [bt setTarget:self];
        bt.action = @selector(clickBtn:);
    }
    
    contentView.frame = CGRectMake(0, 0, 100, 20 * 50);
}

- (void)windowDidResize:(NSNotification *)notification{
    
    NSLog(@"----999999 ------" );
    // 根据需要调整NSView上面的别的控件和视图的frame

    self.scrollView.frame = CGRectMake(0, 0, 100, self.window.frame.size.height - 20);
}

- (void)clickBtn:(NSButton *)btn{
    NSLog(@"---%ld------",btn.tag);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
