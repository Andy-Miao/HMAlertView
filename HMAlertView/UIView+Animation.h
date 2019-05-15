//
//  UIView+Animation.h
//  InStoreBusiness
//
//  Created by 胡苗 on 2015/8/22.
//  Copyright © 2015年 胡苗. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    HMAnimationSliderFormLeft = 0 ,//从左边缘 直线 进入（相对其父类而言）
    HMAnimationSliderFormRight ,//从右边缘 直线 进入（相对其父类而言）
    HMAnimationSliderFormTop ,//从上边缘 直线 进入（相对其父类而言）
    HMAnimationSliderFormBottom ,//从下边缘 直线 进入（相对其父类而言）
    
    HMAnimationSliderToLeft,//直线动画到左侧（相对其父类而言）
    HMAnimationSliderToRight,//直线动画到右侧 （相对其父类而言）
    HMAnimationSliderToTop,//直线动画到上边缘 （相对其父类而言）
    HMAnimationSliderToBottom,//直线动画到下边缘 （相对其父类而言）
    
    HMAnimationFallIn,//从大到小，transform由1.5变到1
    HMAnimationFallOut,//从小到大，transform由1变到1.5
    
    HMAnimationPopIn,//从大到小，transform由1变到0.1 alpha由1变到0
    HMAnimationPopOut,//由小到大，transform由0.1变到1 alpha由0变到1
    
    HMAnimationFallSliderFormLeft,//从左侧侧滑进入，transform由0.1变到1
    HMAnimationFallSliderFormRight,//从右侧侧滑进入，transform由0.1变到1
    HMAnimationFallSliderFormTop,//从顶部侧滑进入，transform由0.1变到1
    HMAnimationFallSliderFormBottom,//从下部侧滑进入，transform由0.1变到1
    
    HMAnimationConverLayerFormLeft,//从左到右 遮罩
    HMAnimationConverLayerFormRight,//从右到左 遮罩
    HMAnimationConverLayerFormTop,//从上往下 遮罩
    HMAnimationConverLayerFormBottom,//从下往上 遮罩
    HMAnimationConverLayerFormCenter,//从中央扩散 遮罩
    
    HMAnimationFadeIn,//淡隐淡出,出现
    HMAnimationFadeOut,//消失
}HMAnimationEnum;

@interface UIView (Animation)

- (void)hm_AnimationWithView:(UIView *)animationView animationType:(HMAnimationEnum)animationType duration:(float)animationTime delayTime:(float)delayTime finishedBlock: (void (^)(void))completion;

@end
