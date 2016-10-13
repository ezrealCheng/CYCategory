//
//  UILabel+StringFrame.h
//  CYCategory
//
//  Created by 程宜 on 2016/10/13.
//  Copyright © 2016年 ChengYi. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UILabel (StringFrame)


/**
 *  @brief  动态获取label的size
 *
 *  @param size 传入label的原始size
 *
 *  @return 返回计算后的size结果
 */
- (CGSize)boundingRectWithSize:(CGSize)size;

@end
