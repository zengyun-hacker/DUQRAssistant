//
//  DUQRAssistant.m
//  Pods
//
//  Created by Xiao Du on 15/9/30.
//
//

#import "DUQRAssistant.h"

@implementation DUQRAssistant

+ (UIImage *)createQRImage:(NSString *)content withWidth:(CGFloat)width {
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *QRData = [content dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:QRData forKey:@"inputMessage"];
    // create QR Image
    CIImage *CIQRImage = [filter outputImage];

    //scale image to target size
    CGRect extent = CGRectIntegral(CIQRImage.extent);
    CGFloat scale = MIN(width/CGRectGetWidth(extent),width/CGRectGetHeight(extent));
    size_t imageWidth = CGRectGetWidth(extent) * scale;
    size_t imageHeight = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, imageWidth, imageHeight, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:CIQRImage fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

@end
