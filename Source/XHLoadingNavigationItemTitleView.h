//
//  XHLoadingNavigationItemTitleView.h
//  XHLoadingNavigationItemTitleView
//
//  Created by qtone-1 on 14-4-10.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHLoadingNavigationItemTitleView : UIView

@property (nonatomic, strong) UIColor *titleColor; // default is [UIColor whiteColor]
@property (nonatomic, strong) UIFont *titleFont; // default is


@property (nonatomic, assign, readonly) BOOL animating; // default is NO

+ (XHLoadingNavigationItemTitleView *)initNavigationItemTitleView;

- (void)setIndicatorView:(UIView *)indicatorView;

- (void)setTitle:(NSString *)title;

- (void)startAnimating;
- (void)stopAnimating;

@end
