//
//  AppDelegate.m
//  QuickActionSample
//
//  Created by minjoonkim on 2015. 12. 3..
//  Copyright © 2015년 minjoongkim. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //icon https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIApplicationShortcutIcon_Class/index.html#//apple_ref/c/tdef/UIApplicationShortcutIconType

    //shortcutitem add
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"com.action2" localizedTitle:@"Action2" localizedSubtitle:@"title2" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove] userInfo:nil];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"com.action3" localizedTitle:@"Action3" localizedSubtitle:@"title3" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCloud] userInfo:nil];
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc] initWithType:@"com.action4" localizedTitle:@"Action4" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeTask] userInfo:nil];
    
    [[UIApplication sharedApplication] setShortcutItems: @[ item1, item2, item3 ]];
    
    return YES;
}

//shortcutitem start delegate
- (void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler {
    NSLog(@"%@", [shortcutItem description]);
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
