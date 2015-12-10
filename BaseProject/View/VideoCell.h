//
//  VideoCell.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"


@interface VideoCell : UITableViewCell

@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *descLb;
@property(nonatomic,strong)UIButton *iconBtn;
@property(nonatomic,strong) NSURL *videoURL;

@end
