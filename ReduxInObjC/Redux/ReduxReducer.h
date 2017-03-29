//
//  ReduxReducer.h
//  ReduxInObjC
//
//  Created by Len Chen on 2017/3/29.
//  Copyright © 2017年 Len Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReduxAction.h"
#import "ReduxState.h"

typedef ReduxState* (^ReduxReducerBlock)(ReduxState *, ReduxAction *);

@interface ReduxReducer : NSObject

+(NSArray *)avaliableReducerBlocks;

@end
