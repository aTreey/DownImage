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

/**
 * 图片缓存,一对一
 */

@property (nonatomic, weak) NSMutableDictionary *imageCache;

/**
 * 操作缓存,防止来回滚动造成重复下载
 */
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
    
    // 判断缓存, 有内存缓存和沙盒缓存
    if ([self hasImageCache:urlPath]) {
        if (finishBlock) {
            finishBlock(self.imageCache[urlPath]);
        }
        return;
    }
    
    
    if (_operationCache[urlPath]) {
        NSLog(@"网络加载慢，正在下载中");
        return;
    }
    
    DownOperation *downloadOperation = [DownOperation downImageWithurlPath:urlPath finishBlcok:^(UIImage *image) {
        
        [_operationCache removeObjectForKey:urlPath];
        if (finishBlock) {
            finishBlock(image);
        }
    }];
    
    [self.downLoadQueue addOperation:downloadOperation];
    
    self.operationCache[urlPath] = downloadOperation;
}


#pragma mark -
#pragma mark 取消旧的下载

- (void)cancelDownLoadOperationWithurlPath:(NSString *)urlPath {
    
    // 从下载任务缓存中取出对应操作
    DownOperation *operaton = self.operationCache[urlPath];
#warning 需要判断是否第一次,如果是第一次不用取消,return
    if (operaton == nil) return;
    
    if (![operaton isCancelled]) {
        [operaton cancel];
        
//        [operaton cancel] 自杀，只是标记了一个死亡，并未真正的取消
#warning 需要在被取消的任务中时时判断是否取消(在程序的关键处), 如果取消,结束任务
        
        [self.operationCache removeObjectForKey:urlPath];
    }
}


#pragma mark -
#pragma mark cache

- (BOOL)hasImageCache:(NSString *)urlPath {
    
    // 内存缓存
    if (self.imageCache[urlPath]) {
        return YES;
    }
    
    // 沙盒缓存
    UIImage *image = [UIImage imageWithContentsOfFile:[urlPath urlPath]];
    if (image) {
        // 加入到内存中
        self.imageCache[urlPath] = image;
        return YES;
    }

    return NO;
}


#pragma mark -
#pragma mark lazy

- (NSOperationQueue *)downLoadQueue {
    if (!_downLoadQueue) _downLoadQueue = [[NSOperationQueue alloc] init];
    return _downLoadQueue;
}

- (NSMutableDictionary *)operationCache {
    if (!_operationCache) _operationCache = [NSMutableDictionary dictionary];
    return _operationCache;
}

- (NSMutableDictionary *)imageCache {
    if (!_imageCache) _imageCache = [NSMutableDictionary dictionary];
    return _imageCache;
}

@end
