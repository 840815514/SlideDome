//
//  UIView+WSBase.h
//  SlideDome
//
//  Created by 尤艺琪同学 on 16/11/13.
//  Copyright © 2016年 尤艺琪同学. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WSBase)
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

//- (CGFloat)x;
//- (void)setX:(CGFloat)x;
/** 在分类中声明@property, 只会生成方法的声明, 不会生成方法的实现和带有_下划线的成员变量*/
@end
