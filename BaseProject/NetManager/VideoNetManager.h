//
//  VideoNetManage.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "VideoModel.h"

@interface VideoNetManager : BaseNetManager
//http://c.m.163.com/nc/video/home/0-10.html
+ (id)getVideoWithIndex:(NSInteger)index kCompletionHandle;


@end
