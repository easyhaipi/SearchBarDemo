//
//  CYSearchViewController.h
//  SearchBarDemo
//
//  Created by Tinora Li on 2017/3/10.
//  Copyright © 2017年 YPT. All rights reserved.
//

#import "PYSearchViewController.h"

@class CYSearchViewController;
typedef void(^CYDidSearchBlock)(CYSearchViewController *searchViewController, CYSearchBar *searchBar, NSString *searchText); // 开始搜索时调用的block

typedef NS_ENUM(NSInteger, CYSearchHistoryStyle) {  // 搜索历史风格
    CYSearchHistoryStyleCell = 1,           // UITableViewCell 风格
    CYSearchHistoryStyleNormalTag,      // PYHotSearchStyleNormalTag 标签风格
    CYSearchHistoryStyleColorfulTag,    // 彩色标签（不带边框，背景色为随机彩色）
    CYSearchHistoryStyleBorderTag,      // 带有边框的标签,此时标签背景色为clearColor
    CYSearchHistoryStyleARCBorderTag,   // 带有圆弧边框的标签,此时标签背景色为clearColor
    CYSearchHistoryStyleDefault = CYSearchHistoryStyleCell // 默认为 PYSearchHistoryStyleCell
};

@protocol CYSearchViewControllerDelegate <NSObject, UITableViewDelegate>

@optional

/** 点击(开始)搜索时调用 */
- (void)cy_searchViewController:(CYSearchViewController *)searchViewController didSearchWithsearchBar:(UISearchBar *)searchBar searchText:(NSString *)searchText;

/** 点击热门搜索时调用，如果实现该代理方法则点击热门搜索时searchViewController:didSearchWithsearchBar:searchText:失效*/
- (void)cy_searchViewController:(CYSearchViewController *)searchViewController didSelectHotSearchAtIndex:(NSInteger)index searchText:(NSString *)searchText;

/** 点击搜索历史时调用，如果实现该代理方法则搜索历史时searchViewController:didSearchWithsearchBar:searchText:失效 */
- (void)cy_searchViewController:(CYSearchViewController *)searchViewController didSelectSearchHistoryAtIndex:(NSInteger)index searchText:(NSString *)searchText;

/** 点击搜索建议时调用，如果实现该代理方法则点击搜索建议时searchViewController:didSearchWithsearchBar:searchText:失效 */
- (void)cy_searchViewController:(CYSearchViewController *)searchViewController didSelectSearchSuggestionAtIndex:(NSInteger)index searchText:(NSString *)searchText;

/** 搜索框文本变化时，显示的搜索建议通过searchViewController的searchSuggestions赋值即可 */
- (void)cy_searchViewController:(CYSearchViewController *)searchViewController  searchTextDidChange:(UISearchBar *)searchBar searchText:(NSString *)searchText;


/** 点击取消时调用，如果没有实现该代理方法，默认执行：[self dismissViewControllerAnimated:YES completion:nil]; */
- (void)didClickCancel:(CYSearchViewController *)searchViewController;

@end

@interface CYSearchViewController : PYSearchViewController
@property (nonatomic, assign) CYSearchHistoryStyle cySearchHistoryStyle;
@property (nonatomic, copy) CYDidSearchBlock cyDidSearchBlock;

/** 代理 */
@property (nonatomic, weak) id<CYSearchViewControllerDelegate> cySearchDelegate;
@end
