//
//  STGeneralUtil.h
//
//  Created by KSCORPIO on 2017/2/16.
//

#import <Foundation/Foundation.h>

@interface STGeneralUtil : NSObject

/*!
 *  @author KSCORPIO, 17-03-01
 *
 *  @brief  获取设备名称 e.g. iPhone 7
 *
 */
+ (NSString*)deviceName;

/*!
 *  @author KSCORPIO, 17-03-01
 *
 *  @brief 获取APP版本号 e.g. 1.2.7
 *
 */
+ (NSString*)appVersion;

/*!
 *  @author KSCORPIO, 17-03-01
 *
 *  @brief 获取编译build号
 *
 */
+ (NSString*)appBuild;

/*!
 *  @author KSCORPIO, 17-03-01
 *
 *  @brief 获取APP应用名称
 *
 */
+ (NSString*)appName;

/*!
 *  @author KSCORPIO, 17-03-01
 *
 *  @brief 获取设备系统版本 e.g. iOS 7
 *
 */
+ (NSString*)osVersion;

@end
