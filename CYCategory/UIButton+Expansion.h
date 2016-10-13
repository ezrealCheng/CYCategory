//
//  UIButton+Expansion.h
//  CYCategory
//
//  Created by 程宜 on 2016/10/13.
//  Copyright © 2016年 ChengYi. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIButton (Expansion)

@property (nonatomic, assign) CGFloat enlargeEdge;
/**
 *  设置扩充边界
 *
 */
- (void)setEnlargeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right;

@end
