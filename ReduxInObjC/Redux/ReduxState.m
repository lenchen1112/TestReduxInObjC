//
//  ReduxState.m
//  ReduxInObjC
//
//  Created by Len Chen on 2017/3/29.
//  Copyright © 2017年 Len Chen. All rights reserved.
//

#import "ReduxState.h"

@implementation ReduxState

- (instancetype)init
{
    self = [super init];
    if (self) {
        _count = 0;
    }
    return self;
}

- (id)copyWithZone:(nullable NSZone *)zone
{
    id copy = [[[self class] alloc] init];

    if (copy) {
        [copy setCount:self.count];
    }

    return copy;
}

@end
