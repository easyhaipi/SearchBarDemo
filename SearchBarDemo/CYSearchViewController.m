//
//  CYSearchViewController.m
//  SearchBarDemo
//
//  Created by Tinora Li on 2017/3/10.
//  Copyright © 2017年 YPT. All rights reserved.
//

#import "CYSearchViewController.h"

@interface CYSearchViewController ()

@end

@implementation CYSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.showHotSearch = NO;   //隐藏热门搜索
    self.swapHotSeachWithSearchHistory = YES;  //对换热门搜索和历史搜索的未知
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setter/getter
- (void)setCySearchHistoryStyle:(CYSearchHistoryStyle)cySearchHistoryStyle{
    
    _cySearchHistoryStyle = cySearchHistoryStyle;
    
    if (!cySearchHistoryStyle) {  //默认为PYSearchHistoryStyleNormalTag
        self.searchHistoryStyle = PYSearchHistoryStyleNormalTag;
    } else {
        
        self.searchHistoryStyle = (PYSearchHistoryStyle)cySearchHistoryStyle;
    }
}

- (void)setCyDidSearchBlock:(CYDidSearchBlock)cyDidSearchBlock {
    _cyDidSearchBlock = cyDidSearchBlock;
    self.didSearchBlock = (PYDidSearchBlock)cyDidSearchBlock;
}
@end
