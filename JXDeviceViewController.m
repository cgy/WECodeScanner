//
//  JXDeviceViewController.m
//  WECodeScanner
//
//  Created by freshlhy on 3/5/14.
//  Copyright (c) 2014 Werner IT Consultancy. All rights reserved.
//

#import "JXDeviceViewController.h"
#import "Device.h"
#import "DeviceDetails.h"

@interface JXDeviceViewController ()

@end

@implementation JXDeviceViewController

{
    NSMutableArray *_deviceAttributeValues;
    NSArray *_deviceAttributes;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.device.deviceDetails.name;
    
    _deviceAttributes = @[@"安全编号", @"设备名称", @"设备分类", @"设备类型", @"制造商",
                                  @"品牌", @"系列", @"型号", @"投运日期", @"售后到期时间", @"领用部门",
                                  @"领用人", @"运维部门", @"运维负责人", @"安装地点", @"ip地址", @"所属网络"];
    
    _deviceAttributeValues = [[NSMutableArray alloc] initWithCapacity:20];
    [_deviceAttributeValues addObject:self.device.code];
    [_deviceAttributeValues addObject:self.device.deviceDetails.name];
    [_deviceAttributeValues addObject:self.device.deviceDetails.classification];
    [_deviceAttributeValues addObject:self.device.deviceDetails.type];
    [_deviceAttributeValues addObject:self.device.deviceDetails.manufacturer];
    [_deviceAttributeValues addObject:self.device.deviceDetails.brand];
    [_deviceAttributeValues addObject:self.device.deviceDetails.series];
    [_deviceAttributeValues addObject:self.device.deviceDetails.model];
    [_deviceAttributeValues addObject:self.device.deviceDetails.since];
    [_deviceAttributeValues addObject:self.device.deviceDetails.expire];
    [_deviceAttributeValues addObject:self.device.deviceDetails.consumingDepartment];
    [_deviceAttributeValues addObject:self.device.deviceDetails.user];
    [_deviceAttributeValues addObject:self.device.deviceDetails.maintainingDepartment];
    [_deviceAttributeValues addObject:self.device.deviceDetails.maintainer];
    [_deviceAttributeValues addObject:self.device.deviceDetails.location];
    [_deviceAttributeValues addObject:self.device.deviceDetails.ip];
    [_deviceAttributeValues addObject:self.device.deviceDetails.network];
    
    NSLog(@"Attribute: %lu", (unsigned long)[_deviceAttributes count]);
    NSLog(@"AttributeValue: %lu", (unsigned long)[_deviceAttributeValues count]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 17;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Attribute"];
    
    UILabel *attribute = (UILabel *)[cell viewWithTag:1000];
    attribute.text = _deviceAttributes[indexPath.row];
    
    UILabel *value = (UILabel *)[cell viewWithTag:1001];
    value.text = _deviceAttributeValues[indexPath.row];
    
    
    return cell;
}

- (IBAction)scanner {
    [self performSegueWithIdentifier:@"scannerDevice" sender:nil];
    _deviceAttributes = nil;
    _deviceAttributeValues = nil;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
