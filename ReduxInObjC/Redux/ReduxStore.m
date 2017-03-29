//
//  ReduxStore.m
//  ReduxInObjC
//
//  Created by Len Chen on 2017/3/30.
//  Copyright © 2017年 Len Chen. All rights reserved.
//

#import "ReduxStore.h"
#import "ReduxReducer.h"

@interface ReduxStore ()

@property (nonatomic, strong, readwrite) ReduxState *state;
@property (nonatomic, strong) NSArray <ReduxReducerBlock> *reducers;
@property (nonatomic, strong) dispatch_queue_t serialQueue;

@end

@implementation ReduxStore

+ (instancetype)sharedStore
{
    static ReduxStore *sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [[ReduxStore alloc] init];
    });

    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _serialQueue = dispatch_queue_create("Redux Store Action Queue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (ReduxState *)state
{
    if (!_state) {
        _state = [[ReduxState alloc] init];
    }
    return [_state copy];
}

- (NSArray <ReduxReducerBlock> *)reducers
{
    if (!_reducers) {
        _reducers = [ReduxReducer avaliableReducerBlocks];
    }
    return _reducers;
}

- (void)dispatchAction:(ReduxAction *)action
{
    dispatch_async(self.serialQueue, ^{
        for (ReduxReducerBlock block in self.reducers) {
            self.state = block(self.state, action);
        }
    });
}

@end
