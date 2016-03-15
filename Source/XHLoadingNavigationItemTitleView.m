//
//  XHLoadingNavigationItemTitleView.m
//  XHLoadingNavigationItemTitleView
//
//  Created by qtone-1 on 14-4-10.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHLoadingNavigationItemTitleView.h"
#import "TYDotIndicatorView.h"

static const CGFloat titleLabelHeight = 30.0f;

@interface UIView (animated)
- (void)startAnimating;
- (void)stopAnimating;
@end;

@implementation UIView (animated)
- (void)startAnimating {
    //
}

- (void)stopAnimating {
    //
}

@end

@interface XHLoadingNavigationItemTitleView () {
    
}
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *titleIndicatorView;

@property (nonatomic, assign, readwrite) BOOL animating;


@end

@implementation XHLoadingNavigationItemTitleView

#pragma mark - Propertys

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMidY(self.bounds) - titleLabelHeight / 2.0, CGRectGetWidth(self.bounds), titleLabelHeight)];
        _titleLabel.textColor = self.titleColor;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = self.titleFont;
    }
    return _titleLabel;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.titleLabel.textColor = titleColor;
}

#pragma mark - Life cycle

+ (XHLoadingNavigationItemTitleView *)initNavigationItemTitleView {
    XHLoadingNavigationItemTitleView *loadingNavigationItemTitleView = [[XHLoadingNavigationItemTitleView alloc] initWithFrame:CGRectMake(0, 0, 160, 44)];
    [loadingNavigationItemTitleView setTitle:@"长长Long标题"];
    return loadingNavigationItemTitleView;
}

- (void)setup {
    self.titleColor = [UIColor whiteColor];
    self.titleFont = [UIFont boldSystemFontOfSize:17];
    
    self.animating = NO;
    
    [self addSubview:self.titleLabel];
    [self setIndicatorView:[self darkCircleDot]];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setIndicatorView:(UIView *)indicatorView {
    if (self.titleIndicatorView) {
        [self.titleIndicatorView stopAnimating];
        [self.titleIndicatorView removeFromSuperview];
    }
    self.titleIndicatorView = indicatorView;
    [self addSubview:self.titleIndicatorView];
}

- (TYDotIndicatorView *)darkCircleDot {
    TYDotIndicatorView *darkCircleDot = [[TYDotIndicatorView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds) - titleLabelHeight / 2.0, CGRectGetWidth(self.titleLabel.frame), CGRectGetHeight(self.bounds) - titleLabelHeight) dotStyle:TYDotIndicatorViewStyleCircle dotColor:[UIColor blackColor] dotSize:CGSizeMake(8, 8)];
    darkCircleDot.hidesWhenStopped = NO;
    darkCircleDot.backgroundColor = self.backgroundColor;
    darkCircleDot.layer.cornerRadius = 5.0f;
    return darkCircleDot;
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

- (void)startAnimating {
    // 置顶titleLabel
    if (self.animating)
        return;
    [self performSelector:@selector(stopAnimating) withObject:nil afterDelay:6];
    self.animating = YES;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        CGRect titleLabelFrame = self.titleLabel.frame;
        titleLabelFrame.origin = CGPointZero;
        self.titleLabel.frame = titleLabelFrame;
    } completion:^(BOOL finished) {
        [self.titleIndicatorView startAnimating];
    }];
}

- (void)stopAnimating {
    // 统一居中titleLabel
    if (!self.animating)
        return;
    self.animating = NO;
    [self.titleIndicatorView stopAnimating];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        CGPoint center = CGPointMake(self.titleLabel.center.x, CGRectGetHeight(self.bounds) / 2.0);
        self.titleLabel.center = center;
    } completion:NULL];
}

@end
