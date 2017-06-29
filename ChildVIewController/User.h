//
//  User.h
//  SlideDome
//
//  Created by Mac on 16/11/21.
//  Copyright © 2016年 尤艺琪同学. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property(nonatomic,strong)NSString *name;
//当前用户是否被标为喜欢
@property(nonatomic)BOOL isLove;

//视频是否免费
@property(nonatomic)BOOL isFree;
@end
