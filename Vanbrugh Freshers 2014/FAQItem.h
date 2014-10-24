//
//  FAQItem.h
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 12/08/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FAQItem : NSObject

@property NSString* name;
@property NSString* text;
@property FAQItem* next;
@property FAQItem* prev;

@end
