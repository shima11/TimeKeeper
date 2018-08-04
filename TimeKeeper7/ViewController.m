//
//  ViewController.m
//  TimeKeeper7
//
//  Created by shima jinsei on 2014/05/05.
//  Copyright (c) 2014年 Jinsei Shima. All rights reserved.
//

#import "ViewController.h"
#import "QBFlatButton.h"
#import "StartButton.h"
#import "FirstViewToolbar.h"
#import "PickerView.h"
#import "FadeAnimation.h"
#import "JWGCircleCounter.h"
#import "FirstJWGCircleCounter.h"
#import "SetJWGCircleCounter.h"
#import "TotalTimeLabel.h"
#import "SectionView.h"
#import "SectionViewTitle.h"

@interface ViewController ()

@property (nonatomic, strong) UIColor *circleColor;
@property (nonatomic, strong) UIColor *circleBackgroundColor;
@property (nonatomic, assign) CGFloat circleTimerWidth;
/*
@property (nonatomic, assign, readonly) BOOL didStart;
@property (nonatomic, assign, readonly) BOOL isRunning;
@property (nonatomic, assign, readonly) BOOL didFinish;
*/

@end


@implementation ViewController

JWGCircleCounter *circleCounter;
FirstJWGCircleCounter *firstCircleCounter;
SetJWGCircleCounter *setCircleCounter;

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    //self.view.backgroundColor = [UIColor colorWithHue:100 saturation:100 brightness:200 alpha:0.3];
    
    //画面取得
    UIScreen *sc = [UIScreen mainScreen];
    CGRect rect = sc.bounds;
    
//[self setCircle];
    
    /*
    //タイムサークルの描画
    firstCircleCounter = [[FirstJWGCircleCounter alloc] initWithFrame:CGRectMake(0,0,rect.size.height ,rect.size.width)];
    firstCircleCounter.circleTimerWidth = 80.0f;
    firstCircleCounter.alpha = 0.3;
    [self.view addSubview:firstCircleCounter];
    [firstCircleCounter firstStartWithSeconds:1];

    [self setCircle];
    */
  
    //toolbarの描画
    FirstViewToolbar* toolbar = [[FirstViewToolbar alloc] initWithFrame:CGRectMake(0, 0,rect.size.width ,44)];
    [self.view addSubview: toolbar];
    
    //pickerviewの描画
    PickerView* pickerview = [[PickerView alloc] initWithFrame:CGRectMake(0,0, rect.size.height, rect.size.width)];
    [self.view addSubview: pickerview];
    
    //startボタンの描画
    StartButton* startbutton = [[StartButton alloc] initWithFrame:CGRectMake(0, 0,rect.size.width*0.8 ,rect.size.height*0.1 )];
    startbutton.center = CGPointMake(rect.size.height/2, rect.size.width*0.89);
    [self.view addSubview: startbutton];
    
    //sectionviewの描画
    for(NSInteger i=0;i<3;i++){
        SectionView *sectionview = [[SectionView alloc]initWithFrame:CGRectMake(15+rect.size.height*0.16*i, 170, rect.size.height*0.3, 270)];
        [self.view addSubview:sectionview];
    }
    
    //sectionviewのタイトル名(textfieldで編集可能にする)
    for(NSInteger i=0;i<3;i++){
        //          SectionViewTitle *sectionviewtitle = [[SectionViewTitle alloc]initWithFrame:CGRectMake(15+rect.size.height*0.16*i, 130, rect.size.height*0.3, 40)];
        SectionViewTitle *sectionviewtitle = [[SectionViewTitle alloc]initWithFrame:CGRectMake(60+rect.size.height*0.32*i, 300, rect.size.height*0.24, 60)];
        sectionviewtitle.layer.cornerRadius = 10;
        sectionviewtitle.clipsToBounds = YES;
        
        sectionviewtitle.backgroundColor = [UIColor blackColor];
        [self.view addSubview:sectionviewtitle];
    }

    
}




//ーーーーーーーーーーーーー各セクション毎のサークルの描画ーーーーーーーーーーーーーーーーーーーーーー
-(void)setCircle{

    /*
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    NSInteger set_min1 = [userDefaults integerForKey:@"set_min1"];
    NSInteger set_sec1 = [userDefaults integerForKey:@"set_sec1"];
    NSInteger set_min2 = [userDefaults integerForKey:@"set_min2"];
    NSInteger set_sec2 = [userDefaults integerForKey:@"set_sec2"];
    NSInteger set_min3 = [userDefaults integerForKey:@"set_min3"];
    NSInteger set_sec3 = [userDefaults integerForKey:@"set_sec3"];
   
    NSInteger sec1 = set_min1*60 + set_sec1;
    NSInteger sec2 = set_min2*60 + set_sec2;
    NSInteger sec3 = set_min3*60 + set_sec3;
    
    NSInteger totalsec = sec1 + sec2 + sec3;
    
    float radA = sec1/totalsec;       //radA~radCはピッカービューの入力の値を計算して各円弧の割合を計算したもの
    float radB = (sec1+sec2)/totalsec;
    float radC = (sec1+sec2+sec3)/totalsec;
    */
    
    float radA = 0.2;    //radA~radCはピッカービューの入力の値を計算して各円弧の割合を計算したもの
    float radB = 0.5;
    float radC = 0.8;
    
    NSString *modelname = [ [ UIDevice currentDevice] model];
    
    //画面取得
    UIScreen *sc = [UIScreen mainScreen];
    CGRect rect = sc.bounds;
    
    //サークル1
    setCircleCounter = [[SetJWGCircleCounter alloc] initWithFrame:CGRectMake(0,0,rect.size.height ,rect.size.width)];
    if ( ![modelname hasPrefix:@"iPad"] ) {// iPhone
        setCircleCounter.circleTimerWidth = 32.0f;
    }else{// iPad
        setCircleCounter.circleTimerWidth = 85.0f;
    }
    setCircleCounter.alpha = 0.9;
    setCircleCounter.radian = radC;
    setCircleCounter.circleColor = [UIColor colorWithRed:0.5 green:1.0 blue:0.7 alpha:0.9];
    [self.view addSubview:setCircleCounter];
    [setCircleCounter firstStartWithSeconds:1];
    
    //サークル2
    setCircleCounter = [[SetJWGCircleCounter alloc] initWithFrame:CGRectMake(0,0,rect.size.height ,rect.size.width)];
    if ( ![modelname hasPrefix:@"iPad"] ) {// iPhone
        setCircleCounter.circleTimerWidth = 30.0f;
    }else{// iPad
        setCircleCounter.circleTimerWidth = 80.0f;
    }
    setCircleCounter.alpha = 0.9;
    setCircleCounter.radian = radB;
    setCircleCounter.circleBackgroundColor = [UIColor clearColor];
    setCircleCounter.circleColor = [UIColor colorWithRed:0.5 green:0.7 blue:1.0 alpha:0.9];
    [self.view addSubview:setCircleCounter];
    [setCircleCounter firstStartWithSeconds:1];
    
    //サークル3
    setCircleCounter = [[SetJWGCircleCounter alloc] initWithFrame:CGRectMake(0,0,rect.size.height ,rect.size.width)];
    if ( ![modelname hasPrefix:@"iPad"] ) {// iPhone
        setCircleCounter.circleTimerWidth = 28.0f;
    }else{// iPad
        setCircleCounter.circleTimerWidth = 75.0f;
    }
    setCircleCounter.alpha = 0.9;
    setCircleCounter.radian = radA;
    setCircleCounter.circleBackgroundColor = [UIColor clearColor];
    setCircleCounter.circleColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.6 alpha:0.9];
    [self.view addSubview:setCircleCounter];
    [setCircleCounter firstStartWithSeconds:1];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
