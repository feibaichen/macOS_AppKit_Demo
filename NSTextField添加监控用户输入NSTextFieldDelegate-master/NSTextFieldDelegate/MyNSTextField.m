//
//  MyNSTextField.m
//  NSTextFieldDelegate
//
//  Created by mooer on 2018/5/23.
//  Copyright © 2018年 mooer. All rights reserved.
//

#import "MyNSTextField.h"

@implementation MyNSTextField

@synthesize delegate;

-(id)init{
    self = [super init];
    if(self){
        [self registerForNotifications];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self registerForNotifications];
    }
    return self;
}

-(id)initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame:frameRect];
    if(self){
        [self registerForNotifications];
    }
    return self;
}

-(void)registerForNotifications{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:NSControlTextDidChangeNotification object:self];
}



-(void)textFieldDidChange:(NSNotification *)notification{
    [self.delegate textFieldDidChange:self];
}

@end
