//
//  STBUIUtil.h
//   
//
//  Created by liu on 16/4/13.
//  Copyright © 2016年  All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface STBUIUtil : NSObject
/*!
 *  @brief  UICOLOR 转 uiimage
 *
 *  @param color
 *
 *  @return image
 */
+ (UIImage *) imageByColor: (UIColor *) color;

/*!
 *  @brief  NSBundle 方式读取图片文件，imagename容易造成内存无法释放
 *
 *  @param name 图片名
 *  @param type 扩展名 png jpg ...
 *
 *  @return UIImage
 */
+ (UIImage *)imageByName:(NSString *)name type:(NSString *)type;
/*!
 *  @brief 图片转为base64 nsstring
 *
 *  @param image
 *
 *  @return base64 nsstring
 */
+ (NSString *)imageToBase64:(UIImage *) image;
/*!
 *  @brief 图片转为base64 nsstring 转图片
 *
 *  @param _encodedImageStr
 *
 *  @return
 */
+ (UIImage *)Base64ToImage:(NSString *)_encodedImageStr;
@end
