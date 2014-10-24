//
//  CircularLinkedList.h
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 12/08/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FAQItem.h"

@interface CircularLinkedList : NSObject

@property FAQItem* current;
@property NSInteger size;
-(void)insertFAQItemWithName:(NSString*)name andDescription:(NSString*)andDescription;
-(FAQItem*)returnCurrentItem;
-(FAQItem*)returnNextItem;
-(FAQItem*)returnPrevItem;

@end
