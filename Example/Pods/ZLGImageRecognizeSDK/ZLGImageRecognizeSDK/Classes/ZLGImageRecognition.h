//
//  ZLGImageRecognition.h
//  ImageRecognitionDemo
//
//  Created by 张利果 on 2018/12/5.
//  Copyright © 2018年 张利果. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZLGImageRecognition : NSObject

/**
 * 单独传图片
 */
+ (void)imageRecognitionWithImage:(UIImage *)image successHandler:(void (^)(id result, UIImage *image))successHandler failHandler: (void (^)(NSError* err))failHandler;

/**
 * 使用相机相册选择图片
 */
+ (void)imageRecognitionViewController:(UIViewController *)controller successHandler:(void (^)(id result, UIImage *image))successHandler failHandler: (void (^)(NSError* err))failHandler;

/**
 * 使用Api Key, Secret Key授权
 */

+ (void)authWithAppKey: (NSString *)ak andSecretKey: (NSString *)sk;

@end
