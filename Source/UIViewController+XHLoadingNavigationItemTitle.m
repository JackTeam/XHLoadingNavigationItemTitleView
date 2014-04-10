//
//  UIViewController+XHLoadingNavigationItemTitle.m
//  XHNavigationItemLadingTitleView
//
//  Created by qtone-1 on 14-4-10.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "UIViewController+XHLoadingNavigationItemTitle.h"
#import <objc/runtime.h>

static NSString * const kXHloadingNavigationItemTitleViewKey = @"kXHloadingNavigationItemTitleViewKey";

@implementation UIViewController (XHLoadingNavigationItemTitle)


- (void)setLoadingNavigationItemTitleView:(XHLoadingNavigationItemTitleView *)loadingNavigationItemTitleView {
    objc_setAssociatedObject(self, &kXHloadingNavigationItemTitleViewKey, loadingNavigationItemTitleView, OBJC_ASSOCIATION_RETAIN);
}

- (XHLoadingNavigationItemTitleView *)loadingNavigationItemTitleView {
    return objc_getAssociatedObject(self, &kXHloadingNavigationItemTitleViewKey);
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(setTitle:);
        SEL swizzledSelector = @selector(setAnimatedTitle:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)startAnimationTitle {
    [self.loadingNavigationItemTitleView startAnimating];
}

- (void)stopAnimationTitle {
    [self.loadingNavigationItemTitleView stopAnimating];
}

- (void)setAnimatedTitle:(NSString *)title {
    [self setAnimatedTitle:title];
    XHLoadingNavigationItemTitleView *loadingNavigationItemTitleView = [XHLoadingNavigationItemTitleView initNavigationItemTitleView];
    [loadingNavigationItemTitleView setTitle:title];
    loadingNavigationItemTitleView.titleColor = [UIColor blackColor];
    self.navigationItem.titleView = loadingNavigationItemTitleView;
    
    self.loadingNavigationItemTitleView = loadingNavigationItemTitleView;
}

@end
