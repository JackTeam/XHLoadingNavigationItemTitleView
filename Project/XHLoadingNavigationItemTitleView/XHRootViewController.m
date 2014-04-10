//
//  XHRootViewController.m
//  XHNavigationItemLadingTitleView
//
//  Created by qtone-1 on 14-4-10.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHRootViewController.h"

@interface XHRootViewController ()

@end

@implementation XHRootViewController

- (void)loadDataSource {
    [self startAnimationTitle];
    [self performSelector:@selector(doneLoadDataSource) withObject:nil afterDelay:2];
}

- (void)doneLoadDataSource {
    [self stopAnimationTitle];
    [self performSelector:@selector(loadDataSource) withObject:nil afterDelay:1];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self loadDataSource];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Demo Title";
    
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
