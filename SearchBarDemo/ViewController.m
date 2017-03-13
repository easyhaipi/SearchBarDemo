//
//  ViewController.m
//  SearchBarDemo
//
//  Created by Tinora Li on 2017/3/6.
//  Copyright © 2017年 YPT. All rights reserved.
//

#import "ViewController.h"

#import "CYSearchViewController.h"

#import "SearchTempResultViewController.h"


@interface ViewController ()<UISearchBarDelegate, CYSearchViewControllerDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 35)];
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
    
    
}

#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    CYSearchViewController *cySearchVC = [[CYSearchViewController alloc] init];
    cySearchVC.cySearchHistoryStyle = CYSearchHistoryStyleNormalTag;
    cySearchVC.cySearchDelegate = self;
    cySearchVC.optionsArray = @[@"宝贝", @"店铺", @"数码", @"其它"];
    cySearchVC.cyDidSearchBlock = ^(CYSearchViewController *searchViewController, CYSearchBar *searchBar, NSString *searchText) {
        // 开始搜索执行以下代码
        // 如：跳转到指定控制器        
        [self.navigationController pushViewController:[[SearchTempResultViewController alloc] init] animated:YES];
    };
    [self.navigationController pushViewController:cySearchVC animated:YES];
    
    NSLog(@"searchBarShouldBeginEditing-------------------------");
    
    return NO;
}

#pragma mark - CYSearchViewControllerDelegate
- (void)cy_searchViewController:(CYSearchViewController *)searchViewController searchTextDidChange:(UISearchBar *)seachBar searchText:(NSString *)searchText
{
    if (searchText.length > 0) { // 与搜索条件再搜索
        // 根据条件发送查询（这里模拟搜索）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ // 搜索完毕
            // 显示建议搜索结果
            NSMutableArray *searchSuggestionsM = [NSMutableArray array];
            for (int i = 0; i < arc4random_uniform(5) + 10; i++) {
                NSString *searchSuggestion = [NSString stringWithFormat:@"搜索建议 %d", i];
                [searchSuggestionsM addObject:searchSuggestion];
            }
            // 返回
            searchViewController.searchSuggestions = searchSuggestionsM;
        });
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
