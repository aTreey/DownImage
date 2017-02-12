
//
//  Model.m
//  DowneImage
//
//  Created by Hongpeng Yu on 2017/2/12.
//  Copyright © 2017年 Hongpeng Yu. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)appInfosModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

+ (instancetype)appInfosWithDict:(NSDictionary *)dict {
    Model *obj = [[self alloc] init];
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}


+ (NSArray *)appInfos {
    
    NSMutableArray *tempArray = [NSMutableArray array];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"apps.plist" withExtension:nil];
    NSArray *dictArray = [NSArray arrayWithContentsOfURL:url];
    [dictArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        Model *model = [Model appInfosModelWithDict:dict];
        [tempArray addObject:model];
    }];
    return tempArray.copy;
}

@end
