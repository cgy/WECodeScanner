//
//  WEViewController.m
//  WECodeScanner
//
//  Created by Werner Altewischer on 10/11/13.
//  Copyright (c) 2013 Werner IT Consultancy. All rights reserved.
//

#import "WEViewController.h"
#import "WECodeScannerView.h"
#import "WESoundHelper.h"
#import "JXDeviceViewController.h"
#import "Device.h"
#import "DeviceDetails.h"

@interface WEViewController ()<WECodeScannerViewDelegate>

@property (nonatomic, strong) WECodeScannerView *codeScannerView;
@property (nonatomic, strong) UILabel *codeLabel;

@end

@implementation WEViewController

{
    Device *_scannedDevice;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"请将摄像头对准二维码";
    
    CGFloat labelHeight = 60.0f;
    
    self.codeScannerView = [[WECodeScannerView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - labelHeight)];
    
    self.codeLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, self.codeScannerView.frame.size.height, self.view.bounds.size.width - 10, labelHeight)];
    
    self.codeLabel.backgroundColor = [UIColor clearColor];
    self.codeLabel.textColor = [UIColor blackColor];
    self.codeLabel.font = [UIFont boldSystemFontOfSize:17.0];
    self.codeLabel.numberOfLines = 2;
    self.codeLabel.textAlignment = NSTextAlignmentCenter;
    self.codeLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
    self.codeScannerView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.codeScannerView.delegate = self;
    [self.view addSubview:self.codeScannerView];
    [self.view addSubview:self.codeLabel];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.codeScannerView stop];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.codeScannerView start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - WECodeScannerViewDelegate

- (void)scannerView:(WECodeScannerView *)scannerView didReadCode:(NSString*)code {
    NSLog(@"Scanned code: %@", code);
    _scannedDevice = [Device findFirstByAttribute:@"code" withValue:code];
    if (_scannedDevice != nil) {
        [self performSelector:@selector(beep) withObject:nil afterDelay:0.1];
        [self performSegueWithIdentifier:@"showDevice" sender:self];
    } else {
        self.codeLabel.text = @"无此设备记录！";
        [self performSelector:@selector(error) withObject:nil afterDelay:0.1];
    }
}

- (void)scannerViewDidStartScanning:(WECodeScannerView *)scannerView {
    self.codeLabel.text = @"扫描中...";
}

- (void)scannerViewDidStopScanning:(WECodeScannerView *)scannerView {
    
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDevice"]) {
        JXDeviceViewController *controller = (JXDeviceViewController *)segue.destinationViewController;

        controller.device = _scannedDevice;
	} else if ([segue.identifier isEqualToString:@""]) {
		
	}
}

#pragma mark - Private

- (void)beep {
    [WESoundHelper playSoundFromFile:@"BEEP.mp3" fromBundle:[NSBundle mainBundle] asAlert:YES];
}

- (void)error {
    [WESoundHelper playSoundFromFile:@"ERROR.mp3" fromBundle:[NSBundle mainBundle] asAlert:YES];
}

@end
