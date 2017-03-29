//
//  ReduxReducer.m
//  ReduxInObjC
//
//  Created by Len Chen on 2017/3/29.
//  Copyright © 2017年 Len Chen. All rights reserved.
//

#import "ReduxReducer.h"

@implementation ReduxReducer

+ (NSArray *)avaliableReducerBlocks
{
    return @[[self countingReducer]];
}

+ (ReduxReducerBlock)countingReducer {
    ReduxReducerBlock block = ^ReduxState*(ReduxState *state, ReduxAction *action) {
        if (!state) {
            state = [[ReduxState alloc] init];
        }

        switch (action.type) {
            case ReduxActionTypeIncrement:
                return ({
                    ReduxState *newState = [state copy];
                    newState.count++;
                    newState;
                });

            case ReduxActionTypeDecrement:
                return ({
                    ReduxState *newState = [state copy];
                    newState.count--;
                    newState;
                });

            default:
                return state;
        }
    };
    return block;
}

@end
