//
//  ViewController.m
//  LTSharedViewTransition
//
//  Created by Yu Cong on 14-9-5.
//  Copyright (c) 2014年 ltebean. All rights reserved.
//

#import "FirstViewController.h"
#import "LTSharedViewTransition.h"

@interface FirstViewController ()<LTSharedViewTransitionDataSource,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *smallView;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationController.delegate = self;

}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    return [[LTSharedViewTransition alloc] init];

}

-(UIView*) sharedView
{
    return self.smallView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
