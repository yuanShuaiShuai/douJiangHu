//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "GuoViewModel.h"
#import "GuoViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong) GuoViewModel *guoVM;
@property(nonatomic,strong)UITableView *tableView;

@end
@implementation ViewController
-(UITableView *)tableView
{
    if (_tableView==nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[GuoViewCell class] forCellReuseIdentifier:@"Cell"];
        // head.
        _tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.guoVM refreshDataCompletionHandle:^(NSError *error) {
                //刚进来先刷一次
                [_tableView reloadData];
                [_tableView.header endRefreshing];
            }];
        }];
        
        _tableView.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self.guoVM getMoreDataCompletionHandle:^(NSError *error) {
                [_tableView.footer endRefreshing];
                [_tableView reloadData];
            }];
        }];
    }
    return _tableView;
}
-(GuoViewModel *)guoVM{
    if (_guoVM==nil) {
        _guoVM=[GuoViewModel new];
    }
    return _guoVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"相声";
    [Factory addMenuItemToVC:self];
    [self.tableView.header beginRefreshing];
   
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.guoVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GuoViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.iconIV.imageView setImageWithURL:[self.guoVM imageURLForRow:indexPath.row]];
    cell.titleLb.text = [self.guoVM titleForRow:indexPath.row];
    return cell;
}
//去分割线  顶头小奸细
kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//添加后台播放模式,需要在plist文件中添加background modes
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
    //弹出播放页面
    AVPlayerViewController *vc=[AVPlayerViewController new];
    AVPlayer *player=[AVPlayer playerWithURL:[self.guoVM audioURLForRow:indexPath.row]];
    vc.player = player;
    [self presentViewController:vc animated:YES completion:nil];
    [vc.player play];  //弹出之后 自动播放
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
