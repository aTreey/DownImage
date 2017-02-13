//
//  Model.h
//  DowneImage
//
//  Created by Hongpeng Yu on 2017/2/12.
//  Copyright © 2017年 Hongpeng Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *download;

+ (NSArray *)appInfos;
@end
