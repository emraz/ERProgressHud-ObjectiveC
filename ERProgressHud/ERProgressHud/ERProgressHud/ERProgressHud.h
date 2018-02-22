//
//  ERProgressHud.h
//  PhotoBlend
//
//  Created by Mahmudul Hasan on 5/29/17.
//  Copyright © 2017 Mahmudul Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ERProgressHud : NSObject {
    UIView *container;
    UIView *subContainer;
    UILabel *textLabel;
    UIActivityIndicatorView * activityIndicatorView;
    UIVisualEffectView *blurEffectView;
}

+ (ERProgressHud *)sharedInstance;
- (void)show;
- (void)showWithBlurView;
- (void)hide;
- (void)showWithTitle:(NSString *)title;
- (void)showDarkBackgroundViewWithTitle:(NSString *)title;
- (void)showBlurViewWithTitle:(NSString *)title;

@end
