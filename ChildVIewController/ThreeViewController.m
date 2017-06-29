//
//  ThreeViewController.m
//  ChildViewController
//
//  Created by mac on 16/9/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ThreeViewController.h"
#import "User.h"

@interface ThreeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic)NSArray *listArr;
@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    User *u1=[User new];
    u1.isFree=NO;
    u1.name=@"梁文道";
    User *u2=[User new];
    u1.isFree=YES;
    u2.name=@"彭于晏";
    User *u3=[User new];
    u3.name=@"李开复";
    User *u4=[User new];
    u4.name=@"胡歌";
    User *u5=[User new];
    u5.name=@"蒋劲夫";
    self.listArr=@[u1,u2];
    
    
    //tableView隐藏滑动条
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    //隐藏tableview分割线
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //保证当前显示不足一页时，无多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.backgroundColor=[UIColor orangeColor];

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
    CGFloat height=self.view.frame.size.width/75*42;
    return height+85;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"AAAAAAa");
}



#pragma mark-----喜欢按钮触发的方法   HotRespondTableViewCellDelegate
-(void)VideoButtonClicked:(User *)user WithIndexPath:(NSInteger)row
{
    NSLog(@"播放视频");
}

@end
