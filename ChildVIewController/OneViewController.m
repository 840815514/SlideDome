//
//  OneViewController.m
//  ChildViewController
//
//  Created by mac on 16/9/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OneViewController.h"

#import "User.h"
@interface OneViewController ()<UITableViewDelegate,UITableViewDataSource>
//保存当前界面需要现实的对象数组
@property (nonatomic,copy) NSArray *listArr;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    User *u1=[User new];
    u1.name=@"陈信宏";
    u1.isLove=YES;
    User *u2=[User new];
    u2.name=@"彭于晏";
    u2.isLove=NO;
    User *u3=[User new];
    u3.name=@"李开复";
    u3.isLove=YES;
    User *u4=[User new];
    u4.name=@"胡歌";
    u4.isLove=NO;
    User *u5=[User new];
    u5.name=@"蒋劲夫";
    u5.isLove=NO;
    self.listArr=@[u1,u2,u3,u4,u5];
    
    
    //tableView隐藏滑动条
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;

    //隐藏tableview分割线
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //保证当前显示不足一页时，无多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
     self.tableView.backgroundColor=[UIColor purpleColor];
}



#pragma mark-----设置tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {


    
    return nil;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"AAAAAAa");
}








@end
