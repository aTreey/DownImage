//
//  DownOperation.h
//  DowneImage
//
//  Created by Hongpeng Yu on 2017/2/12.
//  Copyright © 2017年 Hongpeng Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+urlPath.h"

typedef void(^finishBlock)(UIImage *image);

@interface DownOperation : NSOperation

+ (instancetype)downImageWithurlPath:(NSString *)urlPath finishBlcok:(finishBlock)finishBlock;
@end
