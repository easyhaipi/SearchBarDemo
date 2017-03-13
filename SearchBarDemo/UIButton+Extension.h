//
//  UIButton+Extension.h
//  SearchBarDemo
//
//  Created by Tinora Li on 2017/3/9.
//  Copyright © 2017年 YPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)
//传入基本参数创建一个UIButton
+ (UIButton *)setButtonAttributeWithFrame:(CGRect)frame
                                    title:(NSString *)title
                                    font:(CGFloat)font
                               titleColor:(UIColor *)titleColor;
@end
