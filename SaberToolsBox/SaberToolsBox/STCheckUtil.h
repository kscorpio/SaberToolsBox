//
//  STCheckUtil.h
//
//  Created by KSCORPIO on 16/4/15.
//

#import <Foundation/Foundation.h>

@interface STCheckUtil : NSObject
/*!
 *  @author KSCORPIO, 16-04-15
 *
 *  @brief 判断字符串是否为空字符串
 *
 *  @param str
 *
 *  @return bool
 */
+ (BOOL)isEmptyd:(nonnull NSString*)str;

/*!
 *  @author KSCORPIO, 16-04-25
 *
 *  @brief 检查 dict 值 如果为 null等异常字符 转换为@“”
 *
 *  @param dict
 *
 *  @return
 */
+ (NSDictionary*)checkDictNull:(NSDictionary*)dict;
/*!
 *  @author KSCORPIO, 16-04-25
 *
 *  @brief 检查 dict 值 如果为 null等异常字符 转换为@“”
 *
 *  @param dict
 *
 *  @return
 */
+ (NSMutableArray*)checkArrayNull:(NSArray*)arr;
/*!
 *  @author KSCORPIO, 16-04-26
 *
 *  @brief 将NSArray 中的Null类型的项目转化成@""
 *
 *  @param myArr
 *
 *  @return
 */
+ (NSArray*)nullArr:(NSArray*)myArr;
/*!
 *  @author KSCORPIO, 16-04-26
 *
 *  @brief 将NSDictionary中的Null类型的项目转化成@""
 *
 *  @param myDic
 *
 *  @return
 */
+ (NSDictionary*)nullDic:(NSDictionary*)myDic;
@end
