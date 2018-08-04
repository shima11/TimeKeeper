//
//  SectionViewTitle.m
//  TimeKeeper7
//
//  Created by shima jinsei on 2014/05/13.
//  Copyright (c) 2014年 Jinsei Shima. All rights reserved.
//

#import "SectionViewTitle.h"

@implementation SectionViewTitle
UITextField *tf;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // テキストフィールド例文
        tf =[[UITextField alloc] initWithFrame:CGRectMake(0, 0, 246, 60)];
        
        tf.borderStyle = UITextBorderStyleRoundedRect;
        tf.textColor = [UIColor blueColor];
        tf.placeholder = @"sectiontitle";
        tf.clearButtonMode = UITextFieldViewModeAlways;
        tf.textAlignment = NSTextAlignmentCenter;
        //フォントの設定
        tf.font = [UIFont fontWithName:@"Helvetica-Bold" size:36];
        //入力時のキーボードの種類を設定
        //tf.keyboardType = UIKeyboardTypeAlphabet;
        tf.keyboardType = UIReturnKeyDefault;
        
        //入力完了時のリターンキーの種類を設定
        tf.returnKeyType = UIReturnKeyGo;
        //クリアボタンの表示設定
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        // 編集終了後フォーカスが外れた時にhogeメソッドを呼び出す
        [tf addTarget:self action:@selector(hoge:)
     forControlEvents:UIControlEventEditingDidEndOnExit];
        
        
        [self addSubview:tf];

    }
    return self;
}

// 呼ばれるhogeメソッド
-(void)hoge:(UITextField*)textfield{
    // ここに何かの処理を記述する
    // （引数の textfield には呼び出し元のUITextFieldオブジェクトが引き渡されてきます）
}

// キーボードのReturnボタンがタップされたらキーボードを閉じるようにする
//※UITextFiledの以下デリゲートメソッドを実装する
-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    
    [tf resignFirstResponder];
    return YES;
}


@end
