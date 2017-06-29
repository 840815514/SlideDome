//
//  ViewController.m
//  SlideDome
//
//  Created by 尤艺琪同学 on 16/11/13.
//  Copyright © 2016年 尤艺琪同学. All rights reserved.
//

#import "ViewController.h"
#import "ScrollView.h"
#import "OneViewController.h"
#import "ThreeViewController.h"
#import "TwoViewController.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<seletedControllerDelegate,UIScrollViewDelegate>
//自定义滑动选项卡控件，ScrollView类
@property (weak, nonatomic)IBOutlet ScrollView *scvSmall;
//装载tableViewController的ScrollView
@property (weak, nonatomic) IBOutlet UIScrollView *scvBig;
//盛放所有的UIViewController
@property(nonatomic)NSArray<UITableViewController *> *controllerArr;
@property(nonatomic)UITableViewController *needScrpllToTopPage;
@end

@implementation ViewController
{
    //滑动选项卡数组
    NSArray *headTitleArr;
    
    
    OneViewController *oneVC;
    TwoViewController *twoVC;
    ThreeViewController *threeVC;
}
//懒加载保存盛放所有的UIViewController的数组
-(NSArray<UITableViewController *>*)setControllerArr
{
    if(_controllerArr==nil)
    {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
        OneViewController *oneViewController = [[OneViewController alloc] init];
        [array addObject:oneViewController];
        
        TwoViewController *twoViewController = [[TwoViewController alloc] init];
        [array addObject:twoViewController];
        
        ThreeViewController *threeViewController = [[ThreeViewController alloc] init];
        [array addObject:threeViewController];
        
        _controllerArr=[NSArray arrayWithArray:array];
    }
    return _controllerArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initVarible];
    [self setupUI];
    
}
//初始化
-(void)initVarible
{
   //滑动选项卡上的内容
   headTitleArr=@[@"答主",@"话题",@"问题"];
    //懒加载
   [self setControllerArr];
    //添加父子VC
   [self addContentControllers];
    
}
//设置界面
-(void)setupUI
{
    self.navigationController.navigationBar.hidden=YES;
   // _scvSmall=[[ScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-100, 40)];
    //设置滑动选项卡
    _scvSmall.headArray=headTitleArr.mutableCopy;
    _scvSmall.SeletedDelegate=self;
   // self.navigationItem.titleView=_scvSmall;

    
    //创建一个滑动视图用来滑动TableViewcontroller
    _scvBig.scrollsToTop=NO;
    //设置代理
    _scvBig.delegate = self;
    //设置滑动区域
    _scvBig.contentSize = CGSizeMake(ScreenWidth*headTitleArr.count, 0) ;
    //打开分页功能
    _scvBig.pagingEnabled = YES;
    //设置背景颜色
    _scvBig.backgroundColor = [UIColor lightGrayColor];
    _scvBig.showsHorizontalScrollIndicator=NO;
    [self updateContentViewWithIndex:0];
    [self updateContentViewWithIndex:2];
    [self updateContentViewWithIndex:1];
    [_scvBig setContentOffset:CGPointMake(ScreenWidth, 0)];
    self.automaticallyAdjustsScrollViewInsets=NO;

}

#pragma mark 添加父子VC
- (void)addContentControllers {
    for (NSInteger i = 0; i < _controllerArr.count; i++) {
        UITableViewController *childVC = _controllerArr[i];
        [self addChildViewController:childVC];
    }
}
#pragma mark 添加子VC
- (void)updateContentViewWithIndex:(NSUInteger)index {
    
    UIViewController *childVC = self.childViewControllers[index];
    [_scvBig setContentOffset:CGPointMake(index*ScreenWidth, 0) animated:NO];
    if (childVC.view.superview) {
        return;
    }
   // childVC.view.frame = CGRectMake(ScreenWidth *index, 0, ScreenWidth, CGRectGetHeight(_scvBig.frame));
    childVC.view.frame=_scvBig.bounds;
    [_scvBig addSubview:childVC.view];
}


#pragma mark -底部盛放tableViewController的scrollView的代理方法的实现
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat value = ABS(scrollView.contentOffset.x / scrollView.frame.size.width);
    NSLog(@"cc%f",ceilf(value));
    NSUInteger leftIndex = (int)value;
    NSUInteger rightIndex = leftIndex + 1;
    if (rightIndex < self.scvSmall.subviews.count)
    {
        [_scvSmall changeBtntitleColorWith:ceilf(value)+1000];
        [self updateContentViewWithIndex:ceilf(value)];
     //   [self setScrollToTopWithTableViewIndex:ceil(value)];
    }
}

#pragma mark -头部scrollView的代理方法的实现
-(void)seletedControllerWith:(UIButton *)btn{
    
    _scvBig.contentOffset = CGPointMake(ScreenWidth*(btn.tag - 1000), 0);
     [self updateContentViewWithIndex:btn.tag - 1000];
    if (_scvBig.contentOffset.x == ScreenWidth) {
        [self updateContentViewWithIndex:1];
    }else if (_scvBig.contentOffset.x == ScreenWidth*2){
        [self updateContentViewWithIndex:2];
    }
    
     [_scvSmall changeBtntitleColorWith:_scvBig.contentOffset.x/ScreenWidth+1000];
}


@end
