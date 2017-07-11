//
//  CheckUtil.m
//  MaintenanceExpert
//
//  Created by KSCORPIO on 16/4/15.
//

#import "STCheckUtil.h"

@implementation STCheckUtil
/*!
 *  @author KSCORPIO, 16-04-15
 *
 *  @brief 判断字符串是否为空字符串
 *
 *  @param str
 *
 *  @return bool
 */
+ (BOOL)isEmptyd:(NSString*)str
{

    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (str == nil || [str isEqualToString:@""]) {
        return YES;
    }
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([str isEqualToString:@""]) {
        return YES;
    }
    return NO;
}
/*!
 *  @author KSCORPIO, 16-04-25
 *
 *  @brief 检查 dict 值 如果为 null等异常字符 转换为@“”
 *
 *  @param dict
 *
 *  @return
 */
+ (NSDictionary*)checkDictNull:(NSDictionary*)dict
{
    NSMutableDictionary* dest = [[NSMutableDictionary alloc] initWithDictionary:dict];
    for (NSString* key in dict) {
        if ([dict[key] isKindOfClass:[NSNull class]]) {
            [dest setObject:@"" forKey:key];
        }
    }
    return [dest copy];
}
/*!
 *  @author KSCORPIO, 16-04-25
 *
 *  @brief 检查 dict 值 如果为 null等异常字符 转换为@“”
 *
 *  @param dict
 *
 *  @return
 */
+ (NSMutableArray*)checkArrayNull:(NSArray*)arr
{
    NSMutableArray* dest = [[NSMutableArray alloc] initWithArray:arr];
    for (int i = 0; i < arr.count; i++) {
        if ([arr[i] isKindOfClass:[NSNull class]]) {
            [dest setObject:@"" atIndexedSubscript:i];
        }
    }
    return dest;
}

#pragma mark -  🎃array dict null 检测部分
#pragma mark -   🎃  -- public
/*!
 *  @author KSCORPIO, 16-04-26
 *
 *  @brief 将NSDictionary中的Null类型的项目转化成@""
 *
 *  @param myDic
 *
 *  @return
 */
+ (NSDictionary*)nullDic:(NSDictionary*)myDic
{
    NSArray* keyArr = [myDic allKeys];
    NSMutableDictionary* resDic = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < keyArr.count; i++) {
        id obj = [myDic objectForKey:keyArr[i]];

        obj = [self changeType:obj];

        [resDic setObject:obj forKey:keyArr[i]];
    }

    return resDic;
}

/*!
 *  @author KSCORPIO, 16-04-26
 *
 *  @brief 将NSArray 中的Null类型的项目转化成@""
 *
 *  @param myArr
 *
 *  @return
 */
+ (NSArray*)nullArr:(NSArray*)myArr
{
    NSMutableArray* resArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < myArr.count; i++) {
        id obj = myArr[i];

        obj = [self changeType:obj];

        [resArr addObject:obj];
    }
    return resArr;
}
#pragma mark - 🎃  -- private
//将NSString类型的原路返回
+ (NSString*)stringToString:(NSString*)string
{
    return string;
}

//将Null类型的项目转化成@""
+ (NSString*)nullToString
{
    return @"";
}

//类型识别:将所有的NSNull类型转化成@""
+ (id)changeType:(id)myObj
{
    if ([myObj isKindOfClass:[NSDictionary class]]) {
        return [self nullDic:myObj];
    } else if ([myObj isKindOfClass:[NSArray class]]) {
        return [self nullArr:myObj];
    } else if ([myObj isKindOfClass:[NSString class]]) {
        return [self stringToString:myObj];
    } else if ([myObj isKindOfClass:[NSNull class]]) {
        return [self nullToString];
    } else {
        return myObj;
    }
}
@end
