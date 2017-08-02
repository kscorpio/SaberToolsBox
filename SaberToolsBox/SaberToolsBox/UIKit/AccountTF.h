//
//  AccountTF.h
//  MaintenanceExpert
//
//  version 1.0
//  Created by kscorpio on 2017/8/2.
//  Copyright © 2017年 cn.sylg. All rights reserved.
//
//

#import <UIKit/UIKit.h>
@class AccountTF;
@protocol AccountTFDelegate <NSObject>

- (void)AccountTFDidBeginEditing:(AccountTF *)tf;
- (void)AccountTFDidEndEditing:(AccountTF*)tf;
- (BOOL)AccountTFShouldReturn:(AccountTF*)tf;
@end

@interface AccountTF : UIView
typedef NS_ENUM(NSInteger,TFRole){
    UserNameTF,
    PasswordTF
};
@property(nonatomic,weak)id<AccountTFDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame role:(TFRole)role;
- (NSString *)tfValue;
@end
