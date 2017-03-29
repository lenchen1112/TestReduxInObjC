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
    return @[[self countReducer], [self randomAssignReducer]];
}

+ (ReduxReducerBlock)countReducer {
    ReduxReducerBlock block = ^ReduxState*(ReduxState *state, ReduxAction *action) {
        if (!state) {
            state = [[ReduxState alloc] init];
        }

        switch (action.type) {
            case ReduxActionTypeIncrement:
                return ({
                    ReduxState *newState = [state copy];
                    newState.count++;
                    NSLog(@"ReduxActionTypeIncrement: %ld -> %ld", (long)state.count, (long)newState.count);
                    newState;
                });

            case ReduxActionTypeDecrement:
                return ({
                    ReduxState *newState = [state copy];
                    newState.count--;
                    NSLog(@"ReduxActionTypeDecrement: %ld -> %ld", (long)state.count, (long)newState.count);
                    newState;
                });

            default:
                return state;
        }
    };
    return block;
}

+ (ReduxReducerBlock)randomAssignReducer {
    ReduxReducerBlock block = ^ReduxState*(ReduxState *state, ReduxAction *action) {
        if (!state) {
            state = [[ReduxState alloc] init];
        }

        switch (action.type) {
            case ReduxActionTypeRandomAssignBelowTen:
                return ({
                    ReduxState *newState = [state copy];
                    newState.count = [action.payload integerValue];
                    NSLog(@"ReduxActionTypeRandomAssign: %ld -> %ld", (long)state.count, (long)newState.count);
                    newState;
                });

            default:
                return state;
        }
    };
    return block;
}

@end
