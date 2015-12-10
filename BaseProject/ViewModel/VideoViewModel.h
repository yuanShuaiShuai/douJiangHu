//
//  VideoViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideoNetManager.h"

@interface VideoViewModel : BaseViewModel

@property(nonatomic) NSInteger rowNumber;
//请求页数的索引值
@property(nonatomic) NSInteger index;

- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)descForRow:(NSInteger)row;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSURL *)videoURLForRow:(NSInteger)row;


@end
