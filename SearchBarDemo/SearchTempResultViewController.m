//
//  SearchTempResultViewController.m
//  SearchBarDemo
//
//  Created by Tinora Li on 2017/3/9.
//  Copyright © 2017年 YPT. All rights reserved.
//

#import "SearchTempResultViewController.h"
#import "PYSearchConst.h"


#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

@interface SearchTempResultViewController ()
{
    CAReplicatorLayer *_loveLayer;
}

@end

@implementation SearchTempResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"SearchResultViewController";
    self.view.backgroundColor =  [UIColor colorWithRed:(arc4random_uniform(256)/255.0) green:(arc4random_uniform(256)/255.0) blue:(arc4random_uniform(255)/255.0) alpha:1.0];
    
    [self loveReplicatorLayer];
}

- (void)loveReplicatorLayer
{
    
    // love路径
    UIBezierPath *lovePath = [UIBezierPath bezierPath];
    [lovePath moveToPoint:CGPointMake(SCREEN_WIDTH/2.0, 200)];
    [lovePath addQuadCurveToPoint:CGPointMake(SCREEN_WIDTH/2.0, 400) controlPoint:CGPointMake(SCREEN_WIDTH/2.0 + 200, 20)];
    [lovePath addQuadCurveToPoint:CGPointMake(SCREEN_WIDTH/2.0, 200) controlPoint:CGPointMake(SCREEN_WIDTH/2.0 - 200, 20)];
    [lovePath closePath];
    
    // 具体的layer
    UIView *tView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    tView.center = CGPointMake(SCREEN_WIDTH/2.0, 200);
    tView.layer.cornerRadius = 5;
    tView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    
    // 动作效果
    CAKeyframeAnimation *loveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    loveAnimation.path = lovePath.CGPath;
    loveAnimation.duration = 8;
    loveAnimation.repeatCount = INFINITY;
    [tView.layer addAnimation:loveAnimation forKey:@"loveAnimation"];
    
    _loveLayer = [CAReplicatorLayer layer];
    _loveLayer.instanceCount = 40;                // 40个layer
    _loveLayer.instanceDelay = 0.2;               // 每隔0.2出现一个layer
    _loveLayer.instanceColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor;
    _loveLayer.instanceGreenOffset = -0.03;       // 颜色值递减。
    _loveLayer.instanceRedOffset = -0.02;         // 颜色值递减。
    _loveLayer.instanceBlueOffset = -0.01;        // 颜色值递减。
    [_loveLayer addSublayer:tView.layer];
    [self.view.layer addSublayer:_loveLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
