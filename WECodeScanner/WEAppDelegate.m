//
//  WEAppDelegate.m
//  WECodeScanner
//
//  Created by Werner Altewischer on 10/11/13.
//  Copyright (c) 2013 Werner IT Consultancy. All rights reserved.
//

#import "WEAppDelegate.h"
#import "WESoundHelper.h"
#import "Device.h"
#import "DeviceDetails.h"

@implementation WEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"DeviceModel"];
    // Setup App with prefilled Beer items.
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"MR_HasPrefilledDevices"]) {
        // Create Blond Ale
        Device *d1 = [Device createEntity];
        d1.code  = @"181219709";
        d1.deviceDetails = [DeviceDetails createEntity];
        d1.deviceDetails.name = @"Windows台式机";
        d1.deviceDetails.classification = @"终端设备";
        d1.deviceDetails.type = @"台式机";
        d1.deviceDetails.manufacturer = @"联想";
        d1.deviceDetails.brand = @"LENOVO";
        d1.deviceDetails.series = @"联想";
        d1.deviceDetails.model = @"联想";
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *since = [dateFormatter dateFromString: @"2012-10-30"];
        d1.deviceDetails.since = since;
        NSDate *expire = [dateFormatter dateFromString:@"2015-10-07"];
        d1.deviceDetails.expire = expire;
        d1.deviceDetails.consumingDepartment = @"变电检修中心";
        d1.deviceDetails.user = @"刘湖钰";
        d1.deviceDetails.maintainingDepartment = @"变电检修中心";
        d1.deviceDetails.maintainer = @"万意";
        d1.deviceDetails.location = @"公司本部十一楼办公室";
        d1.deviceDetails.ip = @"10.234.247.115";
        d1.deviceDetails.network = @"内网";
        
        // Save Managed Object Context
        [[NSManagedObjectContext defaultContext] saveToPersistentStoreWithCompletion:nil];
        
        // Set User Default to prevent another preload of data on startup.
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"MR_HasPrefilledDevices"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
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

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    [WESoundHelper clearSoundCache];
}

@end
