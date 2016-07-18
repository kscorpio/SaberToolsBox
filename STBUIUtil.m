//
//  STBUIUtil.m
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
#import "STBUIUtil.h"

@implementation STBUIUtil
/*!
 *  @author kscorpio, 15-11-11
 *
 *  @brief  UICOLOR 转 uiimage
 *
 *  @param color
 *
 *  @return image
 */
+ (UIImage *) createImageWithColor: (UIColor *) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
/*!
 *  @author kscorpio, 16-04-26
 *
 *  @brief  NSBundle 方式读取图片文件，imagename容易造成内存无法释放
 *
 *  @param name 图片名
 *  @param type 扩展名 png jpg ...
 *
 *  @return UIImage
 */
+ (UIImage *)imageByName:(NSString *)name type:(NSString *)type{
    NSString *p = [[NSBundle mainBundle]pathForResource:name ofType:type];
    UIImage * image = [UIImage imageWithContentsOfFile:p];
    return image;
}
/*!
 *  @author kscorpio, 16-04-23
 *
 *  @brief 图片转为base64 nsstring
 *
 *  @param image
 *
 *  @return base64 nsstring
 */
+ (NSString *)UIImageToBase64Str:(UIImage *) image
{
    if (image==nil) {
        return nil;
    }
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}
/*!
 *  @author kscorpio, 16-04-23
 *
 *  @brief 图片转为base64 nsstring 转图片
 *
 *  @param _encodedImageStr
 *
 *  @return
 */
+ (UIImage *)Base64StrToUIImage:(NSString *)_encodedImageStr
{
    if (_encodedImageStr==nil) {
        return nil;
    }
    NSData *_decodedImageData   = [[NSData alloc] initWithBase64EncodedString:_encodedImageStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *_decodedImage      = [UIImage imageWithData:_decodedImageData];
    return _decodedImage;
}
@end
