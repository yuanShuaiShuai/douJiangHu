//
//  VideoViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoCell.h"
#import "VideoViewModel.h"


@interface VideoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)VideoViewModel *videoVM;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation VideoViewController

-(VideoViewModel *)videoVM
{
    if (!_videoVM) {
        _videoVM = [VideoViewModel new];
    }
    return _videoVM;
}
-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[VideoCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.videoVM refreshDataCompletionHandle:^(NSError *error) {
                [_tableView.header endRefreshing];
                [_tableView reloadData];
            }];
        }];
        
        
        _tableView.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self.videoVM getMoreDataCompletionHandle:^(NSError *error) {
                [_tableView.footer endRefreshing];
                [_tableView reloadData];
            }];
        }];

    }return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"视频";
    [Factory addMenuItemToVC:self];
    //_tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView.header beginRefreshing];
}
#pragma mark - UITableView 注意是Group形式,以section区分
//设置section头部高度1像素， 高度最小是1
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
//设置secion脚部高度9像素
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 9;
}
//row的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 720 *540
    CGFloat heigth= kWindowW * 540.0 / 720;
    return heigth;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.videoVM.rowNumber;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.videoVM titleForRow:indexPath.section];
    cell.descLb.text = [self.videoVM descForRow:indexPath.section];
    [cell.iconBtn setBackgroundImageForState:0 withURL:[self.videoVM iconURLForRow:indexPath.section]];
    //赋值
    cell.videoURL=[self.videoVM videoURLForRow:indexPath.section];
    
    return cell;
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
