//
//  CircularLinkedList.m
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 12/08/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import "CircularLinkedList.h"

@implementation CircularLinkedList

@synthesize current = _current;
@synthesize size = _size;

-(void)insertIntoList:(FAQItem*)newItem{
    if(self.current == nil){
        newItem.next = newItem;
        newItem.prev = newItem;
        self.current = newItem;
        self.size = 1;
    }
    else{
        newItem.next = self.current.next;
        newItem.prev = self.current;
        self.current.next = newItem;
        self.current.next.prev = newItem;
        self.current = newItem;
        self.size++;
    }
}

-(void)insertFAQItemWithName:(NSString*)name andDescription:(NSString*)text{
    FAQItem* newItem = [[FAQItem alloc] init];
    newItem.name = name;
    newItem.text = text;
    [self insertIntoList:newItem];
}

-(FAQItem*)returnCurrentItem{
    return self.current;
}

-(FAQItem*)returnNextItem{
    self.current = self.current.next;
    return self.current;
}
-(FAQItem*)returnPrevItem{
    self.current = self.current.prev;
    return self.current;
}
@end
