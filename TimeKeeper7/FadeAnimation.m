//
//  FadeAnimation.m
//  TimeKeeper7
//
//  Created by shima jinsei on 2014/05/09.
//  Copyright (c) 2014年 Jinsei Shima. All rights reserved.
//

#import "FadeAnimation.h"


@implementation FadeAnimation

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)fadeInAnimation:(UIView*)view{
    /*
    //フェードイン
    view.alpha = 0;
    //アニメーションのタイプを指定
    [UIView beginAnimations:@"fadeIn" context:nil];
    //イージング指定
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //アニメーション秒数を指定
    [UIView setAnimationDuration:0.8];
    //目標のアルファ値を指定
    view.alpha = 1;
    //アニメーション実行
    [UIView commitAnimations];
     */
    
    [UIView animateWithDuration:1.0f
                          delay:0.5f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         // アニメーションをする処理
                         view.alpha = 1.0f;
                     } completion:^(BOOL finished) {
                         // アニメーションが終わった後実行する処理
                     }];
    
}


-(void)fadeOutAnimation:(UIView*)view{
    /*
    //フェードアウト
    [UIView beginAnimations:@"fadeOut" context:nil];
    //イージング指定
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    //アニメーション秒数を指定
    [UIView setAnimationDuration:0.5];
    //目標のアルファ値を指定
    view.alpha = 0;
    //アニメーション実行
    [UIView commitAnimations];
    */
    
    [UIView animateWithDuration:1.0f
                          delay:0.8f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         // アニメーションをする処理
                         view.alpha = 0.0f;
                     } completion:^(BOOL finished) {
                         // アニメーションが終わった後実行する処理
                     }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
