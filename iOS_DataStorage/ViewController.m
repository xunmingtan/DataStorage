//
//  ViewController.m
//  iOS_DataStorage
//
//  Created by xunming Tan on 2020/8/12.
//  Copyright © 2020 xmt. All rights reserved.
//

#import "ViewController.h"
#import "Students.h"

//导入文件
#import <sqlite3.h>

@interface ViewController (){

    sqlite3 *_db;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //sqlite3
//    //1.获取沙盒文件名
//     NSString *fileName = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"student.sqlite"];
//    NSLog(@"fileName = %@",fileName);
//
//    int result = sqlite3_open(fileName.UTF8String, &_db); //创建(打开)数据库,如果数据库不存在，会自动创建  数据库文件的路径必须以C字符串(而非NSString)传入
//
//    if (result == SQLITE_OK) {
//        NSLog(@"成功打开数据库");
//
//        char *errorMesg = NULL;
//        const char *sql = "create table if not exists t_person (id integer primary key autoincrement, name text, age integer);";
//        int result = sqlite3_exec(_db, sql, NULL, NULL, &errorMesg); //sqlite3_exec()可以执行任何SQL语句，比如创表、更新、插入和删除操作。但是一般不用它执行查询语句，因为它不会返回查询到的数据
//
//        if (result == SQLITE_OK) {
//            NSLog(@"成功创建t_person表");
//        } else {
//            NSLog(@"创建t_person表失败:%s",errorMesg);
//        }
//
//    } else {
//        NSLog(@"打开数据库失败");
//    }
    
//    NSUserDefaults

////  setObject中的key和value可以为除了nil外的任何对象
////  setValue中的key只能为字符串 value可以为nil也可以为空对象[NSNull null]以及全部对象
//    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//    [userDefault setObject:@"小明" forKey:@"name"];
//    [userDefault synchronize];
//
//    NSLog(@"name = %@",[userDefault objectForKey:@"name"]);
//

//    、、归档接档
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
//sqlite3 添加数据库
- (IBAction)AddSqlite3:(UIButton *)sender {
 
    for (int i = 0; i < 10; i++) {
        
        NSString *name = [NSString stringWithFormat:@"小明-%d",arc4random()%100];
        int age = arc4random() % 100;
        
        char *errorMesg = NULL;
        NSString *sql = [NSString stringWithFormat:@"insert into t_person (name,age) values ('%@',%d);",name, age];
        int result = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &errorMesg);
        
        if (result == SQLITE_OK) {
            NSLog(@"添加数据成功");
        } else {
            NSLog(@"添加数据失败");
        }
    }

}


- (IBAction)sqlite3delete:(id)sender {
    
    char *errorMesg = NULL;
    NSString *sql = @"delete from t_person where age >= 0";
    int result = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &errorMesg);
    
    if (result == SQLITE_OK) {
        NSLog(@"删除成功");
    }else {
        NSLog(@"删除失败");
    }
    
}


- (IBAction)query:(id)sender {
    
    const char *sql = "select id, name, age from t_person;";  //"select id, name, age from t_person where age >= 50;"
    sqlite3_stmt *stmt = NULL;  //定义一个stmt存放结果集
    int result = sqlite3_prepare_v2(_db, sql, -1, &stmt, NULL); //检测SQL语句的合法性
    
    if (result == SQLITE_OK) {
        NSLog(@"查询语句合法");
        
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            int ID = sqlite3_column_int(stmt, 0);
            const unsigned char *sname = sqlite3_column_text(stmt, 1);
            NSString *name = [NSString stringWithUTF8String:(const char *)sname];
            int age = sqlite3_column_int(stmt, 2);
            
            NSLog(@"%d %@ %d",ID, name, age);
        }
    } else {
        NSLog(@"查询语句非法");
    }
}

- (IBAction)sqliteUpdate:(id)sender {
    
    
    NSString *sql = @"update t_person set name = '哈哈' where age > 60";
    char *errorMesg = NULL;
    int result = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &errorMesg);
    
    if (result == SQLITE_OK) {
        NSLog(@"更改成功");
    }else {
        NSLog(@"更改失败");
    }
    
}


@end
