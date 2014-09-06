# ![LTSharedViewTransition](https://raw.githubusercontent.com/ltebean/LTSharedViewTransition/master/demo.gif)

## Usage

In the source vc:
```objective-c
self.navigationController.delegate = self;

// then implemement this navigationController delegate method and return a LTSharedViewTransition instance
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    return [[LTSharedViewTransition alloc] init];

}
```

Then in both the source vc and destination vc, implement LTSharedViewTransitionDataSource protocal:

```objective-c
-(UIView*) sharedView
{
    // return the shared view
}
```