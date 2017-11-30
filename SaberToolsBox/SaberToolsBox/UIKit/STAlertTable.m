//
//  STAlertTable
//
//  version 1.0
//
//  Created by kscorpio on 2017/7/27.
//  Copyright © 2017年 kscorpio All rights reserved.
//

#import "STAlertTable.h"

#define Blue_Light [UIColor colorWithRed:0/255.0 green:131.0/255.0 blue:255.0/255.0 alpha:1.0]
#define Blue_Dark [UIColor colorWithRed:222.0/255.0 green:241.0/255.0 blue:255.0/255.0 alpha:1.0]
@interface STAlertTable () <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong) UIView * board;
@property(nonatomic ,strong) UIToolbar* toolbar;
@property(nonatomic ,strong) UILabel * tittleL;
@property(nonatomic ,strong) UIButton * cancleBtn;
@property(nonatomic ,strong) UITableView * talble;
@property (nonatomic,strong) NSString * dKey;
@end
@implementation STAlertTable
- (instancetype)initWithTittle:(NSString *)tittle cancleButton:(NSString *)cancle
{
    self = [super init];
    if (self) {
        self.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.3];
        self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        [self initialConfigTittle:tittle cancleButton:cancle];
    }
    
    return self;
}
-(void)layoutSubviews{
    [self relayout];
}
-(void)initialConfigTittle:(NSString *)tittle cancleButton:(NSString *)cancle{
 
    _board=[[UIView alloc]init];
    _board.layer.cornerRadius=10.0;
    _board.backgroundColor=[UIColor clearColor] ;
    [_board setClipsToBounds:YES];
    [self addSubview:_board];
    _toolbar = [[UIToolbar alloc] initWithFrame:CGRectZero];
    _toolbar.barStyle = UIBarStyleDefault;
    _toolbar.backgroundColor = [UIColor clearColor];
    _toolbar.layer.cornerRadius=10.0;
    [_board addSubview:_toolbar];
    if (tittle) {
        _tittleL=[[UILabel alloc]init];
        _tittleL.font=[UIFont boldSystemFontOfSize:18.0];
        _tittleL.textColor=Blue_Light;
        _tittleL.backgroundColor=[UIColor clearColor];
        _tittleL.text=tittle;
        _tittleL.textAlignment=NSTextAlignmentCenter;
        [_board addSubview:_tittleL];
    }
    
    _talble =[[UITableView alloc]init];
    _talble.delegate =self;
    _talble.dataSource=self;
    [_talble setBounces:NO];
    _talble.backgroundColor=[UIColor clearColor];
    
    _talble.separatorColor=Blue_Light;
    _talble.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [_board addSubview:_talble];
    
    NSString * titt=cancle?cancle:@"取消";
    _cancleBtn=[[UIButton alloc]init];
    [_cancleBtn setTitle:titt forState:UIControlStateNormal];
    [_cancleBtn setTitleColor:Blue_Light forState:UIControlStateNormal];
    [_cancleBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    _cancleBtn.backgroundColor=[UIColor clearColor];
    [_board addSubview:_cancleBtn];
}
-(void)relayout{
    
    CGFloat wid=self.bounds.size.width;
    CGFloat hei=self.bounds.size.height;
    int ex=1;
    if (_tittleL) {
        ex=2;
       
    }
    int maxNum=(hei-100*2)/44-ex;
    int currentNum=_selections?(int)_selections.count:0;
    int showNum=maxNum>currentNum?currentNum:maxNum;
    CGFloat alertWid=300;
    _board.frame=CGRectMake((wid-alertWid)/2, (hei-(showNum+ex)*44)/2, alertWid, (showNum+ex)*44);
    _toolbar.frame=_board.bounds;
    _talble.frame=CGRectMake(0, (ex-1)*44, CGRectGetWidth(_board.frame), showNum*44);
    _cancleBtn.frame=CGRectMake(0, CGRectGetHeight(_board.frame)-44, CGRectGetWidth(_board.frame), 44);
    if (_tittleL) {
          _tittleL.frame=CGRectMake(0, 0, CGRectGetWidth(_board.frame), 44);
    }
 }
#pragma mark - set get
-(void)setSelections:(NSArray *)selections{
    _selections=selections;
    [self relayout];
}
-(void)setSelections:(NSArray *)selections byKeyValue:(NSString *)key{
    _dKey=key;
    _selections=selections;
     [self relayout];
    
}
#pragma mark - actions

- (void)show
{   self.alpha =0;
    UIWindow* keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self];
    //动画效果弹出
   
    [UIView animateWithDuration:0.5
                     animations:^{
                           self.alpha =1;
                     } completion:nil];
}
- (void)dismiss
{
    [UIView animateWithDuration:0.5
                     animations:^{
                        self.alpha =0;
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [self removeFromSuperview];
                         }
                     }];
}

#pragma mark -delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_selections) {
        return _selections.count;
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier =@"alerttablecell";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        cell.textLabel.textColor =Blue_Light;
        cell.backgroundColor=[UIColor clearColor];
        
        
    }
    cell.textLabel.text=[NSString stringWithFormat:@" %d",(int)indexPath.row];
   
    return  cell;
 }
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
