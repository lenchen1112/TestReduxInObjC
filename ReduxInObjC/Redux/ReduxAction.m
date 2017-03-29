//
//  ReduxAction.m
//  ReduxInObjC
//
//  Created by Len Chen on 2017/3/29.
//  Copyright © 2017年 Len Chen. All rights reserved.
//

#import "ReduxAction.h"

@interface ReduxAction ()

@property (nonatomic, assign, readwrite) ReduxActionType type;
@property (nonatomic, strong, readwrite, nullable) id payload;

@end

@implementation ReduxAction

- (_Nullable instancetype)initWithActionType:(ReduxActionType)type payload:(nullable id)payload
{
    self = [super init];
    if (self) {
        _type = type;
        _payload = payload;
    }
    return self;
}

@end
