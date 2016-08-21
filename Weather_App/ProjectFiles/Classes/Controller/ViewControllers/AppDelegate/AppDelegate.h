//
//  AppDelegate.h
//  Weather_App
//
//  Created by reliancegames on 8/1/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HomeViewController *viewController;
@property (strong, nonatomic) UINavigationController *rootNavigationController;
@property (assign, nonatomic) BOOL isMenuHidden;

@end

