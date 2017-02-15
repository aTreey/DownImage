//
//  DownLoadManager.h
//  DowneImage
//
//  Created by Hongpeng Yu on 2017/2/13.
//  Copyright © 2017年 Hongpeng Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownOperation.h"

@interface DownLoadManager : NSObject

+ (instancetype)sharedInstance;

- (void)cancelDownLoadOperationWithurlPath:(NSString *)urlPath;

- (void)downloadImageWithurlPath:(NSString *)urlPath finishBlock:(finishBlock)finishBlock;

@end
