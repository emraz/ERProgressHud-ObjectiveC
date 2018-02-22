//
//  ViewController.m
//  ERProgressHud
//
//  Created by Mahmudul Hasan R@zib on 2/23/18.
//  Copyright © 2018 Matrix Solution Ltd. All rights reserved.
//

#import "ViewController.h"
#import "ERProgressHud.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showProgressHudWithDarkBGNoTitle:(id)sender {
    [[ERProgressHud sharedInstance] show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[ERProgressHud sharedInstance] hide];
    });
}

- (IBAction)showProgressHudWithBlurBGNoTitle:(id)sender {
    [[ERProgressHud sharedInstance] showWithBlurView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[ERProgressHud sharedInstance] hide];
    });
}

- (IBAction)showProgressHudWithTitleNoBG:(id)sender {
    
    [[ERProgressHud sharedInstance] showWithTitle:@"Loading..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[ERProgressHud sharedInstance] hide];
    });
}

- (IBAction)showProgressHudWithTitleandBlurBG:(id)sender {
    
    [[ERProgressHud sharedInstance] showBlurViewWithTitle:@"Loading..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[ERProgressHud sharedInstance] hide];
    });
}
- (IBAction)showProgressHudWithTitleandDarkBG:(id)sender {
    
    [[ERProgressHud sharedInstance] showDarkBackgroundViewWithTitle:@"Loading..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[ERProgressHud sharedInstance] hide];
    });
}

@end
