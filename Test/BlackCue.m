//
//  BlackCue.m
//  ShowBusiness
//
//  Created by lq on 15/12/15.
//  Copyright © 2015年 赵将. All rights reserved.
//

#import "BlackCue.h"

@implementation BlackCue
+(void)showText:(NSString *)text
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    NSDictionary *dictionary =@{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    CGSize size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dictionary context:nil].size;
    CGFloat W=[[UIScreen mainScreen]bounds].size.width;
    CGFloat H=[[UIScreen mainScreen]bounds].size.height;
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(W/2-size.width/2-10, H/3, size.width+20, size.height+10)];
    view.backgroundColor=[UIColor blackColor];
    view.layer.cornerRadius=5;
    view.layer.masksToBounds=YES;
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(W/2-size.width/2-10, H/3, size.width+20, size.height+10)];
    label.backgroundColor=[UIColor clearColor];
    label.text=text;
    label.textAlignment=1;
    label.font=[UIFont systemFontOfSize:14];
    label.numberOfLines=0;
    label.textColor=[UIColor whiteColor];
    [window addSubview:view];
    [window addSubview:label];
    
    [UIView animateWithDuration:1.5 animations:^{
        view.alpha = 0;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
        [label removeFromSuperview];
        [window removeFromSuperview];        
    }];
    
}
@end
