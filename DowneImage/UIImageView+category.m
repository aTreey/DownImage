//
//  UIImageView+category.m
//  DowneImage
//
//  Created by Hongpeng Yu on 2017/2/16.
//  Copyright © 2017年 Hongpeng Yu. All rights reserved.
//

#import "UIImageView+category.h"
#import "DownLoadManager.h"
#import <objc/runtime.h>

// 使用常量字符
static const char *key = "oldurlPath";

@implementation UIImageView (category)

- (void)test_setDownLoadImageWithurlPath:(NSString *)urlPath placeholderImage:(UIImage *)placeholderImage {
    
    self.image = placeholderImage;
    
    if (![urlPath isEqualToString:self.oldurlPath]) {
        [[DownLoadManager sharedInstance] cancelDownLoadOperationWithurlPath:self.oldurlPath];
    }
    
    self.oldurlPath = urlPath;
    
    [[DownLoadManager sharedInstance] downloadImageWithurlPath:urlPath finishBlock:^(UIImage *image) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.image = image;
        }];
    }];
}

- (void)setOldurlPath:(NSString *)oldurlPath {
    
    // RunTime 关联
    objc_setAssociatedObject(self, key, oldurlPath, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)oldurlPath {
    return objc_getAssociatedObject(self, key);
}
@end
