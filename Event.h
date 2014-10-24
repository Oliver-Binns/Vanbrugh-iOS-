//
//  Event.h
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 26/06/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Event : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSDate *startTime;
@property (strong, nonatomic) NSDate *endTime;
@property (strong, nonatomic) NSString *descr;

-(CLLocationCoordinate2D)getCoordinates;

@end
