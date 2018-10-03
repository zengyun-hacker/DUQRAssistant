//
//  DUCoreQRViewController.h
//  Pods
//
//  Created by Xiao Du on 15/5/17.
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <ZYCoreFramework/ZYCoreViewController.h>

/**
 *  二维码扫码界面
 */
@interface DUCoreQRViewController : ZYCoreViewController <AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic) BOOL shouldRead;
@property (nonatomic) AVCaptureMetadataOutput *captureMetadataOutput;

- (void)scanFinish:(NSString *)result;

- (void)setObjectTypes:(NSArray *)types;

- (void)setOutputInterest:(CGRect)rect;

- (BOOL)startReading;

- (void)stopReading;

@end
