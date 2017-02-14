
//
//  NSString+urlPath.m
//  DowneImage
//
//  Created by Hongpeng Yu on 2017/2/15.
//  Copyright © 2017年 Hongpeng Yu. All rights reserved.
//

#import "NSString+urlPath.h"

@implementation NSString (urlPath)

- (NSString *)urlPath {
    
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSString *imageName = self.lastPathComponent;
    return [cachePath stringByAppendingPathComponent:imageName];
}


@end
