//
//  UIView+Animation.m
//  InStoreBusiness
//
//  Created by 胡苗 on 2015/8/22.
//  Copyright © 2015年 胡苗. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

- (void)hm_AnimationWithView:(UIView *)animationView animationType:(HMAnimationEnum)animationType duration:(float)animationTime delayTime:(float)delayTime finishedBlock: (void (^)(void))completion{
    CGRect oriFrame = animationView.frame;
    CGRect lastFrame = oriFrame;
    UIView *fatherView = animationView.superview;
    CGRect fatherFrame = fatherView.frame;
    float fallValue = 1.0 ;
    float viewAlphaValue = 1.0;
    UIImageView *converView = [[UIImageView alloc]initWithFrame:animationView.bounds];
    converView.backgroundColor = [UIColor redColor];
    CGRect converFrame = converView.bounds ;
    CGRect converBounds = converFrame;
    
    switch (animationType) {
        case HMAnimationSliderFormTop:
            animationView.alpha = 0 ;
            lastFrame.origin.y = -1 * (oriFrame.size.height);
            break;
        case HMAnimationSliderToTop:
            oriFrame.origin.y = -1 *(oriFrame.size.height);
            break;
        case HMAnimationSliderFormBottom:
            animationView.alpha = 0 ;
            lastFrame.origin.y = fatherFrame.size.height ;
            break;
        case HMAnimationSliderToBottom:
            oriFrame.origin.y = fatherFrame.size.height ;
            break;
        case HMAnimationSliderFormLeft:
            animationView.alpha = 0 ;
            lastFrame.origin.x = -1 * (oriFrame.size.width) ;
            break;
        case HMAnimationSliderToLeft:
            oriFrame.origin.x = -1 *(oriFrame.size.width);
            break;
        case HMAnimationSliderFormRight:
            animationView.alpha = 0 ;
            lastFrame.origin.x = fatherFrame.size.width;
            break;
        case HMAnimationSliderToRight:
            oriFrame.origin.x = oriFrame.size.width ;
            break;
        case HMAnimationFallIn:
            animationView.alpha = 0 ;
            animationView.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(0.0), 1.5, 1.5);
            break;
        case HMAnimationFallOut:
            animationView.alpha = 1 ;
            fallValue = 2.0 ;
            viewAlphaValue = 0.0 ;
            break;
        case HMAnimationPopIn:
            animationView.alpha = 0 ;
            animationView.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(0.0), 0.1, 0.1);
            oriFrame.origin.x = 0 ;
            oriFrame.origin.y = 0 ;
            oriFrame.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
             lastFrame = CGRectMake(oriFrame.origin.x + oriFrame.size.width/2 - 10, oriFrame.origin.y + oriFrame.size.height/2 - 10, 20, 20);
            viewAlphaValue = 1.0 ;
            fallValue = 1.0 ;
            break;
        case HMAnimationPopOut:
            viewAlphaValue = 0.0 ;
            fallValue = 0.1;
            oriFrame.origin.x = 512 - 50 ;
            oriFrame.origin.y = 768/2 - 50 ;
            oriFrame.size = CGSizeMake(100, 100);
            break;
        case HMAnimationFallSliderFormLeft:
            animationView.alpha = 0 ;
            lastFrame.size.width = 1 ;
            lastFrame.origin.y -= 10;
            animationView.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(0.0), 1.5, 1.5);
            break;
        case HMAnimationFallSliderFormRight:
            animationView.alpha = 0 ;
            lastFrame.size.width = 1 ;
            lastFrame.origin.x += oriFrame.size.width - 1 ;
            lastFrame.origin.y -= 15;
            animationView.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(0.0), 1.5, 1.5);
            break;
        case HMAnimationFallSliderFormTop:
            animationView.alpha = 0 ;
            lastFrame.size.height = 1 ;
            lastFrame.size.width = 1 ;
            lastFrame.origin.x -= 10 ;
            lastFrame.origin.y -= 10 ;
            animationView.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(0.0), 1.5, 1.5);
            break;
        case HMAnimationFallSliderFormBottom:
            animationView.alpha = 0 ;
            lastFrame.size.width = 1 ;
            lastFrame.size.height = 1 ;
            lastFrame.origin.x -= 10 ;
            lastFrame.origin.y += oriFrame.size.height - 1 ;
            lastFrame.origin.y -= 10 ;
            animationView.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(0.0), 1.5, 1.5);
            break;
        case HMAnimationConverLayerFormLeft:
            converFrame.origin.x -= converFrame.size.width ;
            animationView.alpha = 1 ;
            converView.frame = converFrame ;
            [animationView.layer setMask:converView.layer];
            break;
        case HMAnimationConverLayerFormRight:
            converFrame.origin.x = converFrame.size.width ;
            animationView.alpha = 1 ;
            converView.frame = converFrame ;
            [animationView.layer setMask:converView.layer];
            break;
        case HMAnimationConverLayerFormTop:
            converFrame.origin.y -= converFrame.size.height ;
            animationView.alpha = 1 ;
            converView.frame = converFrame ;
            [animationView.layer setMask:converView.layer];
            break;
        case HMAnimationConverLayerFormBottom:
            converFrame.origin.y = converFrame.size.height ;
            animationView.alpha = 1 ;
            converView.frame = converFrame ;
            [animationView.layer setMask:converView.layer];
            break;
        case HMAnimationConverLayerFormCenter:
            
            converView.image = [UIImage imageNamed:@"CircleLayerImage.png"];
            converView.backgroundColor = [UIColor clearColor];
            converFrame.origin.x = converFrame.size.width / 2 - 1 ;
            converFrame.origin.y = converFrame.size.height / 2 - 1 ;
            converFrame.size = CGSizeMake(2, 2);
            converView.frame = converFrame ;
            [animationView.layer setMask:converView.layer];
            animationView.alpha = 0 ;
            
            converFrame = converBounds;
            converBounds = CGRectMake(-50, -50, converFrame.size.width+100, converFrame.size.height+100);
            
            viewAlphaValue = 1 ;
            break;
        case HMAnimationFadeIn:
            animationView.alpha = 0 ;
            viewAlphaValue = 1 ;
            break;
        case HMAnimationFadeOut:
            animationView.alpha = 1 ;
            viewAlphaValue = 0 ;
            break;
        default:
            break;
    }
    switch (animationType) {
        case HMAnimationFallIn:
        case HMAnimationPopOut:
            
            break;
            
        default:
            animationView.frame = lastFrame ;
            break;
    }
    
    [UIView animateWithDuration:animationTime delay:delayTime options:UIViewAnimationOptionCurveLinear animations:^{
            animationView.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(0.0), fallValue, fallValue);
            animationView.frame = oriFrame ;
            animationView.alpha = viewAlphaValue ;
            converView.frame = converBounds;
            [animationView layoutIfNeeded];
    }completion:^(BOOL finshed){
        if( finshed ){
            [converView removeFromSuperview];
            
            if( completion ){
                completion();
            }
        }
    }];
}


@end
