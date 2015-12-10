//
//  GuoViewCell.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GuoViewCell.h"

@implementation GuoViewCell
-(UILabel *)titleLb
{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc]init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
        }];
        _titleLb.numberOfLines = 0;
    }return _titleLb;
}
-(TRImageView *)iconIV
{
    if (_iconIV == nil) {
        _iconIV = [[TRImageView alloc]init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            //make.size.mas_equalTo(CGSizeMake(40, 40));
            make.bottom.mas_equalTo(-10);
            make.width.mas_equalTo(80);
        }];
    }return _iconIV;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
