//
//  FirstViewToolbar.m
//  TimeKeeper7
//
//  Created by shima jinsei on 2014/05/07.
//  Copyright (c) 2014年 Jinsei Shima. All rights reserved.
//

#import "FirstViewToolbar.h"

@implementation FirstViewToolbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //画面取得
        UIScreen *sc = [UIScreen mainScreen];
        CGRect rect = sc.bounds;
        
        
        // 機種の取得
        NSString *modelname = [ [ UIDevice currentDevice] model];
        
        // iPadかどうか判断する
        if ( ![modelname hasPrefix:@"iPad"] ) {
            // iPhone
            //ヘルプボタンの作成
            CGRect toolbarFrame = CGRectMake(0, 0, rect.size.height, 44);
            UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:toolbarFrame];
            [self addSubview:toolbar];
            NSMutableArray *items = [NSMutableArray array];
            UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"help" style:UIBarStyleBlack target:self action:@selector(helpButton)];
            toolbar.translucent = YES;                 //半透明
            toolbar.tintColor = [ UIColor grayColor];
            
            // 固定間隔のスペーサーの作成
            UIBarButtonItem * fixedSpacer = [[ UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
            fixedSpacer.width = 350;
            
            
            
            //設定ボタンの作成
            UIButton *customView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
            [customView setBackgroundImage:[UIImage imageNamed:@"settingButton.png"]
                                  forState:UIControlStateNormal];
            [customView addTarget:self action:@selector(settingButton) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem* buttonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
            
            
            //toolbarに各要素を追加する
            [items addObject:item1];
            [items addObject:fixedSpacer];
            [items addObject:buttonItem];
            
            [toolbar setItems:items];

            
        }else{
            
            
            
            // iPad
            //ヘルプボタンの作成
            CGRect toolbarFrame = CGRectMake(0, 0, rect.size.height, 44);
            UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:toolbarFrame];
            [self addSubview:toolbar];
            NSMutableArray *items = [NSMutableArray array];
            UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"help" style:UIBarStyleBlack target:self action:@selector(helpButton)];
            toolbar.translucent = YES;                 //半透明
            toolbar.tintColor = [ UIColor grayColor];
            
            // 固定間隔のスペーサーの作成
            UIBarButtonItem * fixedSpacer = [[ UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
            fixedSpacer.width = 650;
            
            //設定ボタンの作成
            UIButton *customView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            [customView setBackgroundImage:[UIImage imageNamed:@"settingButton.png"]
                                  forState:UIControlStateNormal];
            [customView addTarget:self action:@selector(settingButton) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem* buttonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
            
            
            //toolbarに各要素を追加する
          //  [items addObject:item1];
          //  [items addObject:fixedSpacer];
          //  [items addObject:buttonItem];
            // ラベル「（・ω・）」を生成する
            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0,0,300,44)];
            lbl.backgroundColor = [UIColor clearColor];
            lbl.textColor = [UIColor blackColor];
            lbl.text = @"Time Keeper";
            lbl.font = [UIFont fontWithName:@"AppleGothic" size:40];
            UIBarButtonItem *lblbtn = [[UIBarButtonItem alloc] initWithCustomView:lbl];
            
            
            UIBarButtonItem *itemR1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction	 target:self action:@selector(pressButtonR1:)];
            UIBarButtonItem *itemR2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pressButtonR2:)];
            
            UIBarButtonItem *itemL1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash	 target:self action:@selector(pressButtonL1:)];
            UIBarButtonItem *itemL2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPageCurl target:self action:@selector(pressButtonL2:)];
            
            UIBarButtonItem *gap = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
            /*
            [items addObject:itemR1];
            [items addObject:gap];
            [items addObject:itemR2];
            [items addObject:gap];
            [items addObject:itemL1];
            [items addObject:gap];
            [items addObject:itemL2];
            */
            
            [items addObject:gap];
            //タイトルの表示
             [items addObject:lblbtn];
            [items addObject:gap];
            [items addObject:gap];
            [items addObject:gap];

            
            [toolbar setItems:items];
            
            
        
            
        }

        
    }
    return self;
}

-(void)settingButton{
    NSLog(@"settingButton");
}

- (void)helpButton {
    NSLog(@"doAction start.");
}



-(void)pressButtonR1:(UIButton *)button{
    
}
-(void)pressButtonR2:(UIButton *)button{
    
    
}
-(void)pressButtonL1:(UIButton *)button{
    
    
}
-(void)pressButtonL2:(UIButton *)button{
    
    
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
