//
//  HeadlineListCell.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeadlineListCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
/** 原则上 .h文件中只存放需要被调用get或者set方法的属性 */

@implementation HeadlineListCell
/** 图片 */

-(TRImageView *)iconIV
{
    if (_iconIV == nil) {
        _iconIV = [[TRImageView alloc]init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(220*kWindowW/kWindowH, 320*kWindowH/kWindowW));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
        
    }return _iconIV;
}
/** 标题标签 */

-(UILabel *)titleLb
{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc]init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(20);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-25);
            
        }];
        _titleLb.numberOfLines = 0;
        
    }return _titleLb;
}
/** 添加时间标签 */

-(UILabel *)timeLb
{
    if (_timeLb == nil) {
        _timeLb = [[UILabel alloc]init];
        [self.contentView addSubview:_timeLb];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"4608C356-1B46-4B75-B1D9-033A9FD4B887"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.bottom.mas_equalTo(-10);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(80);
        }];
        _timeLb.font = [UIFont systemFontOfSize:12];
        _timeLb.textColor = [UIColor lightGrayColor];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(5);
        }];
    }return _timeLb;
}
/** 点赞数量 */

-(UILabel *)favoNumLb
{
    if (_favoNumLb == nil) {
        _favoNumLb = [[UILabel alloc]init];
        [self.contentView addSubview:_favoNumLb];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"438115CE-6A51-44C5-9991-9F64E29C6015"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.timeLb.mas_right).mas_equalTo(300);
            make.centerY.mas_equalTo(self.timeLb);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        [_favoNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(5);
            make.centerY.mas_equalTo(imageView);
            
        }];
        _favoNumLb.font = [UIFont systemFontOfSize:12];
        _favoNumLb.textColor = [UIColor lightGrayColor];

        
    }return _favoNumLb;
}
//@property(nonatomic,strong)NSURL *videoURL;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
