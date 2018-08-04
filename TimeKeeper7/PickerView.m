//
//  PickerView.m
//  TimeKeeper7
//
//  Created by shima jinsei on 2014/05/07.
//  Copyright (c) 2014年 Jinsei Shima. All rights reserved.
//

#import "PickerView.h"
#import "ViewController.h"
#import "TotalTimeLabel.h"
#import "FadeAnimation.h"

@implementation PickerView
{
    UIPickerView *picker;
    UIToolbar *tb_layer;

}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setPicker];
        //画面取得
        UIScreen *sc = [UIScreen mainScreen];
        CGRect rect = sc.bounds;
        
        //フェードインアニメーション
        FadeAnimation *fadeinanimation = [[FadeAnimation alloc]init];
        
        //timelabelの描画
        TotalTimeLabel* timelabel = [[TotalTimeLabel alloc] initWithFrame:CGRectMake(0, 0,rect.size.height*0.8 ,rect.size.width*0.45)];
        timelabel.center = CGPointMake(rect.size.height/2, rect.size.width*0.25);
        timelabel.tag = 10;
        timelabel.alpha = 0.0;
        [self addSubview: timelabel];

        [fadeinanimation fadeInAnimation:timelabel];

    }
    return self;
}

//ーーーーーーーーーーーーーーピッカービューの基本設定ーーーーーーーーーーーーーーーーー
-(void)setPicker
{
    //画面取得
    UIScreen *sc = [UIScreen mainScreen];
    CGRect rect = sc.bounds;
    
    for(int i=0;i<3;i++){
        
        // UIPickerのインスタンス化
        picker = [[UIPickerView alloc]init];
        picker.frame = CGRectMake(30+rect.size.height*0.32*i, 350, rect.size.height*0.3, 270);

        NSString *modelname = [ [ UIDevice currentDevice] model];
        if ( ![modelname hasPrefix:@"iPad"] ) {
            picker.frame = CGRectMake(25+rect.size.height*0.32*i, 0, rect.size.height*0.28,rect.size.width*0.3 );
        }
        
        picker.tag = i;
    
        // デリゲートを設定
        picker.delegate = self;
        // データソースを設定
        picker.dataSource = self;
        // 選択インジケータを表示
        picker.showsSelectionIndicator = YES;

        [self addSubview:picker];
    }
}


//ーーーーーーーーーーーーーーピッカービューの細かい設定ーーーーーーーーーーーーーーーーーーーーーー
// 列数を返す例
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
    return 4;
}
// 行数を返す例
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0 || component == 2){
        return 60;
    }else{
        return 1;
    }
}
//行の高さを変更
- (CGFloat)pickerView:(UIPickerView *)pickerView
rowHeightForComponent:(NSInteger)component
{
    NSString *modelname = [ [ UIDevice currentDevice] model];
    // iPadかどうか判断する
    if ( ![modelname hasPrefix:@"iPad"] ) {
        return 40.0;
    }else{
        return 80.0;
    }
}
//行のサイズを変更
- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component
{
    NSString *modelname = [ [ UIDevice currentDevice] model];
    // iPadかどうか判断する
    if ( ![modelname hasPrefix:@"iPad"] ) {
        if((component+1)%2 == 1){
            return 35.0;
        }else{
            return 15.0;
        }
    }else{
        if((component+1)%2 == 1){
            return 90.0;
        }else{
            return 30.0;
        }
    }
}

//ピッカービューのテキストのフォントサイズの設定
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    if(component == 0 || component == 2){
        UILabel *carsLabel = [[UILabel alloc]init];
        carsLabel.text = [NSString stringWithFormat:@"%d", row];      //分と秒を返す
        carsLabel.font = [UIFont fontWithName:@"AppleGothic" size:70];
        //iphoneだったらフォントサイズの変更
        NSString *modelname = [ [ UIDevice currentDevice] model];
        if ( ![modelname hasPrefix:@"iPad"] ) {
            carsLabel.font= [UIFont fontWithName:@"AppleGothic" size:40];
        }
        
        carsLabel.adjustsFontSizeToFitWidth = YES;

        //carsLabel.textColor = [UIColor blackColor];
        carsLabel.textColor = [UIColor blackColor];
        carsLabel.backgroundColor = [UIColor clearColor];
        carsLabel.opaque = NO;
        //    carsLabel.textAlignment = NSTextAlignmentCenter;
        //carsLabel.textAlignment = NSTextAlignmentRight;
        carsLabel.textAlignment = NSTextAlignmentCenter;
        
        [view addSubview:carsLabel];
        return carsLabel;
    }
    else if(component == 1){
        UILabel *carsLabel = [[UILabel alloc]init];
        carsLabel.text =  [NSString stringWithFormat:@"分"];
        //carsLabel.textColor = [UIColor blackColor];
        carsLabel.textColor = [UIColor blackColor];
        carsLabel.font = [UIFont fontWithName:@"AppleGothic" size:20];
        carsLabel.adjustsFontSizeToFitWidth = YES;

        carsLabel.backgroundColor = [UIColor clearColor];
        carsLabel.opaque = NO;
        carsLabel.textAlignment = NSTextAlignmentCenter;
        //      carsLabel.textAlignment = NSTextAlignmentRight;
        [view addSubview:carsLabel];
        return carsLabel;
    }else if(component == 3){
        UILabel *carsLabel = [[UILabel alloc]init];
        carsLabel.text =  [NSString stringWithFormat:@"秒"];
        //carsLabel.textColor = [UIColor blackColor];
        carsLabel.textColor = [UIColor blackColor];
        carsLabel.font = [UIFont fontWithName:@"AppleGothic" size:20];
        carsLabel.adjustsFontSizeToFitWidth = YES;

        carsLabel.backgroundColor = [UIColor clearColor];
        carsLabel.opaque = NO;
        carsLabel.textAlignment = NSTextAlignmentCenter;
        //      carsLabel.textAlignment = NSTextAlignmentRight;
        [view addSubview:carsLabel];
        return carsLabel;

    }else{
        return  nil;
    }
    
}
/*
 // 表示する内容を返す例
 -(NSString*)pickerView:(UIPickerView*)pickerView
 titleForRow:(NSInteger)row forComponent:(NSInteger)component{
 if(component == 0){
 return [NSString stringWithFormat:@"%d分", row];      //分を返す
 }
 else{
 return [NSString stringWithFormat:@"%d秒", row];     //秒を返す
 }
 }
 */
//ピッカーの選択行が決まったとき(更新するごとに実行される)
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    // 1列目の選択された行数を取得
    NSInteger min = [pickerView selectedRowInComponent:0];
    // 2列目の選択された行数を取得
    NSInteger sec = [pickerView selectedRowInComponent:2];
    
    if(pickerView.tag == 0){
        
        [userDefaults setInteger:min forKey:@"set_min1"];
        [userDefaults setInteger:sec forKey:@"set_sec1"];
   
    }else if(pickerView.tag == 1){
        
        [userDefaults setInteger:min forKey:@"set_min2"];
        [userDefaults setInteger:sec forKey:@"set_sec2"];

    }else if(pickerView.tag == 2){
        [userDefaults setInteger:min forKey:@"set_min3"];
        [userDefaults setInteger:sec forKey:@"set_sec3"];
 
    }else{

    }
    
    
    NSInteger set_min1 = [userDefaults integerForKey:@"set_min1"];
    NSInteger set_sec1 = [userDefaults integerForKey:@"set_sec1"];
    NSLog(@"min1:%d",set_min1);
    NSLog(@"sec1:%d",set_sec1);
    NSInteger set_min2 = [userDefaults integerForKey:@"set_min2"];
    NSInteger set_sec2 = [userDefaults integerForKey:@"set_sec2"];
    NSLog(@"min2:%d",set_min2);
    NSLog(@"sec2:%d",set_sec2);
    NSInteger set_min3 = [userDefaults integerForKey:@"set_min3"];
    NSInteger set_sec3 = [userDefaults integerForKey:@"set_sec3"];
    NSLog(@"min3:%d",set_min3);
    NSLog(@"sec3:%d",set_sec3);

    //画面取得
    UIScreen *sc = [UIScreen mainScreen];
    CGRect rect = sc.bounds;
    //timelabelの描画
    TotalTimeLabel* timelabel = [[TotalTimeLabel alloc] initWithFrame:CGRectMake(0, 0,rect.size.height*0.8 ,rect.size.width*0.45)];

    timelabel.center = CGPointMake(rect.size.height/2, rect.size.width*0.25);
        
    //タグを指定して画面から削除
    [[self viewWithTag:10] removeFromSuperview];
    
    [self addSubview: timelabel];
}


@end
