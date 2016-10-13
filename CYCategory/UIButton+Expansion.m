//
//  UIButton+Expansion.m
//  CYCategory
//
//  Created by 程宜 on 2016/10/13.
//  Copyright © 2016年 ChengYi. All rights reserved.
//

#import "UIButton+Expansion.h"
#import <objc/runtime.h>

@implementation UIButton (Expansion)
static char topEdgeKey;
static char leftEdgeKey;
static char bottomEdgeKey;
static char rightEdgeKey;
/**
 *  合成寻去方法
 *
 */
- (void)setEnlargeEdge:(CGFloat)enlargeEdge{
    [self setEnlargeWithTop:enlargeEdge left:enlargeEdge bottom:enlargeEdge right:enlargeEdge];
}

- (CGFloat)enlargeEdge{
    return [(NSNumber *)objc_getAssociatedObject(self, &topEdgeKey) floatValue];
}
/**
 *  设置扩充边界
 *
 */
- (void)setEnlargeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right{
    objc_setAssociatedObject(self, &topEdgeKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &leftEdgeKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &bottomEdgeKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &rightEdgeKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/**
 *  获得当前的响应rect
 *
 *  @return <#return value description#>
 */
- (CGRect)enlargedRect{
    NSNumber *topEdge = objc_getAssociatedObject(self, &topEdgeKey);
    NSNumber *leftEdge = objc_getAssociatedObject(self, &leftEdgeKey);
    NSNumber *rightEdge = objc_getAssociatedObject(self, &rightEdgeKey);
    NSNumber *bottomEdge = objc_getAssociatedObject(self, &bottomEdgeKey);
    if (topEdge && leftEdge && rightEdge && bottomEdge) {
        CGRect enlargedRect = CGRectMake(self.bounds.origin.x - leftEdge.floatValue, self.bounds.origin.y - topEdge.floatValue, self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue, self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
        return enlargedRect;
    }else{
        return self.bounds;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.alpha <= 0.01 || !self.userInteractionEnabled || self.hidden) {
        return nil;
    }
    CGRect enlargeRect = [self enlargedRect];
    return CGRectContainsPoint(enlargeRect, point) ? self : nil;
}

@end
