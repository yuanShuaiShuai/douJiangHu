//
//  LastHandTabBarController.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LastHandTabBarController.h"

#import "VideoViewController.h"
#import "ViewController.h"
@interface LastHandTabBarController ()


@end

@implementation LastHandTabBarController

+(LastHandTabBarController *)standardInstance
{
    static LastHandTabBarController *vc= nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [LastHandTabBarController new];
    });
    return vc;
}

-(id)init
{
    self = [super init];
    if (self) {
        self.tabBar.barStyle = UIBarStyleDefault;
        self.tabBar.backgroundColor = [UIColor colorWithRed:255/255.0 green:237/255.0 blue:155/255.0 alpha:1];
        self.tabBar.translucent = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //为了调用customTabbar懒加载
    // 取消工具栏的透明状态
    self.tabBar.translucent = NO ;
    //初始化三个子视图，放到tabbar中
    
    VideoViewController * VideoVC = [VideoViewController new];
    VideoVC.view.backgroundColor = [UIColor blueColor];
    ViewController *VC = [ViewController new];
    VC.view.backgroundColor = [UIColor yellowColor];
    

    
    UINavigationController *VideoNavi = [[UINavigationController alloc]initWithRootViewController:VideoVC];
    VideoNavi.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"视频" image:[UIImage imageNamed:@"icon4"] selectedImage:[UIImage imageNamed:@"icon1"]];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:VC];
    
    navi.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"相声" image:[UIImage imageNamed:@"icon2"] selectedImage:[UIImage imageNamed:@"icon3"]];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg"]];
    
    self.viewControllers=@[VideoNavi ,navi ];
    
//    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
//    CGContextFillRect(context, rect);
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    [self.tabBar setBackgroundImage:img];
//    [self.tabBar setShadowImage:img];
    
    
//    self.tabBarItem.image = [[UIImage imageNamed:@"icon4"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
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
