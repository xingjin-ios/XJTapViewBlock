//
//  UIView+TapBlock.h
//  XJMultiSelectDemo
//
//  Created by 邢进 on 2017/4/5.
//  Copyright © 2017年 邢进. All rights reserved.
//

#import <UIKit/UIKit.h>
//定义block
typedef void(^ViewTapBlock)(id sender);

@interface UIView (TapBlock)

@property (copy, nonatomic)ViewTapBlock tapBlock;

//点击View
- (void)tapView:(ViewTapBlock)block;

@end
