//
//  UIImage+Extension.h
//  SearchBarDemo
//
//  Created by Tinora Li on 2017/3/9.
//  Copyright © 2017年 YPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
//通过传入颜色值、宽度、高度创建一张图片
+ (UIImage *)imageWithColor:(UIColor *)color width:(CGFloat)width height:(CGFloat)height;
@end
