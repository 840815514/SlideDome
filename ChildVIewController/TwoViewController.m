//
//  TwoViewController.m
//  ChildViewController
//
//  Created by mac on 16/9/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TwoViewController.h"
#import "Hot.h"
@interface TwoViewController ()<UITableViewDelegate,UITableViewDataSource>
//保存当前界面需要现实的对象数组
@property (nonatomic,copy) NSArray *listArr;
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Hot *h1=[Hot new];
    h1.name=@"张三";
    h1.isFinish=YES;
    h1.isCollect=YES;
    h1.isSupport=YES;
    Hot *h2=[Hot new];
    h2.name=@"李四";
    h2.isFinish=NO;
    h2.isCollect=NO;
    h2.isSupport=YES;
    Hot *h3=[Hot new];
    h3.name=@"王五";
    h3.isFinish=YES;
    h3.isCollect=NO;
    h3.isSupport=YES;
    Hot *h4=[Hot new];
    h4.name=@"赵六";
    h4.isFinish=NO;
    h4.isCollect=YES;
    h4.isSupport=YES;
    self.listArr=@[h1,h2,h3,h4];
    
    //tableView隐藏滑动条
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;

    //隐藏tableview分割线
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //保证当前显示不足一页时，无多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.backgroundColor=[UIColor blueColor];
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
    return self.view.frame.size.width/25*14;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"AAAAAAa");
}

@end
