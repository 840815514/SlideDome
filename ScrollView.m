//
//  ScrollView.m
//  SlideDome
//
//  Created by 尤艺琪同学 on 16/11/13.
//  Copyright © 2016年 尤艺琪同学. All rights reserved.
//

#import "ScrollView.h"
#import "UIView+WSBase.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
//btn宽度
#define BtnWidth (ScreenWidth-110)/_headArray.count
//btn高度
#define BtnHeight 40
//btn选中时的蓝色
#define blueColor [UIColor colorWithRed:77.0/255 green:158.0/255 blue:235.0/255 alpha:1]
//btn未选中时颜色
#define grayColor  [UIColor colorWithRed:90.0/255 green:96.0/255 blue:102.0/255 alpha:1]
@implementation ScrollView
{
    CGRect rect;
}
//控件重写方法
-(void)layoutSubviews
{
    [super layoutSubviews];
    if (self != nil)
    {
        self.showsHorizontalScrollIndicator = NO;

    }
}
-(instancetype)initWithFrame:(CGRect)frame
{
  self=[super initWithFrame:frame];
//    if (self != nil)
//    {
   // [self createScrollSubView:frame];
        self.showsHorizontalScrollIndicator = NO;
    
//    }
    return self;
}
//滑动选项卡的HeadArray赋值
-(void)setHeadArray:(NSMutableArray *)headArray{
    _headArray = headArray;
    [self createScrollSubView:self.bounds];
}


-(void)createScrollSubView:(CGRect)frame{
    //滑动视图的颜色
    self.backgroundColor = [UIColor whiteColor];
    //滑动区域
    self.contentSize = CGSizeMake(BtnWidth * _headArray.count, 0);
    //防止滑动时弹跳
    self.bounces = NO;
    
    // 底部的红色指示器
    _indicatorView = [[UIView alloc] init];
    _indicatorView.backgroundColor =blueColor;
    _indicatorView.height = 2;
    _indicatorView.tag = -1;
    _indicatorView.y = BtnHeight-2;
    [self addSubview:_indicatorView];
    
    [self createBtn];
   
}




#pragma amrk -循环创建button
-(void)createBtn{
    //文字下面View的宽度
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:18.5]};
    rect = [@"问问题" boundingRectWithSize:CGSizeMake(ScreenWidth-110, MAXFLOAT)
                                 options:NSStringDrawingUsesLineFragmentOrigin
                              attributes:attributes
                                 context:nil];
    
    for (int i=0; i<_headArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(BtnWidth * i, 0, BtnWidth, BtnHeight);
        button.titleLabel.font = [UIFont systemFontOfSize:18];
        [button setTitle:_headArray[i] forState:UIControlStateNormal];
        [button setTitleColor:grayColor forState:UIControlStateNormal];
        //在这控制界面加载结束后当前显示位置
        if (i==1) {
            [button setTitleColor:blueColor forState:UIControlStateNormal];
            [button.titleLabel sizeToFit];
            _indicatorView.width = rect.size.width;
            _indicatorView.centerX = button.center.x;
            [self buttonAction:button];
        }
        button.tag = i + 1000;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

-(void)buttonAction:(UIButton *)button{
    //获取button的tag
    _currentBtn = (int)button.tag-1000;
    //调用点击改变字体颜色的方法
    [self changeBtntitleColorWith:(int)(button.tag - 1000)];
    //代理方法
    if ([self.SeletedDelegate respondsToSelector:@selector(seletedControllerWith:)]) {
        [self.SeletedDelegate seletedControllerWith:button];
    }
}

-(void)changeBtntitleColorWith:(int)tag{
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIButton class]]) {//判断该subViews是否是button
            //是
            if (obj.tag == tag) {//subViews的tag与按钮的tag一样
                //改变颜色
                [obj setTitleColor:blueColor forState:UIControlStateNormal];
//                // 动画
//                [UIView animateWithDuration:0.2 animations:^{
//                    self.indicatorView.width = rect.size.width*2;
//                    _indicatorView.centerX = obj.center.x;
//                }];
//
//                //----------------------------
//                if (obj.frame.origin.x < ScreenWidth/2)
//                {
//                    [UIView animateWithDuration:0.6 animations:^{
//                        [UIView animateWithDuration:0.25 animations:^{
//                            self.indicatorView.width = rect.size.width;
//                            _indicatorView.centerX = obj.center.x;
//                        }];
//                    }];
//                }
                
                // 动画
                [UIView animateWithDuration:0.5 animations:^{
                    self.indicatorView.width = rect.size.width*2;
                    _indicatorView.centerX = obj.center.x;
                }];
                
                //----------------------------
                if (obj.frame.origin.x < ScreenWidth/2)
                {
                    [UIView animateWithDuration:0.2 animations:^{
                        [UIView animateWithDuration:0.25 animations:^{
                            self.indicatorView.width = rect.size.width;
                            _indicatorView.centerX = obj.center.x;
                        }];
                    }];
                }
                //----------------------------

            }else{//如果obj.tag != tag
                [obj setTitleColor:grayColor forState:UIControlStateNormal];
                obj.titleLabel.font = [UIFont systemFontOfSize:18];
            }
        }
    }];
}


@end
