//
//  AppViewController.m
//  ReduxInObjC
//
//  Created by Len Chen on 2017/3/29.
//  Copyright © 2017年 Len Chen. All rights reserved.
//

#import "AppViewController.h"
#import "ReduxAction.h"
#import "ReduxStore.h"
#include <stdlib.h>

#define KVOReduxStoreStatePath @"state"

@interface AppViewController ()

@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIButton *incrementButton;
@property (weak, nonatomic) IBOutlet UIButton *decrementButton;

@end

@implementation AppViewController

- (void)viewDidLoad
{
    [[ReduxStore sharedStore] addObserver:self forKeyPath:KVOReduxStoreStatePath options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

- (void)dealloc
{
    [[ReduxStore sharedStore] removeObserver:self forKeyPath:KVOReduxStoreStatePath];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:KVOReduxStoreStatePath]) {
        ReduxState *state = [change objectForKey:@"new"];
        self.countLabel.text = [NSString stringWithFormat:@"%ld", (long)(state.count)];
    }
}

- (IBAction)didTapOnIncrementButton:(UIButton *)sender {
    [[ReduxStore sharedStore] dispatchAction:[[ReduxAction alloc] initWithActionType:ReduxActionTypeIncrement payload:nil]];
}

- (IBAction)didTapOnDecrementButton:(UIButton *)sender {
    [[ReduxStore sharedStore] dispatchAction:[[ReduxAction alloc] initWithActionType:ReduxActionTypeDecrement payload:nil]];
}

- (IBAction)didTapOnRandomAssignButton:(UIButton *)sender {
    [[ReduxStore sharedStore] dispatchAction:[[ReduxAction alloc] initWithActionType:ReduxActionTypeRandomAssignBelowTen payload:@(arc4random_uniform(10))]];
}

@end
