//
//  Instruction.m
//  Test
//
//  Created by luowenx on 16/11/8.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "Instruction.h"

@implementation Instruction

-(id)call
{
//    Class class = NSClassFromString(self.obj);
    SEL selector = NSSelectorFromString(self.name);
    //1、根据方法来初始化NSMethodSignature
    NSMethodSignature  *signature = [[self.obj class] instanceMethodSignatureForSelector:selector];
    
    //此时我们应该判断方法是否存在，如果不存在这抛出异常
    if (signature == nil) {
        //aSelector为传进来的方法
        NSString *info = [NSString stringWithFormat:@"%@方法找不到", self.name];
        [NSException raise:@"方法调用出现异常" format:info, nil];
    }
    
    //2、创建NSInvocation对象
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    //设置方法调用者
    invocation.target = self.obj;
    //注意：这里的方法名一定要与方法签名类中的方法一致
    invocation.selector = selector;
    //这里的Index要从2开始，以为0跟1已经被占据了，分别是self（target）,selector(_cmd)
//    for (int i = 0; i < self.prams.count; i++) {
//        NSString *key = [NSString stringWithFormat:@"%@",self.prams[i]];
//        [invocation setArgument:&key atIndex:(i + 2)];
//    }
    
    NSUInteger argsCount = signature.numberOfArguments - 2;
    NSUInteger arrCount = self.prams.count;
    NSUInteger count = MIN(argsCount, arrCount);
    for (int i = 0; i < count; i++) {
        id obj = self.prams[i];
        // 判断需要设置的参数是否是NSNull, 如果是就设置为nil
        if ([obj isKindOfClass:[NSNull class]]) {
            obj = nil;
        }
        [invocation setArgument:&obj atIndex:i + 2];
    }
    
    //3、调用invoke方法
    [invocation invoke];
    
    id res = nil;
    if (signature.methodReturnLength != 0) {//有返回值
        //将返回值赋值给res
        [invocation getReturnValue:&res];
    }
   
    return res;
}



@end
