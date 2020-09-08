//
//  ViewController.m
//  iOS_DataStorage
//
//  Created by xunming Tan on 2020/8/12.
//  Copyright © 2020 xmt. All rights reserved.
//

#import "ViewController.h"
#import "Students.h"

#import <sqlite3.h>

@interface ViewController (){

    sqlite3 *_db;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //1.获取沙盒文件名
     NSString *fileName = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"student.sqlite"];
    NSLog(@"fileName = %@",fileName);
    
    



////  setObject中的key和value可以为除了nil外的任何对象
////  setValue中的key只能为字符串 value可以为nil也可以为空对象[NSNull null]以及全部对象
//    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//    [userDefault setObject:@"小明" forKey:@"name"];
//    [userDefault synchronize];
//
//    NSLog(@"name = %@",[userDefault objectForKey:@"name"]);
//

    
//    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
//    NSString *filePath = [cachePath stringByAppendingPathComponent:@"newInfo.plist"];
//
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    [dict setObject:@"小红" forKey:@"name"];
//    [dict setObject:@"18" forKey:@"age"];
//    [dict writeToFile:filePath atomically:YES];
//
//    NSDictionary *dics = [NSDictionary dictionaryWithContentsOfFile:filePath];
//    NSLog(@"age:%@  %@", [dics objectForKey:@"age"],filePath);

 
    
//    Students *stu = [[Students alloc]init];
//    stu.name = @"掰掰";
//    stu.age = 8;
//
//    // 获取文件路径
//    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSString *path = [docPath stringByAppendingPathComponent:@"Students.archiver"];
//
//
//    [NSKeyedArchiver archiveRootObject:stu toFile:path];
//
//    Students *s1 = [NSKeyedUnarchiver unarchiveObjectWithFile:path] ;
//
//    NSLog(@"---------%@", s1.name);
//    NSLog(@"---------%ld", (long)s1.age);
    
    
    
    
//    NSDictionary *personDict=@{@"name":@"xiaoBai",@"age":@"25",@"sex":@"man"};
//
//    //获取沙盒中Documents的路径
//    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
//
//    //设置对象归档的路径及归档文件名
//    NSString *dictPath =[docPath stringByAppendingPathComponent:@"person.archiver"];//后缀名可以随意命名
//    [NSKeyedArchiver archiveRootObject:personDict toFile:dictPath];
//    NSDictionary *dic = [NSKeyedUnarchiver unarchiveObjectWithFile:dictPath];
//    NSLog(@"[][][][]%@",dic[@"name"]);
     
}


@end
