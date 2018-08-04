//
//  SectionView.m
//  TimeKeeper7
//
//  Created by shima jinsei on 2014/05/12.
//  Copyright (c) 2014年 Jinsei Shima. All rights reserved.
//

#import "SectionView.h"

@implementation SectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setSectionView];
    }
    return self;
}

-(void)setSectionView{
    
    UIView *sectionview = [[UIView alloc]initWithFrame:self.frame];
 //   sectionview.backgroundColor = [UIColor blackColor];
    sectionview.layer.borderColor = [UIColor blackColor].CGColor;
    sectionview.layer.borderWidth = 2.0f;
    sectionview.layer.cornerRadius = 10;
    //sectionview.layer.shadowColor = CFBridgingRetain([UIColor grayColor]);
    
    sectionview.clipsToBounds = YES;
//    sectionview.userInteractionEnabled = NO;
    
    [self addSubview:sectionview];
     
}


@end
