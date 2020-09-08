//
//  Students.h
//  iOS_DataStorage
//
//  Created by xunming Tan on 2020/8/12.
//  Copyright © 2020 xmt. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Students : NSObject<NSCoding>

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger age;

@end

NS_ASSUME_NONNULL_END
