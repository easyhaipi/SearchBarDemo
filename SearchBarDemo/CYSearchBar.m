//
//  CYSearchBar.m
//  SearchBarDemo
//
//  Created by Tinora Li on 2017/3/10.
//  Copyright © 2017年 YPT. All rights reserved.
//

#import "CYSearchBar.h"

#import "UIImage+Extension.h"
#import "UIButton+Extension.h"

static const CGFloat OptionViewLeftMargin = 8;            //OptionView与左边屏幕的间距
static const CGFloat OptionSubViewMargin = 2;           //每个选项之间上下间距
static const CGFloat OptionViewWidth = 80;              //选项列表视图的宽度
static const CGFloat OptionSubViewHeight = 35;                 //单个选项子项的高度

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface CYSearchBar()
@property (nonatomic, strong) UIButton * searchTypeBtn;

@property (nonatomic, strong) UIView * optionView;     //选项列表
@property (nonatomic, strong) UIView * optionBgView;   //选项列表背景视图
@end

@implementation CYSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSearchBar];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSearchBar];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSearchBar];
    }
    return self;
}

- (void)setupSearchBar {
    
    
    self.placeholder = @"请输入需要搜索的信息";
    
    //取消放大镜
    UITextField *searchField = [self valueForKey:@"_searchField"];
    [searchField setBackgroundColor:SearchBarBgColor];
    UIImage *iconImage = [UIImage imageWithColor:[UIColor clearColor] width:40 height:self.frame.size.height];
    [self setImage:iconImage forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    
    //编辑时显示清除按钮
    [searchField setClearButtonMode:UITextFieldViewModeWhileEditing];
    
    //设置背景色
    UIImage *bgImage = [UIImage imageWithColor:SearchBarBgColor width:self.frame.size.width height:self.frame.size.height];
    [self setBackgroundImage:bgImage];
    
    //调整光标位置
    UIOffset offect = {10, 0};//第一个值是水平偏移量，第二个是竖直方向的偏移量
    self.searchTextPositionAdjustment = offect;
    
    [self.optionBgView addSubview:self.optionView];
    
    [self addSubview:self.searchTypeBtn];
}


#pragma mark - event response
- (void)clickTypeBtn{
    self.optionBgView.hidden = self.optionsArray.count == 0 ? YES : NO;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_optionBgView];
}

- (void)tapOptionBgView{
    self.optionBgView.hidden = YES;
    
}

- (void)clickOptionSubBtn:(UIButton *)btn{
    [self.searchTypeBtn setTitle:btn.currentTitle forState:UIControlStateNormal];
    self.optionBgView.hidden = YES;
}

#pragma mark - setter/getter
- (UIButton *)searchTypeBtn{
    if (_searchTypeBtn == nil) {
        CGFloat btnH = self.frame.size.height;
        CGFloat btnW = btnH;
        NSString *title = self.optionsArray.count > 0 ? [self.optionsArray firstObject] : @"宝贝";
        _searchTypeBtn = [UIButton setButtonAttributeWithFrame:CGRectMake(10, 0, btnW, btnH) title:title font:13 titleColor:[UIColor grayColor]];
        [_searchTypeBtn addTarget:self action:@selector(clickTypeBtn) forControlEvents:UIControlEventTouchUpInside];
        
        _searchTypeBtn.backgroundColor = [UIColor clearColor];
        
    }
    return _searchTypeBtn;
}

- (UIView *)optionView{
    if (_optionView == nil) {
        
        _optionView = [[UIView alloc] init];
        _optionView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    }
    return _optionView;
}

- (UIView *)optionBgView{
    if (_optionBgView == nil) {
        _optionBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _optionBgView.hidden = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOptionBgView)];
        tap.numberOfTapsRequired = 1;
        [_optionBgView addGestureRecognizer:tap];
    }
    return _optionBgView;
}

- (void)setOptionsArray:(NSArray *)optionsArray
{
    _optionsArray = optionsArray;
    CGFloat statusBarHeight = 20;
    CGFloat optionY = self.frame.size.height + statusBarHeight + OptionViewLeftMargin;
    CGFloat optionW = OptionViewWidth;
    CGFloat optionH = optionsArray.count * OptionSubViewHeight + (optionsArray.count - 1) * OptionSubViewMargin;
    _optionView.frame = CGRectMake(OptionViewLeftMargin, optionY, optionW, optionH);
    
    //子选项
    for (int i = 0; i < optionsArray.count; i++) {
        CGFloat optionBtnY = (OptionSubViewHeight + OptionSubViewMargin) * i;
        UIButton *optionBtn = [UIButton setButtonAttributeWithFrame:CGRectMake(0, optionBtnY, OptionViewWidth, OptionSubViewHeight) title:optionsArray[i] font:13 titleColor:[UIColor whiteColor]];
        [optionBtn addTarget:self action:@selector(clickOptionSubBtn:) forControlEvents:UIControlEventTouchUpInside];
        optionBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2];
        [_optionView addSubview:optionBtn];
    }
}

@end
