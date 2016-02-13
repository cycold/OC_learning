//
//  main.m
//  类扩展
//
//  Created by icewater on 2/11/16.
//
//

/**
  类扩展,又称为类延展
 1、类的延展的概念
    延展类别又称为扩展(Extendsion)
    Extension是Category的一个特例
    其名字为匿名(为空),并且新添加的方法一定要予以实现。(Category没有这个限制)
 
```
 @interface MyClass ()
 {
    //类扩展 float value;
 }
 - (void)setValue:(float)newValue;
 @end
 
```
 
 这种写法的类别叫匿名分类,又叫类扩展,
 所谓的扩展,其实就是为一个类添加额外的原来没有的变量、方法或者合成属性。
 
 类扩展的作用：
    为本类扩充一些私有的成员变量和私有方法。
 
 延展的实现
 1）通过延展来实现方法的私有,延展的头文件独立。这种方法不能实现真正的方法私有,
    当在别的文件中引入延展的头文件,那么在这个文件中定义的类的对象就可以直接调用在延展中定义所谓私有的方法.
 
 2）第二种实现延展的方式是延展没有独立的头文件,在类的实现文件.m中声明和实现延展,
    这种方法可以很好的实现方法的私有,因为在OC中是不能引入.m的文件的。
 
 */


#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person_ext.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [[Person alloc] init];
        p.height = 178;
        p.weight = 65;
        
        p.age = 25;
        
        [p hello];
        
        [p sayAge];
    }
    return 0;
}
