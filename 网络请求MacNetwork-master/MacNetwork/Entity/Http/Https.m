//
//  Https.m
//  MOOER STUDIO
//
//  Created by mooer on 2018/8/7.
//  Copyright © 2018年 mooer. All rights reserved.
//

#import "Https.h"
#import "AFNetworking.h"
#import "Config.h"

#define URL_MIAN  @"http://v.juhe.cn/toutiao/"

@implementation Https


//得到主请求地址，拼接字符串
- (NSString *) myMainUrl:(MyMainUrl) myMainUrl
{
    NSString *mianUrl=nil;
    switch (myMainUrl) {
        case checkUpdateUrl:
            mianUrl = [URL_MIAN stringByAppendingString:@"index"];
            break;
        case testUrl:
            mianUrl = [URL_MIAN stringByAppendingString:@"index"];
            break;
            
        default:
            break;
    }
    return mianUrl;
}


//post
- (void) httpAction:(NSDictionary *)params actionType:(MyMainUrl)myMainUrl finshedBlock:(DataBlock)data{

    NSString *url = [self myMainUrl:myMainUrl];

    NSURL *urlx = [NSURL URLWithString:url];

    AFHTTPClient *httpClientx = [[AFHTTPClient alloc] initWithBaseURL:urlx];

    //组装请求参数
    [httpClientx postPath:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSLog(@"成功:POST");

        data(responseObject);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        NSLog(@"错误:POST");
        
    }];

}


@end


/* JSON数据格式和OC对象的一一对应关系
 {} -> 字典
 [] -> 数组
 "" -> 字符串
 10/10.1 -> NSNumber
 true/false -> NSNumber
 null -> NSNull
 */

