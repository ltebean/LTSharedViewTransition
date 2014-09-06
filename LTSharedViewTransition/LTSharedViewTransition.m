//
//  LTSharedViewTransition.m
//  LTSharedViewTransition
//
//  Created by Yu Cong on 14-9-5.
//  Copyright (c) 2014年 ltebean. All rights reserved.
//

#import "LTSharedViewTransition.h"

@implementation LTSharedViewTransition
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    
    UIView* sourceView=[(id<LTSharedViewTransitionDataSource>)fromViewController sharedView];
    UIView* desticationView=[(id<LTSharedViewTransitionDataSource>)toViewController sharedView];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    UIView *snapshotView = [sourceView snapshotViewAfterScreenUpdates:NO];
    snapshotView.frame = [containerView convertRect:sourceView.frame fromView:sourceView.superview];

    sourceView.hidden=YES;
    desticationView.hidden = YES;
    
    toViewController.view.alpha =0;
    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:snapshotView];
    
    [UIView animateWithDuration:duration animations:^{
        // Fade in the second view controller's view
        
        CGRect frame = [containerView convertRect:desticationView.frame fromView:desticationView.superview];
        snapshotView.frame = frame;
        toViewController.view.alpha =1;

    } completion:^(BOOL finished) {
        desticationView.hidden = NO;
        sourceView.hidden = NO;
        [snapshotView removeFromSuperview];
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}
@end
