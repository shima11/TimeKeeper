//
//  main.m
//  TimeKeeper7
//
//  Created by shima jinsei on 2014/05/05.
//  Copyright (c) 2014年 Jinsei Shima. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:0 forKey:@"set_min1"];
    [userDefaults setInteger:0 forKey:@"set_sec1"];
    [userDefaults setInteger:0 forKey:@"set_min2"];
    [userDefaults setInteger:0 forKey:@"set_sec2"];
    [userDefaults setInteger:0 forKey:@"set_min3"];
    [userDefaults setInteger:0 forKey:@"set_sec3"];
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
