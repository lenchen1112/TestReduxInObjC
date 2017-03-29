//
//  ReduxStore.h
//  ReduxInObjC
//
//  Created by Len Chen on 2017/3/30.
//  Copyright © 2017年 Len Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReduxAction.h"
#import "ReduxState.h"

@interface ReduxStore : NSObject

@property (nonatomic, strong, readonly) ReduxState *state;

+ (instancetype)sharedStore;
- (void)dispatchAction:(ReduxAction *)action;

@end
