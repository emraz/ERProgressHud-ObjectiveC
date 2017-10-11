//
//  ERProgressHud.m
//  PhotoBlend
//
//  Created by Mahmudul Hasan on 5/29/17.
//  Copyright © 2017 Mahmudul Hasan. All rights reserved.
//

#import "ERProgressHud.h"

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
        container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)];
        UIColor *color = [[UIColor blackColor] colorWithAlphaComponent:0.85f];
        container.backgroundColor = color;
        
        activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        activityIndicatorView.center = CGPointMake(UIScreen.mainScreen.bounds.size.width/2, UIScreen.mainScreen.bounds.size.height/2);
        activityIndicatorView.color = [UIColor whiteColor];
        activityIndicatorView.hidesWhenStopped = YES;
    }
    return self;
}

- (void)show {
    
    [activityIndicatorView startAnimating];
    [container addSubview:activityIndicatorView];
    [[UIApplication sharedApplication].keyWindow addSubview:container];
}

- (void)hide {
    [activityIndicatorView stopAnimating];
    [activityIndicatorView removeFromSuperview];
    [container removeFromSuperview];
}

@end
