//
//  CustomerHeadView.m
//  基本控件
//
//  Created by MacOS on 2019/1/24.
//  Copyright © 2019 wanglei. All rights reserved.
//

#import "CustomerHeadView.h"

@implementation CustomerHeadView

- (instancetype)initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame:frameRect];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    NSTextField *text = [[NSTextField alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    text.editable = NO;
    [text setStringValue:@"66666"];
    [text setBackgroundColor:[NSColor clearColor]];
    [text setTextColor:[NSColor whiteColor]];
    [self addSubview:text];
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}
@end
