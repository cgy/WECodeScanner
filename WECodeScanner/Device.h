//
//  Device.h
//  WECodeScanner
//
//  Created by freshlhy on 14-3-6.
//  Copyright (c) 2014年 Werner IT Consultancy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DeviceDetails;

@interface Device : NSManagedObject

@property (nonatomic, retain) NSString * code;
@property (nonatomic, retain) DeviceDetails *deviceDetails;

@end

