//
//  HeadlineListCell.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"


@interface HeadlineListCell : UITableViewCell
/** 图片 */
@property(nonatomic,strong)TRImageView *iconIV;
/** 标题标签 */
@property(nonatomic,strong)UILabel *titleLb;
/** 添加时间标签 */
@property(nonatomic,strong)UILabel *timeLb;
/** 点赞数量 */
@property(nonatomic,strong)UILabel *favoNumLb;
@property(nonatomic,strong)NSURL *videoURL;

@end
