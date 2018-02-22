//
//  ERProgressHud.m
//  PhotoBlend
//
//  Created by Mahmudul Hasan on 5/29/17.
//  Copyright © 2017 Mahmudul Hasan. All rights reserved.
//

#import "ERProgressHud.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SIZE_CONSTANT 375.0
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation ERProgressHud

+ (ERProgressHud *)sharedInstance {
    static ERProgressHud *sharedMyInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyInstance = [[self alloc] init];
    });
    return sharedMyInstance;
}

- (id)init {
    if (self = [super init]) {
        
        //Main Container
        container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        container.backgroundColor = [UIColor clearColor];
        
        //Sub Container
        subContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/3.0, SCREEN_WIDTH/4.0)];
        subContainer.layer.cornerRadius = 5.0;
        subContainer.layer.masksToBounds = YES;
        subContainer.backgroundColor = [UIColor clearColor];
        
       //Activity Indicator
        activityIndicatorView = [[UIActivityIndicatorView alloc] init];
        activityIndicatorView.hidesWhenStopped = YES;
        //[subContainer addSubview:activityIndicatorView];
        
        //Text Label
        textLabel = [[UILabel alloc] init];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.numberOfLines = 0;
        textLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightMedium];
        textLabel.textColor = [UIColor darkGrayColor];
        
        //Blur Effect
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        //always fill the view
        blurEffectView.frame = container.bounds;
        blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return self;
}

- (void)show {
    
    container.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.85f];
    activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    activityIndicatorView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    activityIndicatorView.color = [UIColor whiteColor];
    
    [activityIndicatorView startAnimating];
    [container addSubview:activityIndicatorView];
    [[UIApplication sharedApplication].keyWindow addSubview:container];
    container.alpha = 0.0;
    [UIView animateWithDuration:0.5 animations:^{
        container.alpha = 1.0;
    }];
}

- (void)showWithBlurView {
    
    //only apply the blur if the user hasn't disabled transparency effects
    if (!UIAccessibilityIsReduceTransparencyEnabled()) {
        container.backgroundColor = [UIColor clearColor];
        [container addSubview:blurEffectView];
    } else {
        container.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.85f];
    }
    
    activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    activityIndicatorView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    
    [activityIndicatorView startAnimating];
    [container addSubview:activityIndicatorView];
    [[UIApplication sharedApplication].keyWindow addSubview:container];
    container.alpha = 0.0;
    [UIView animateWithDuration:0.5 animations:^{
        container.alpha = 1.0;
    }];
}

- (void)hide {
    
    [UIView animateWithDuration:0.5 animations:^{
        container.alpha = 0.0;
    } completion:^(BOOL finished) {
        [activityIndicatorView stopAnimating];
        
        [activityIndicatorView removeFromSuperview];
        [textLabel removeFromSuperview];
        [subContainer removeFromSuperview];
        [blurEffectView removeFromSuperview];
        [container removeFromSuperview];
    }];
}

- (void)showWithTitle:(NSString *)title {
    
    container.backgroundColor = [UIColor clearColor];
    
    subContainer.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [subContainer setCenter:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)];
    [container addSubview:subContainer];
    
    activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [activityIndicatorView setFrame:CGRectMake(0, 10, CGRectGetWidth(subContainer.bounds), CGRectGetHeight(subContainer.bounds)/3.0)];
    activityIndicatorView.center = CGPointMake(activityIndicatorView.center.x, activityIndicatorView.center.y);
    [subContainer addSubview:activityIndicatorView];
    
    CGFloat height = CGRectGetHeight(subContainer.bounds) - CGRectGetHeight(activityIndicatorView.bounds) - 10.0;
    textLabel.frame = CGRectMake(5, 10 + CGRectGetHeight(activityIndicatorView.bounds), CGRectGetWidth(subContainer.bounds) - 10.0, height - 5.0);
    textLabel.text = title;
    [subContainer addSubview:textLabel];
    
    [activityIndicatorView startAnimating];
    [[UIApplication sharedApplication].keyWindow addSubview:container];
    container.alpha = 0.0;
    [UIView animateWithDuration:0.5 animations:^{
        container.alpha = 1.0;
    }];
}


- (void)showDarkBackgroundViewWithTitle:(NSString *)title {
    
    container.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.85f];
    
    subContainer.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [subContainer setCenter:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)];
    [container addSubview:subContainer];
    
    activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [activityIndicatorView setFrame:CGRectMake(0, 10, CGRectGetWidth(subContainer.bounds), CGRectGetHeight(subContainer.bounds)/3.0)];
    activityIndicatorView.center = CGPointMake(activityIndicatorView.center.x, activityIndicatorView.center.y);
    [subContainer addSubview:activityIndicatorView];
    
    CGFloat height = CGRectGetHeight(subContainer.bounds) - CGRectGetHeight(activityIndicatorView.bounds) - 10.0;
    textLabel.frame = CGRectMake(5, 10 + CGRectGetHeight(activityIndicatorView.bounds), CGRectGetWidth(subContainer.bounds) - 10.0, height - 5.0);
    textLabel.text = title;
    [subContainer addSubview:textLabel];
    
    [activityIndicatorView startAnimating];
    [[UIApplication sharedApplication].keyWindow addSubview:container];
    container.alpha = 0.0;
    [UIView animateWithDuration:0.5 animations:^{
        container.alpha = 1.0;
    }];
}

- (void)showBlurViewWithTitle:(NSString *)title {
    
    //only apply the blur if the user hasn't disabled transparency effects
    if (!UIAccessibilityIsReduceTransparencyEnabled()) {
        container.backgroundColor = [UIColor clearColor];
        [container addSubview:blurEffectView];
    } else {
        container.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.85f];
    }
    
    subContainer.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [subContainer setCenter:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)];
    [container addSubview:subContainer];
    
    activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [activityIndicatorView setFrame:CGRectMake(0, 10, CGRectGetWidth(subContainer.bounds), CGRectGetHeight(subContainer.bounds)/3.0)];
    activityIndicatorView.center = CGPointMake(activityIndicatorView.center.x, activityIndicatorView.center.y);
    [subContainer addSubview:activityIndicatorView];
    
    CGFloat height = CGRectGetHeight(subContainer.bounds) - CGRectGetHeight(activityIndicatorView.bounds) - 10.0;
    textLabel.frame = CGRectMake(5, 10 + CGRectGetHeight(activityIndicatorView.bounds), CGRectGetWidth(subContainer.bounds) - 10.0, height - 5.0);
    textLabel.text = title;
    [subContainer addSubview:textLabel];
    
    [activityIndicatorView startAnimating];
    [[UIApplication sharedApplication].keyWindow addSubview:container];
    container.alpha = 0.0;
    [UIView animateWithDuration:0.5 animations:^{
        container.alpha = 1.0;
    }];
}


@end
