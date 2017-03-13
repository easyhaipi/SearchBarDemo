//
//  CYSearchBar.h
//  SearchBarDemo
//
//  Created by Tinora Li on 2017/3/10.
//  Copyright © 2017年 YPT. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SearchBarBgColor [UIColor colorWithRed:162/255.0 green:162/255.0 blue:162/255.0 alpha:0.1] //背景色
@interface CYSearchBar : UISearchBar
@property (nonatomic, copy) NSArray * optionsArray;  //选项数据数组
@end
