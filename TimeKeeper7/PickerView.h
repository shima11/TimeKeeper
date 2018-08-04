//
//  PickerView.h
//  TimeKeeper7
//
//  Created by shima jinsei on 2014/05/07.
//  Copyright (c) 2014年 Jinsei Shima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerView : UIView<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIColor *circleColor;
@property (nonatomic, strong) UIColor *circleBackgroundColor;
@property (nonatomic, assign) CGFloat circleTimerWidth;
@property (nonatomic, assign, readonly) BOOL didStart;
@property (nonatomic, assign, readonly) BOOL isRunning;
@property (nonatomic, assign, readonly) BOOL didFinish;

-(void)setPicker;

@end
