//
//  JXDeviceViewController.h
//  WECodeScanner
//
//  Created by freshlhy on 3/5/14.
//  Copyright (c) 2014 Werner IT Consultancy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Device;

@interface JXDeviceViewController : UITableViewController

@property (weak, nonatomic) Device *device;

- (IBAction)scanner;

@end
