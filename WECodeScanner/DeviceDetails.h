//
//  DeviceDetails.h
//  WECodeScanner
//
//  Created by freshlhy on 14-3-6.
//  Copyright (c) 2014年 Werner IT Consultancy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Device;

@interface DeviceDetails : NSManagedObject

@property (nonatomic, retain) NSString * brand;
@property (nonatomic, retain) NSString * classification;
@property (nonatomic, retain) NSString * consumingDepartment;
@property (nonatomic, retain) NSString * expire;
@property (nonatomic, retain) NSString * ip;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * maintainer;
@property (nonatomic, retain) NSString * maintainingDepartment;
@property (nonatomic, retain) NSString * manufacturer;
@property (nonatomic, retain) NSString * model;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * network;
@property (nonatomic, retain) NSString * series;
@property (nonatomic, retain) NSString * since;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * user;
@property (nonatomic, retain) Device *device;

@end
