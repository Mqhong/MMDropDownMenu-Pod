//
//  MMDropDownMenu.h
//  下拉菜单
//
//  Created by mm on 15/12/4.
//  Copyright © 2015年 mm. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"
#import <UIKit/UIKit.h>

@class MMDropDownMenu;
@protocol MMDropDownMenuDelegate <NSObject>

-(void)dropdownMenuDidDismiss:(MMDropDownMenu *)menu;
-(void)dropdownMenuDidShow:(MMDropDownMenu *)menu;

@end

@interface MMDropDownMenu : UIView
@property (nonatomic,weak)id<MMDropDownMenuDelegate>delegate;

+(instancetype)menu;

/**
 *  显示
 */
-(void)showFrom:(UIView *)from;

/**
 *  销毁
 */
-(void)dismiss;

/**
 *  内容
 */
@property(nonatomic,strong) UIView *content;

/**
 *  内容控制器
 */
@property(nonatomic,strong) UIViewController *contentController;
@end
