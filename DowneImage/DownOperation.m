//
//  DownOperation.m
//  DowneImage
//
//  Created by Hongpeng Yu on 2017/2/12.
//  Copyright © 2017年 Hongpeng Yu. All rights reserved.
//

#import "DownOperation.h"


@interface DownOperation ()
@property (nonatomic, copy) NSString *urlStr;
@property (nonatomic, copy) finishBlock finishBlock;
@end

@implementation DownOperation

- (void)main {
    @autoreleasepool {
        NSURL *url = [NSURL URLWithString:_urlStr];
        NSData *data = [NSData dataWithContentsOfURL:url];
        sleep(5);
        
        // 下载完成缓存到本地
#warning 缓存到本地, 只能缓存 property列表里的对象（包括 NSData, NSDate, NSNumber, NSString, NSArray, or NSDictionary）,图片需要转化为二进制
        
        /**
         * path: 写入文件的路径
         * useAuxiliaryFile: YES 为非原子写入,会有一个临时文件，NO
         */
        
        [data writeToFile:[_urlStr urlPath] atomically:YES];
        
        UIImage *image = [UIImage imageWithData:data];
        
        if (_finishBlock) {
            _finishBlock(image);
        }
    }
}


+ (instancetype)downImageWithurlPath:(NSString *)urlPath finishBlcok:(finishBlock)finishBlock {
    DownOperation *operation = [[DownOperation alloc] init];
    operation.urlStr = urlPath;
    operation.finishBlock = finishBlock;
    return operation;
}

@end
