//
//  Device.h
//  WECodeScanner
//
//  Created by freshlhy on 3/5/14.
//  Copyright (c) 2014 Werner IT Consultancy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DeviceDetails;

@interface Device : NSManagedObject

@property (nonatomic, retain) NSString * code;
@property (nonatomic, retain) DeviceDetails *deviceDetails;

@end
