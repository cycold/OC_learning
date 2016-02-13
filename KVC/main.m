//
//  main.m
//  KVC
//
//  Created by icewater on 2/13/16.
//
//

/**
 KVC: Key Value Coding: 键值编码
 
 键值编码可以用来访问和设置对象的所有属性(包括私有属性),
 之前设置和访问对象属性: 通过getter和setter方法,或者共有属性直接通过->访问.
 现在有了键值编码(KVC)就增加了一种访问/设置对象属性的方式

 
 
 */



#import <Foundation/Foundation.h>
#import "Book.h"
#import "Author.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 书有一个私有属性_name
        Book *b = [[Book alloc] init];
        
        // 现在可以使用KVC来设置值: 设置对象b中的name属性值为@"动物庄园"
        [b setValue:@"动物庄园" forKey:@"bookName"];
        
        /*
         设置值方法: setValue: forKey:
         参数1: 值
         参数2: 对象中的属性名
         
         此方法会优先查看对象是否有属性setter方法,有就直接调用属性setter方法赋值,
         没有,就查找对象是否有forKey指定的属性,这里是name属性,注意: 它会查找name属性,如果没有找到,会再次
         尝试查找带下划线的属性: _name,如果没有找到,编译时不会保错,运行时就会crash.
         
         如果设置的值基本数据类型(int, char, ...), 需要对数据进行对象化封装,也就是setValue只能设置对象类型的值
         */
        
        // 使用KVC获取对象属性值 查找方法如上
        NSLog(@"bookName: %@", [b valueForKey:@"bookName"]);
        
        // 指定路径设置值(路径: 其实可以指子对象中的属性)
        Author *author = [[Author alloc] init];
        
        // 为书指定一个作者
        [b setValue:author forKey:@"author"];
        NSLog(@"author: %@", [b valueForKey:@"author"]);
        
        // 为书指定一个作者姓名 这里其实是设置b对象中author字段中name属性, 条件: author一定要是b对象属性
        [b setValue:@"Bill" forKeyPath:@"author.name"];
        NSLog(@"author: %@", [b valueForKey:@"author"]);
        NSLog(@"author.name %@", [b valueForKeyPath:@"author.name"]);
        
        /**
         体会到间接操作对象的感觉了. 以上是通过b对象,间接操作了author对象
         */
        
        // 一对多的访问
        Book *book = [[Book alloc] init];
        
        Book *book1 = [[Book alloc] init];
        [book1 setValue:@"bookName - 1" forKey:@"bookName"];
        Book *book2 = [[Book alloc] init];
        [book2 setValue:@"bookName - 2" forKey:@"bookName"];
        Book *book3 = [[Book alloc] init];
        [book3 setValue:@"bookName - 3" forKey:@"bookName"];
        
        NSArray *bookArray = @[book1, book2, book3];
        
        // 这里设置的是一个数组, 此时会返回每一个数组中有这个属性relativeBooks的对象
        // 将数组bookArray 设置到此对象book中的属性relativeBooks中
        [book setValue:bookArray forKey:@"relativeBooks"];
        
        // 拿到数组中每个对象属性bookName,返回值为一个数组
        NSLog(@"----%@", [book valueForKeyPath:@"relativeBooks.bookName"]);
        
        // 直接拿属性 这种用法很爽
        NSArray *a = [bookArray valueForKey:@"bookName"];
        NSLog(@">>>%@", a);
        
        
    }
    return 0;
}
