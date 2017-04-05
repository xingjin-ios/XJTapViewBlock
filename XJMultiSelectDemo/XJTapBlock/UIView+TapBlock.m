//
//  UIView+TapBlock.m
//  XJMultiSelectDemo
//
//  Created by 邢进 on 2017/4/5.
//  Copyright © 2017年 邢进. All rights reserved.
//

#import "UIView+TapBlock.h"
#import <objc/runtime.h>

//属性key
static const char *keyBlock = "tapBlock";

@implementation UIView (TapBlock)
//category_runtime添加属性
- (ViewTapBlock)tapBlock {
    return objc_getAssociatedObject(self, keyBlock);
}
- (void)setTapBlock:(ViewTapBlock)tapBlock {
    objc_setAssociatedObject(self, keyBlock, tapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
//点击View
- (void)tapView:(ViewTapBlock)block {
    self.tapBlock = block;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callBackAction:)];
    [self addGestureRecognizer:tap];
}
//block
- (void)callBackAction:(UITapGestureRecognizer *)tap;
{
    if (self.tapBlock) {
        self.tapBlock(tap.view);
    }
}

@end
