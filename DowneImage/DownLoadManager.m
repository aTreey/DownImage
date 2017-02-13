//
//  DownLoadManager.m
//  DowneImage
//
//  Created by Hongpeng Yu on 2017/2/13.
//  Copyright © 2017年 Hongpeng Yu. All rights reserved.
//

#import "DownLoadManager.h"

@interface DownLoadManager ()
@property (nonatomic, strong) NSOperationQueue *downLoadQueue;
@property (nonatomic, strong) NSMutableDictionary *operationCache;
@end

@implementation DownLoadManager

+ (instancetype)sharedInstance {
    static DownLoadManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DownLoadManager alloc] init];
    });
    return instance;
}

- (void)downloadImageWithurlPath:(NSString *)urlPath finishBlock:(finishBlock)finishBlock {
    
    if (_operationCache[urlPath]) {
        NSLog(@"网络加载慢，正在下载中");
        return;
    }
    
    DownOperation *downloadOperation = [DownOperation downImageWithurlPath:urlPath finishBlcok:^(UIImage *image) {
        
        [_operationCache removeObjectForKey:urlPath];
        finishBlock(image);
    }];
    
    [self.downLoadQueue addOperation:downloadOperation];
    
    self.operationCache[urlPath] = downloadOperation;
}


#pragma mark -
#pragma mark lazy

- (NSOperationQueue *)downLoadQueue {
    if (!_downLoadQueue) _downLoadQueue = [[NSOperationQueue alloc] init];
    return _downLoadQueue;
}

- (NSMutableDictionary *)operationCache {
    if (!_operationCache) _operationCache = [[NSMutableDictionary alloc] init];
    return _operationCache;
}

@end
