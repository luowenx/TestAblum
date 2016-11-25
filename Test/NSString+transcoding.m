//
//  NSString+transcoding.m
//  Test
//
//  Created by luowenx on 2016/11/25.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "NSString+transcoding.h"
#import <UIKit/UIKit.h>

#define IOS9_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"9.0" options:NSNumericSearch] != NSOrderedAscending )

UIKIT_STATIC_INLINE BOOL isEmpty(id thing) {
    return thing == nil || [thing isEqual:[NSNull null]]
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

@implementation NSString (transcoding)

-(NSString *)URLDecodedString
{
    if (isEmpty(self)) {
        return @"";
    }
    if (IOS9_OR_LATER) {
        return [self stringByRemovingPercentEncoding];
    }
    NSString *decodedString = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)self, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    return decodedString;
}

@end
