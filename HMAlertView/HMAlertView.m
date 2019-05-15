//
//  HMAlertView.m
//  InStoreBusiness
//
//  Created by 胡苗 on 2015/12/2.
//  Copyright © 2015年 胡苗. All rights reserved.
//

#import "HMAlertView.h"

@interface HMAlertView ()
@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) UIButton *joinBtn;

@property (nonatomic, strong) UIButton *createBtn;
@end

#define FitHeight(value) ((value)/750.0f*[UIScreen mainScreen].bounds.size.width)
#define BLACK_COLOR [UIColor blackColor]
#define WHITE_COLOR [UIColor whiteColor]
#define CLEAR_COLOR [UIColor clearColor]
/*---------------------颜色的宏定义-------------------*/
#define ISBColor(r, g, b, a)  [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]
#define ISBColorFromRGB(rgbValue)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
///强调色0xe70063
#define  Global_AccentColor  ISBColorFromRGB(0xe70063)
///提示色0x9f9ea3
#define Global_PromptLightColor ISBColorFromRGB(0x9f9ea3)
///分割线
#define Global_HalvingLine       ISBColor(203, 202, 207, 1)

#define WS(weakSelf)    __weak __typeof(&*self)weakSelf = self;
@implementation HMAlertView

-(instancetype)initWithFrame:(CGRect)frame  {
    self = [super initWithFrame: frame];
    if (self) {
    }
    return self;
}

-(void)hm_addContentView {
    
    _backView = [[UIView alloc]initWithFrame:self.bounds];
    _backView.backgroundColor = BLACK_COLOR;
    _backView.alpha = 0.4;
    [self addSubview:_backView];
    
    UIView *cardView= [UIView new];
    [self addSubview:cardView];
    cardView.layer.masksToBounds = YES;
    cardView.layer.cornerRadius = 5;
    cardView.backgroundColor = WHITE_COLOR;
    [cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(FitHeight(290)+64));
        make.left.equalTo(self).offset (40);
        make.right.equalTo(self).offset(-40);
        make.height.equalTo(@140);
        }];
    
    UILabel *titleL= [UILabel new];
    [cardView  addSubview:titleL];
    titleL.text = @"恭喜您! 注册成功";
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.textColor = Global_PromptLightColor;
    titleL.backgroundColor = CLEAR_COLOR;
    [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cardView);
        make.right.equalTo(cardView);
        make.top.equalTo(cardView);
        make.height.equalTo(@87.5);
    }];
    
    UIView *horizontalLine = [UIView new];
    [cardView addSubview:horizontalLine];
    horizontalLine.backgroundColor = Global_HalvingLine;
    [horizontalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cardView);
        make.right.equalTo(cardView);
        make.top.equalTo(titleL.mas_bottom);
        make.height.equalTo(@0.5);
    }];
    
    _joinBtn= [UIButton new];
    _joinBtn.tag = 300;
    [cardView addSubview:_joinBtn];
    _joinBtn.backgroundColor = CLEAR_COLOR;
    [_joinBtn setTitle:@"加入店铺" forState:UIControlStateNormal];
    [_joinBtn setTitleColor:Global_AccentColor forState:UIControlStateNormal];
    [_joinBtn addTarget:self action:@selector(hm_createAction:) forControlEvents:UIControlEventTouchUpInside];
    [_joinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cardView);
        make.top.equalTo(horizontalLine.mas_bottom);
        make.height.equalTo(@52);
        make.width.equalTo(@((self.frame.size.width- 80)/2.0 - .5));
    }];
    
    WS(weakSelf)
    UIView *verticalLine = [UIView new];
    [cardView addSubview:verticalLine];
    verticalLine.backgroundColor = Global_HalvingLine;
    [verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(horizontalLine.mas_bottom);
        make.left.equalTo(weakSelf.joinBtn.mas_right);
        make.height.equalTo(@52);
        make.width.equalTo(@.5);
    }];
    
    _createBtn= [UIButton new];
    [cardView addSubview:_createBtn];
    _createBtn.tag = 301;
    [_createBtn setTitle:@"创建店铺" forState:UIControlStateNormal];
    [_createBtn setTitleColor:Global_AccentColor forState:UIControlStateNormal];
    [_createBtn addTarget:self action:@selector(hm_createAction:) forControlEvents:UIControlEventTouchUpInside];
    _createBtn.backgroundColor = CLEAR_COLOR;
    [_createBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(cardView);
        make.top.equalTo(horizontalLine.mas_bottom);
        make.height.equalTo(@52);
        make.width.equalTo(@((self.frame.size.width-80)/2.0 - .5));
    }];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hm_hiddenAlertView];
}

- (void)hm_showAlertView {
    [self hm_AnimationWithView:self animationType:HMAnimationPopIn duration:0.15 delayTime:0.15 finishedBlock:nil];
    
    [self hm_addContentView];
    
    UIWindow  *mainWindow = [[UIApplication sharedApplication] keyWindow];
    [mainWindow addSubview:self];
}

- (void)hm_hiddenAlertView {
    [self hm_AnimationWithView:self animationType:HMAnimationPopOut duration:0.15 delayTime:0.15 finishedBlock:^{
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self removeFromSuperview];
    }];
}

- (void)hm_createAction:(UIButton *)sender {
    if (_hm_block) {
        _hm_block(sender.tag%300);
    }
     [self hm_hiddenAlertView];
}
@end
