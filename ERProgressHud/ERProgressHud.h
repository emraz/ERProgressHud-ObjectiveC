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
    UIActivityIndicatorView * activityIndicatorView;
}

+ (ERProgressHud *)sharedInstance;
- (void)show;
- (void)hide;

@end
