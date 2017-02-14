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
