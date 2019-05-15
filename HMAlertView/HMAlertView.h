//
//  HMAlertView.h
//  InStoreBusiness
//
//  Created by 胡苗 on 2015/12/2.
//  Copyright © 2015年 胡苗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "UIView+Animation.h"

typedef void(^CreateBlock)(NSInteger tag);
@interface HMAlertView : UIView
@property (nonatomic, copy) CreateBlock hm_block;

- (void)hm_showAlertView;
@end
