//
//  TotalTimeLabel.m
//  TimeKeeper7
//
//  Created by shima jinsei on 2014/05/09.
//  Copyright (c) 2014年 Jinsei Shima. All rights reserved.
//

#import "TotalTimeLabel.h"

@implementation TotalTimeLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSInteger set_min1 = [userDefaults integerForKey:@"set_min1"];
        NSInteger set_sec1 = [userDefaults integerForKey:@"set_sec1"];
        NSInteger set_min2 = [userDefaults integerForKey:@"set_min2"];
        NSInteger set_sec2 = [userDefaults integerForKey:@"set_sec2"];
        NSInteger set_min3 = [userDefaults integerForKey:@"set_min3"];
        NSInteger set_sec3 = [userDefaults integerForKey:@"set_sec3"];

        int totalsecond = set_sec1+set_sec2+set_sec3+set_min1*60+set_min2*60+set_min3*60;
        int minute = totalsecond/60;
        int second = totalsecond%60;
        
        
        //タグを指定して画面から削除
        [[self viewWithTag:10] removeFromSuperview];
        
        UILabel *timelabel = [[UILabel alloc]initWithFrame:self.frame] ;
        
        //数字が一桁の場合十の位に0を表示
        if(second%60 <= 9){
            timelabel.text = [NSString stringWithFormat:@"%d:0%d",minute,second];
        }else{
            timelabel.text = [NSString stringWithFormat:@"%d:%d",minute,second];
        }
        timelabel.tag = 10;
        timelabel.font = [UIFont fontWithName:@"AppleGothic" size:240];
        
        NSString *modelname = [ [ UIDevice currentDevice] model];
        if ( ![modelname hasPrefix:@"iPad"] ) {
            timelabel.font = [UIFont fontWithName:@"AppleGothic" size:120];
        }
        
        timelabel.adjustsFontSizeToFitWidth = YES;
        
        timelabel.textColor = [UIColor blackColor];
        timelabel.textAlignment = NSTextAlignmentCenter;

        //タグを指定して画面から削除
        [[self viewWithTag:10] removeFromSuperview];

        [self addSubview: timelabel];
    }
    return self;
}


@end
