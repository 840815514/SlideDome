//
//  Hot.h
//  SlideDome
//
//  Created by Mac on 16/11/21.
//  Copyright © 2016年 尤艺琪同学. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hot : NSObject
@property(nonatomic,strong)NSString *name;
//当前热点新闻的状态
@property(nonatomic)BOOL isFinish;
//是否赞
@property(nonatomic)BOOL isSupport;
//是否收藏
@property(nonatomic)BOOL isCollect;
@end
