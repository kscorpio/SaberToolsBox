//
//  AlertTable.h
//
//  version 1.0
//
//  Created by kscorpio on 2017/7/27.
//  Copyright © 2017年 kscorpio All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STAlertTable : UIView
@property (nonatomic, strong) NSArray *selections;
- (instancetype)initWithTittle:(NSString *)tittle cancleButton:(NSString *)cancle;
- (void)show;
@end
