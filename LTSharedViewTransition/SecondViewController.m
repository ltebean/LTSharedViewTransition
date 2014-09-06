//
//  SecondViewController.m
//  LTSharedViewTransition
//
//  Created by Yu Cong on 14-9-5.
//  Copyright (c) 2014年 ltebean. All rights reserved.
//

#import "SecondViewController.h"
#import "LTSharedViewTransition.h"

@interface SecondViewController ()<LTSharedViewTransitionDataSource>
@property (weak, nonatomic) IBOutlet UIView *bigView;

@property (weak, nonatomic) IBOutlet UIView *row1;
@property (weak, nonatomic) IBOutlet UIView *row2;
@property (weak, nonatomic) IBOutlet UIView *row3;
@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(UIView*) sharedView
{
    return self.bigView;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self animateViews:@[self.row1,self.row2,self.row3]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) animateViews:(NSArray *) views
{
    CGFloat diff = .05;
    CGFloat height = self.view.bounds.size.height;

    for (NSUInteger i = 0; i < [views count]; i++) {
        UIView *view = [views objectAtIndex:i];
        view.transform = CGAffineTransformMakeTranslation(0, height);
        [UIView animateWithDuration:1.2 delay:diff*i usingSpringWithDamping:0.83
              initialSpringVelocity:0 options:0 animations:^{
                  view.transform = CGAffineTransformMakeTranslation(0, 0);
              } completion:NULL];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
