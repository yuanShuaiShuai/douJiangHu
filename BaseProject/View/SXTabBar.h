//
//  SXTabBar.h
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SXTabBarDelegate <NSObject>

@optional
-(void)ChangeSelIndexForm:(NSInteger)from to:(NSInteger)to;

@end
@interface SXTabBar : UIView

@property(nonatomic,strong)id<SXTabBarDelegate>delegate;

-(void)addImageView;
-(void)addBarButtonWithNorName:(NSString *)nor andDisName:(NSString *)dis andTitle:(NSString *)title;


@end
