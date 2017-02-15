
//
//  TestImageView.m
//  DowneImage
//
//  Created by Hongpeng Yu on 2017/2/15.
//  Copyright © 2017年 Hongpeng Yu. All rights reserved.
//

#import "TestImageView.h"
#import "DownLoadManager.h"

@interface TestImageView ()
@property (nonatomic, copy) NSString *oldurlPath;
@end

@implementation TestImageView

- (void)test_setDownLoadImageWithurlPath:(NSString *)urlPath placeholderImage:(UIImage *)placeholderImage {
    
    self.image = placeholderImage;
    
    // 判断当前下载的图片url是否最新
    if (![self.oldurlPath isEqualToString:urlPath]) {
        
        // 取消以前下载
        [[DownLoadManager sharedInstance] cancelDownLoadOperationWithurlPath:self.oldurlPath];
        NSLog(@"取消旧的下载%@",urlPath);
    }
    
    self.oldurlPath = urlPath;
    
    // 下载最新URL对应的图片
    [[DownLoadManager sharedInstance] downloadImageWithurlPath:urlPath finishBlock:^(UIImage *image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = image;
            NSLog(@"下载新的图片%@",urlPath);
        });
    }];
}

@end
