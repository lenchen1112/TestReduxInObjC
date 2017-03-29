//
//  ReduxAction.h
//  ReduxInObjC
//
//  Created by Len Chen on 2017/3/29.
//  Copyright © 2017年 Len Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ReduxActionType) {
    ReduxActionTypeIncrement,
    ReduxActionTypeDecrement,
    ReduxActionTypeReset,
    ReduxActionTypeCount
};

@interface ReduxAction : NSObject

@property (nonatomic, assign, readonly) ReduxActionType type;
@property (nonatomic, strong, readonly, nullable) id payload;

- (_Nullable instancetype)initWithActionType:(ReduxActionType)type payload:(nullable id)payload;

@end
