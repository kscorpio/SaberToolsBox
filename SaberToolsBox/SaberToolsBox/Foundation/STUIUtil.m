//
//  STUIUtil.m
//
//
//  Created by kscorpio on 16/4/13.
//  Copyright © 2016年   All rights reserved.
//
//  ________________________________
// / The pursuit of the ultimate.   \
// \ Craftsman Sprit.               /
//  --------------------------------
//    \
//  ___###
//    /oo\ |||
//    \  / \|/
//    /""\  I
// ()|    |(I)
//    \  /  I
//   /""""\ I
//  |      |I
//  |      |I
//   \____/ I
//
//  Log:
//   1. 2017-10-12 合并UImage & UIColor 工具类为 catagory实现
//
//
//
//
#import "STUIUtil.h"

@implementation   UIImage (STUIUtil)
/*!
 *  @brief  UICOLOR 转 uiimage
 *
 *  @param color
 *
 *  @return image
 */
+ (UIImage*)imageByColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage* theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
/*!
 *  @brief  NSBundle 方式读取图片文件，imagename容易造成内存无法释放
 *
 *  @param name 图片名
 *  @param type 扩展名 png jpg ...
 *
 *  @return UIImage
 */
+ (UIImage*)imageWithBundleName:(NSString*)name type:(NSString*)type
{
    NSString* p = [[NSBundle mainBundle] pathForResource:name ofType:type];
    UIImage* image = [UIImage imageWithContentsOfFile:p];
    return image;
}
/*!
 *  @brief 图片转为base64 nsstring
 *
 *  @param image
 *
 *  @return base64 nsstring
 */
+ (NSString*)imageToBase64:(UIImage*)image
{
    if (image == nil) {
        return nil;
    }
    NSData* data = UIImageJPEGRepresentation(image, 1.0f);
    NSString* encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}
/*!
 *  @brief 图片转为base64 nsstring 转图片
 *
 *  @param _encodedImageStr
 *
 *  @return
 */
+ (UIImage*)Base64ToImage:(NSString*)_encodedImageStr
{
    if (_encodedImageStr == nil) {
        return nil;
    }
    NSData* _decodedImageData = [[NSData alloc] initWithBase64EncodedString:_encodedImageStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage* _decodedImage = [UIImage imageWithData:_decodedImageData];
    return _decodedImage;
}


@end

@implementation UIColor (STUIUtil)

+ (UIColor *)hexColor:(NSInteger)hexValue{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0];
}
+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha{
    return [UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:alpha];
}
@end
