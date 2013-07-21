//
//  AppDelegate.m
//  Encodeings
//
//  Created by wgdadmin on 13-7-17.
//  Copyright (c) 2013年 wgdadmin. All rights reserved.
//

#import "AppDelegate.h"
#import "MobClick.h"
#import "TextToHexViewController.h"
#import "HexToTextViewController.h"




@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
   // [MobClick startWithAppkey:@"51eb53c256240b22bf03488c"];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    TextToHexViewController *textToHexCtrl;
    if(DEVICE_IS_IPHONE5)
    {
     textToHexCtrl = [[TextToHexViewController alloc] initWithNibName:@"TextToHexViewController5" bundle:nil];
    }
    else
    {
     textToHexCtrl = [[TextToHexViewController alloc] initWithNibName:@"TextToHexViewController5" bundle:nil];    
    }

    
    UINavigationController *textToHexNav = [[UINavigationController alloc] initWithRootViewController:textToHexCtrl];
    textToHexNav.tabBarItem.title = NSLocalizedString(@"TextToHex", nil);
    [textToHexNav.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -15)];
    
    HexToTextViewController *hexToTextCtrl = [[HexToTextViewController alloc] init];
    UINavigationController *hexToTextNav = [[UINavigationController alloc] initWithRootViewController:hexToTextCtrl];
    [hexToTextNav.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -15)];
    hexToTextNav.tabBarItem.title = NSLocalizedString(@"HexToText", nil);
    
    
    
    
    self.tabBarController = [[UITabBarController alloc] init];
    
    self.tabBarController.viewControllers = @[textToHexNav,hexToTextNav];
    
    self.window.rootViewController = self.tabBarController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
