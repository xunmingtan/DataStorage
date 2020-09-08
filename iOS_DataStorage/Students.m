//
//  Students.m
//  iOS_DataStorage
//
//  Created by xunming Tan on 2020/8/12.
//  Copyright © 2020 xmt. All rights reserved.
//

#import "Students.h"

@implementation Students

//需要重写两个协议方法
//-(void)encodeWithCoder:(NSCoder *)aCoder方法：
//-(id)initWithCoder:(NSCoder *)aDecoder方法：


// 当将一个自定义对象保存到文件的时候就会调用该方法
// 在该方法中说明如何存储自定义对象的属性
// 也就说在该方法中说清楚存储自定义对象的哪些属性
-(void)encodeWithCoder:(NSCoder *)aCoder
{
         NSLog(@"调用了encodeWithCoder:方法");
         [aCoder encodeObject:self.name forKey:@"name"];
         [aCoder encodeInteger:self.age forKey:@"age"];
 }

// 当从文件中读取一个对象的时候就会调用该方法
// 在该方法中说明如何读取保存在文件中的对象
// 也就是说在该方法中说清楚怎么读取文件中的对象
-(id)initWithCoder:(NSCoder *)aDecoder
{
     NSLog(@"调用了initWithCoder:方法");
     //注意：在构造方法中需要先初始化父类的方法
     if (self=[super init]) {
             self.name=[aDecoder decodeObjectForKey:@"name"];
             self.age=[aDecoder decodeIntegerForKey:@"age"];

     }
     return self;
 }



@end
