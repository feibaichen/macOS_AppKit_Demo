//
//  MyNSTextField.h
//  NSTextFieldDelegate
//
//  Created by mooer on 2018/5/23.
//  Copyright © 2018年 mooer. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MyNSTextField;

@protocol NSTextFieldNotifyingDelegate <NSTextFieldDelegate>

@optional

-(void)textFieldDidChange:(NSTextField *_Nullable)textField;

@end

@interface MyNSTextField : NSTextField

@property (nullable, weak) id<NSTextFieldNotifyingDelegate> delegate;

@end
