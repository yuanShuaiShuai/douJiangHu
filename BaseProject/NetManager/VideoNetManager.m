//
//  VideoNetManage.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoNetManager.h"

@implementation VideoNetManager

+ (id)getVideoWithIndex:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle
{
    //拼接字符串
    NSString *path=[NSString stringWithFormat:@"http://c.m.163.com/nc/video/home/%ld-10.html", (long)index];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        //回调
        completionHandle([VideoModel objectWithKeyValues:responseObj], error);
    }];
}

@end
