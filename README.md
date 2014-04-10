![image](https://github.com/JackTeam/XHLoadingNavigationItemTitleView/raw/master/Screenshots/XHLoadingNavigationItemTitleView.gif)

===============================
XHLoadingNavigationItemTitleView is show title conver to method swizzling display loading HUD.


Easy to drop into your project.      

You can add this feature to your own project, `XHLoadingNavigationItemTitleView` is easy-to-use.      

## Requirements ##

XHLoadingNavigationItemTitleView requires Xcode 5, targeting either iOS 5.0 and above, ARC-enabled.      


## Profile

[CocosPods](http://cocosPods.org) is the recommended methods of installation XHLoadingNavigationItemTitleView, just add the following line to `Profile`:

```
pod 'XHLoadingNavigationItemTitleView', '~> 0.1.0'
```

## How to use ##
```objc

1. import "UIViewController+XHLoadingNavigationItemTitleView.h" to your Controller header        


2. set the Controller title in viewDidLoad method, like normal setter.       


3. you can call startAnimationTitle display loading HUD for loadDatasource.         


4. you can call stopAnimationTitle hide loading HUD for Done loadDataSource.         


Finally look the code:

- (void)loadDataSource {
    [self startAnimationTitle];
}

- (void)doneLoadDataSource {
    [self stopAnimationTitle];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self loadDataSource];
    [self performSelector:@selector(doneLoadDataSource) withObject:nil afterDelay:3];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Detail";
}


```

## Thanke you 
TYDotIndicatorView created by [itouch2](https://github.com/itouch2)

## Lincense ##

`XHLoadingNavigationItemTitleView` is available under the MIT license. See the LICENSE file for more info.
