//
//  Book.h
//  OC_learning
//
//  Created by icewater on 2/13/16.
//
//

#import <Foundation/Foundation.h>

@class Author;

@interface Book : NSObject
{
@private
    NSString *_bookName;
    Author *_author;
    NSArray *_relativeBooks;
}

@end
