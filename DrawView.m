//
//  DrawView.m
//  Test
//
//  Created by luowenx on 2016/11/11.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


- (void)drawRect:(CGRect)rect {
    [self bezierPath];
}

#pragma mark   ======   UIBezierPath

- (void) bezierPath
{
    CGAffineTransform transform = CGAffineTransformMakeTranslation((self.bounds.size.width-50*5)/2, 100);
    transform = CGAffineTransformScale(transform, 5, 5);
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 50, 50) cornerRadius:10];
    [path1 applyTransform:transform];
    [[UIColor colorWithRed:198/255.0f green:198/255.0f blue:198/255.0f alpha:1.0f] setStroke];
    [path1 stroke];
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(7, 10, 14, 12)];
    [path2 applyTransform:transform];
    [[UIColor colorWithRed:224/255.0f green:224/255.0f blue:224/255.0f alpha:1.0f] setFill];
    [path2 fill];
    
    UIBezierPath *path3 = [UIBezierPath bezierPathWithRect:CGRectMake(7, 10, 14, 12)];
    [path3 applyTransform:transform];
    [[UIColor colorWithRed:189/255.0f green:189/255.0f blue:189/255.0f alpha:1.0f] setStroke];
    [path3 stroke];
    
    UIBezierPath *path11 = [UIBezierPath bezierPath];
    [path11 moveToPoint:CGPointMake(28, 10)];
    [path11 addLineToPoint:CGPointMake(43, 10)];
    [path11 applyTransform:transform];
    [[UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f] setStroke];
    [path11 stroke];
    
    UIBezierPath *path12 = [UIBezierPath bezierPath];
    [path12 moveToPoint:CGPointMake(28, 16)];
    [path12 addLineToPoint:CGPointMake(43, 16)];
    [path12 applyTransform:transform];
    [path12 stroke];
    
    UIBezierPath *path13 = [UIBezierPath bezierPath];
    [path13 moveToPoint:CGPointMake(28, 22)];
    [path13 addLineToPoint:CGPointMake(43, 22)];
    [path13 applyTransform:transform];
    [path13 stroke];
    
    UIBezierPath *path21 = [UIBezierPath bezierPath];
    [path21 moveToPoint:CGPointMake(7, 28)];
    [path21 addLineToPoint:CGPointMake(43, 28)];
    [path21 applyTransform:transform];
    [path21 stroke];
    
    UIBezierPath *path22 = [UIBezierPath bezierPath];
    [path22 moveToPoint:CGPointMake(7, 34)];
    [path22 addLineToPoint:CGPointMake(43, 34)];
    [path22 applyTransform:transform];
    [path22 stroke];
    
    UIBezierPath *path23 = [UIBezierPath bezierPath];
    [path23 moveToPoint:CGPointMake(7, 40)];
    [path23 addLineToPoint:CGPointMake(43, 40)];
    [path23 applyTransform:transform];
    [path23 stroke];
}


@end
