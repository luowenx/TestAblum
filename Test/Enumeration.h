//
//  Enumeration.h
//  Test
//
//  Created by luowenx on 16/10/31.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, EnumerationTestType) {
    EnumerationTestTypeA = 0,
    EnumerationTestTypeB,
    EnumerationTestTypeC,
    
    EnumerationTestType11  = 1 << 0,
    EnumerationTestType22 = 2 << 0,
    EnumerationTestType33 = 3 << 0,
    
    EnumerationTestTypeA1 = 1 << 10,
    EnumerationTestTypeA2 = 1 << 10,
    EnumerationTestTypeA3 = 1 << 10
};

@interface Enumeration : NSObject

@property (assign, nonatomic) EnumerationTestType type;


@end
