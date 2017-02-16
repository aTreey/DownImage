//
//  UIImageView+category.h
//  DowneImage
//
//  Created by Hongpeng Yu on 2017/2/16.
//  Copyright © 2017年 Hongpeng Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (category)

/**
 给分类增加属性,重写了 setter 和 getter 方法，无法生成 "_成员变量", 需要使用RunTime关联后存值取值
 */


/**
 异步下载图片方法

 @param urlPath 图片的URL
 @param placeholderImage 所使用的占位图片
 */
- (void)test_setDownLoadImageWithurlPath:(NSString *)urlPath placeholderImage:(UIImage *)placeholderImage;

@end
