//
//  LTSharedViewTransition.h
//  LTSharedViewTransition
//
//  Created by Yu Cong on 14-9-5.
//  Copyright (c) 2014年 ltebean. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LTSharedViewTransitionDataSource <NSObject>
-(UIView*)sharedView;
@end

@interface LTSharedViewTransition : NSObject<UIViewControllerAnimatedTransitioning>

@end
