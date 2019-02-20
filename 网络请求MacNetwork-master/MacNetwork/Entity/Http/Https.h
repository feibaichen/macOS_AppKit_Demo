//
//  Https.h
//  MOOER STUDIO
//
//  Created by mooer on 2018/8/7.
//  Copyright © 2018年 mooer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Https : NSObject

//管理接口地址的枚举类型
typedef enum {
    testUrl,
    checkUpdateUrl

}MyMainUrl;

//回调方法
typedef void (^DataBlock)(id data);

@property (nonatomic,strong) DataBlock dataBlock;

//post
- (void) httpAction:(NSDictionary *)params actionType:(MyMainUrl)myMainUrl finshedBlock:(DataBlock)data;

@end
