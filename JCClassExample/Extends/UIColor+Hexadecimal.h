//
//  UIColor+Hexadecimal.h
//  SHBracelet_iOS
//
//  Created by molin on 15/9/8.
//  Copyright (c) 2015年 zl. All rights reserved.
//

#import <UIKit/UIKit.h>

#define COLOR_FONT_1 @"#818181"

@interface UIColor (Hexadecimal)
/**
 *  根据十六进制的颜色转换RGB颜色
 *
 *  @param color 十六进制的颜色
 *
 *  @return RGB颜色
 */
+ (UIColor *)colorWithHexString: (NSString *)color;
@end
