//
//  VideoCell.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoCell.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>


@implementation VideoCell
//需要单例播放器  如果每次点击新建一个，两个都点击 就会一起播 只需要一个播放器
//为了保证同一时间只有一个播放器，使用单例模式
+ (AVPlayerViewController *)sharedInstance{
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}
-(UILabel *)titleLb
{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc]init];
        _titleLb.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
           
        }];
    }
    return _titleLb;

}
-(UILabel *)descLb
{
    if (_descLb == nil) {
        _descLb = [[UILabel alloc]init];
        _descLb.font = [UIFont systemFontOfSize:13];
        _descLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            
        }];
    }return _descLb;
}
-(UIButton *)iconBtn
{
    if (_iconBtn ==nil) {
        _iconBtn = [UIButton buttonWithType:0];
        [self.contentView addSubview:_iconBtn];
        [_iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(self.descLb.mas_bottom).mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            //make.size.mas_equalTo(CGSizeMake(kBtnW, kBtnH));
        }];
        [_iconBtn bk_addEventHandler:^(id sender) {
            AVPlayer *player = [AVPlayer playerWithURL:self.videoURL];
            [player play];
            [VideoCell sharedInstance].player = player;
            [_iconBtn addSubview:[VideoCell sharedInstance].view];
            [[VideoCell sharedInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _iconBtn;
}

//如果cell被复用了，需要把cell上的播放器删掉
- (void)prepareForReuse{
    [super prepareForReuse];
    //判断当前cell是否有播放，如果有则删除-->自己想办法
    if ([VideoCell sharedInstance].view.superview == self.iconBtn) {
        [[VideoCell sharedInstance].view removeFromSuperview];
        [VideoCell sharedInstance].player = nil;
    }
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //为了触发播放按钮的懒加载
        self.iconBtn.hidden = NO;
        //设置cell被选中后的背景色
        UIView *view=[UIView new];
        view.backgroundColor=kRGBColor(243, 255, 254);
        self.selectedBackgroundView=view;
        //分割线距离左侧空间
        self.separatorInset=UIEdgeInsetsMake(0, 76, 0, 0);
    
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
