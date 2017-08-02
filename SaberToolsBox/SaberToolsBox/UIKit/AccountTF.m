//
//  AccountTextField.m
//  MaintenanceExpert
//
//  version 1.0
//  Created by kscorpio on 2017/8/2.
//  Copyright © 2017年 cn.sylg. All rights reserved.
//

#import "AccountTF.h"
#define Left_Ed 0
#define Line_W 0.5  //下边线粗

#define placeholder_cor [UIColor colorWithRed:125/255.0 green:185/255.0 blue:222/255.0 alpha:1]
#define line_cor [UIColor colorWithRed:145.0/255.0 green:152/255.0 blue:159/255.0 alpha:1]
#define text_cor [UIColor colorWithRed:81/255.0 green:168/255.0 blue:221/255.0 alpha:1]
#define tint_cor [UIColor colorWithRed:88/255.0 green:178/255.0 blue:220/255.0 alpha:1]
//[UIColor colorWithRed:58/255.0 green:143.0/255.0 blue:183.0/255.0 alpha:1]
@interface AccountTF() <UITextFieldDelegate>
@property(nonatomic) TFRole role;
@property(nonatomic,strong) UITextField *tf;
@property(nonatomic,strong) UIImageView *img;
@property(nonatomic,strong) UIView * line;
@end
@implementation AccountTF

- (instancetype)initWithFrame:(CGRect)frame role:(TFRole)role
{
    self = [super initWithFrame:frame];
    if (self) {
        self.role=role;
        [self initialConfig];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat wid=self.bounds.size.width;
    CGFloat hei=self.bounds.size.height;
    _img.frame=CGRectMake(10, 10, hei-20, hei-20);
    _tf.frame=CGRectMake(hei+Left_Ed+5, 5, wid-hei-Left_Ed-5, hei-Line_W-5);
    _line.frame=CGRectMake(10,CGRectGetMaxY(_tf.frame), wid -10,  Line_W);
    
}
-(void)initialConfig{
    
    _img=[[UIImageView alloc]init];
   
    
    _tf=[[UITextField alloc]init];
    _tf.backgroundColor=[UIColor clearColor];
    _tf.delegate=self;
    _tf.textColor=text_cor;
    _tf.tintColor=tint_cor;
    
    _line=[[UIView alloc]init];
    _line.backgroundColor=line_cor;
    [self addSubview:_tf];
    [self addSubview:_line];
    [self addSubview:_img];
    
    if(_role==UserNameTF){
        _img.image=[UIImage imageNamed:@"login_name.png"];
        _tf.placeholder=@"请输入用户名";
        _tf.keyboardAppearance = UIKeyboardAppearanceDark;
        _tf.keyboardType = UIKeyboardTypePhonePad;
    }else if(_role==PasswordTF){
        _img.image=[UIImage imageNamed:@"login_password.png"];
        _tf.placeholder=@"请输入密码";
        _tf.keyboardAppearance = UIKeyboardAppearanceDark;
        _tf.keyboardType = UIKeyboardTypeDefault;
        _tf.secureTextEntry = YES;
    }
    [self setPlaceHolerColor:placeholder_cor];
}



#pragma mark - setter /getter
- (void)setPlaceHolerColor:(UIColor *) color{
    if (_tf) {
        [_tf setValue:color forKeyPath:@"_placeholderLabel.textColor"];
    }
}
#pragma mark - public
-(NSString *)tfValue{
    if (_tf && ![self isEmptyd:_tf.text]) {
        return _tf.text;
    }
    return nil;
}
#pragma mark - util
- (BOOL)isEmptyd:(NSString *)str{
    
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (str==nil||[str isEqualToString:@""]) {
        return YES;
    }
    str=[str stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([str isEqualToString:@""]) {
        return YES;
    }
    return NO;
}
#define mark - delegate
- (BOOL)textFieldShouldReturn:(UITextField*)textField
{
    if (_delegate && [_delegate respondsToSelector:@selector(AccountTFShouldReturn:)]) {
        return [_delegate AccountTFShouldReturn:self];
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField*)textField
{
    if (_delegate && [_delegate respondsToSelector:@selector(AccountTFShouldReturn:)]) {
          [_delegate AccountTFDidBeginEditing:self];
    }
}
- (void)textFieldDidEndEditing:(UITextField*)textField
{
    if (_delegate && [_delegate respondsToSelector:@selector(AccountTFShouldReturn:)]) {
          [_delegate AccountTFDidEndEditing:self];
    }
}
@end
