//
//  Instruction.h
//  Test
//
//  Created by luowenx on 16/11/8.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 *  方法签名
 *
 */
@interface Instruction : NSObject

@property (weak, nonatomic) id obj;

@property (strong, nonatomic) NSArray *prams;

@property (strong, nonatomic) NSString *name;


-(id) call;

@end
