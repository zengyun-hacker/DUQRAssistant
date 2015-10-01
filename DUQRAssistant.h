//
//  DUQRAssistant.h
//  Pods
//
//  Created by Xiao Du on 15/9/30.
//
//

#import <Foundation/Foundation.h>

@interface DUQRAssistant : NSObject

+ (UIImage *)createQRImage:(NSString *)content withWidth:(CGFloat)width;
@end
