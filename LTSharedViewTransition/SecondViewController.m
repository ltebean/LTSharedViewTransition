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
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
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
    return self.imageView;
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


@end
