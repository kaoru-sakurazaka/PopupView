//
//  AppDelegate.m
//  PopupView
//
//  Created by かおる on 2013/06/09.
//  Copyright (c) 2013年 かおる. All rights reserved.
//

#import "AppDelegate.h"
#import "TestViewController.h"

@implementation AppDelegate

- (void)dealloc{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{

    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.rootViewController = [[[TestViewController alloc] init] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
}


@end
