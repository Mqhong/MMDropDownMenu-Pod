//
//  MMDropDownMenu.m
//  下拉菜单
//
//  Created by mm on 15/12/4.
//  Copyright © 2015年 mm. All rights reserved.
//

#import "MMDropDownMenu.h"

@interface MMDropDownMenu()
/**
 *  将来用来显示具体内容的容器
 */
@property(nonatomic,weak) UIView *containerView;

@end

@implementation MMDropDownMenu

-(UIView *)containerView{
    if (!_containerView) {
        
        //添加一个灰色的背景颜色
        UIView *containView = [[UIView alloc] init];
        [containView setBackgroundColor:[UIColor redColor]];
        [self addSubview:containView];
        self.containerView = containView;
        
//        //添加个一个灰色图片控件
//        UIImageView *containerView = [[UIImageView alloc] init];
//        containerView.image = [UIImage imageNamed:@"popover_background"];
////        containerView.width = 217;
////        containerView.height = 217;
//        containerView.userInteractionEnabled = YES;
//        [self addSubview:containerView];
//        self.containerView = containerView;
    }
    return _containerView;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //清除颜色
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

+(instancetype)menu{
    return [[self alloc] init];
}



-(void)dismiss{
    
    //设置动画
    [UIView animateWithDuration:0.25 animations:^{
        
        [_contentController.view setSize:CGSizeMake(200, 0)];
        
        self.containerView.height = 0;
    
    }];
    
    //设置线程延迟执行这个步骤，等前面的动画执行一部分了再执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self removeFromSuperview];
        //通知外界我 被销毁了，想干什么~~
        if ([self.delegate respondsToSelector:@selector(dropdownMenuDidDismiss:)]) {
            [self.delegate dropdownMenuDidDismiss:self];
        }
        
        
    });
//    self.contentController
    
}


-(void)setContent:(UIView *)content{
    //把传过来的值 保存在了常规变量里面了
    _content = content;
    
    //调整内容的位置
    content.x = 10;
    content.y = 15;
    
//    content.width = self.containerView.width  - 2 *  content.x;
    //调整灰色的高度
    
     [_contentController.view setSize:CGSizeMake(200, 0)];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [_contentController.view setSize:CGSizeMake(200, 100)];
        
        self.containerView.height = CGRectGetMaxY(content.frame)+11;
        
        
    }];
    
    //设置灰色的宽度（灰色的宽度 等于里面白色的宽度）
    self.containerView.width = CGRectGetMaxX(content.frame)+10;
    //设置菜单的尺寸
    
    //添加内容到灰色图片中
    [self.containerView addSubview:content];
    
}

-(void)setContentController:(UIViewController *)contentController{

    _contentController = contentController;
    
    self.content = contentController.view;
    
}

-(void)showFrom:(UIView *)from{
    
    //1.获得最上面的窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    //2添加自己到窗口上
    [window addSubview:self];
    
    //3.设置尺寸
    self.frame = window.bounds;
    
    //4.转换坐标系,从自己的坐标系中 把坐标转换成以window为坐标系的位置
    CGRect rect =  [from convertRect:from.bounds toView:window];
    //4.转化坐标系，从以自己父类的坐标的原点为原点，转换到以Window为坐标系的原地
    //    CGRect rect = [from.superview convertRect:from.frame toView:window];
    
    //4.调整灰色图片的位置
    
    
    self.containerView.centerX = CGRectGetMidX(rect);
    self.containerView.y = CGRectGetMaxY(rect);
    
    //通知外界我显示了，外界想在我显示的时候做些什么，尽管去做吧
    
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidShow:)]) {
        [self.delegate dropdownMenuDidShow:self];
    }
    
}

//在点击事件中 销毁掉自己
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}

@end
