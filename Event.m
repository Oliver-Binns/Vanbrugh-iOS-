//
//  Event.m
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 26/06/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import "Event.h"

@implementation Event

@synthesize name = _name;
@synthesize location = _location;
@synthesize image = _image;
@synthesize startTime = _startTime;
@synthesize endTime = _endTime;
@synthesize descr = _descr;

- (NSString *)description {
    return [NSString stringWithFormat: @"Name: %@", self.name];
}
-(CLLocationCoordinate2D)getCoordinates{
    if([self.location isEqualToString:@"Barbara Scott Court"]){
        return CLLocationCoordinate2DMake(53.949208, -1.058292);
    }
    else if([self.location isEqualToString:@"Central Hall"]){
        return CLLocationCoordinate2DMake(53.947011, -1.052798);
    }
    else if([self.location isEqualToString:@"City Screen"]){
        return CLLocationCoordinate2DMake(53.959189, -1.084699);
    }
    else if([self.location isEqualToString:@"Donald Barron Court"]){
        return CLLocationCoordinate2DMake(53.948965, -1.057461);
    }
    else if([self.location isEqualToString:@"Eric Milner White Court"]){
        return CLLocationCoordinate2DMake(53.946776, -1.055648);
    }
    else if([self.location isEqualToString:@"Fairfax House"]){
        return CLLocationCoordinate2DMake(53.951972, -1.066483);
    }
    else if([self.location isEqualToString:@"Kuda Nightclub"]){
        return CLLocationCoordinate2DMake(53.956829, -1.081870);
    }
    else if([self.location isEqualToString:@"Le Page Court"]){
        return CLLocationCoordinate2DMake(53.947841, -1.053963);
    }
    else if([self.location isEqualToString:@"Mansion Nightclub"]){
        return CLLocationCoordinate2DMake(53.957249, -1.087885);
    }
    else if([self.location isEqualToString:@"Roger Kirk Centre"]){
        return CLLocationCoordinate2DMake(53.945799, -1.055447);
    }
    else if([self.location isEqualToString:@"P/X/001"]){
        return CLLocationCoordinate2DMake(53.946079, -1.054229);
    }
    else if([self.location isEqualToString:@"Club Salvation"]){
        return CLLocationCoordinate2DMake(53.956829, -1.08187);
    }
    else if([self.location isEqualToString:@"The Lounge"]){
        return CLLocationCoordinate2DMake(53.945656, -1.055417);
    }
    else if([self.location isEqualToString:@"The Warren"]){
        return CLLocationCoordinate2DMake(53.948601, -1.054696);
    }
    else if([self.location isEqualToString:@"Tokyo Nightclub"]){
        return CLLocationCoordinate2DMake(53.957416, -1.089806);
    }
    else if([self.location isEqualToString:@"V Bar"]){
        return CLLocationCoordinate2DMake(53.947733, -1.054273);
    }
    else if([self.location isEqualToString:@"Vanbrugh Bowl"]){
        return CLLocationCoordinate2DMake(53.948024, -1.055455);
    }
    else if([self.location isEqualToString:@"Vanbrugh College"]){
        return CLLocationCoordinate2DMake(53.947769, -1.054119);
    }
    else if([self.location isEqualToString:@"Vanbrugh Dining Hall"]){
        return CLLocationCoordinate2DMake(53.947474, -1.054417);
    }
    else if([self.location isEqualToString:@"Vanbrugh JCR"]){
        return CLLocationCoordinate2DMake(53.947624, -1.054024);
    }
    else if([self.location isEqualToString:@"Vanbrugh Paradise"]){
        return CLLocationCoordinate2DMake(53.947362, -1.053666);
    }
    else if([self.location isEqualToString:@"V/044"]){
        return CLLocationCoordinate2DMake(53.947686, -1.053824);
    }
    else if([self.location isEqualToString:@"York City Centre"]){
        return CLLocationCoordinate2DMake(53.958367, -1.080565);
    }
	else{
		CLLocationCoordinate2D location;
		return location;
	}
    /*else{
        return CLLocationCoordinate2DMake(53.945533, -1.056167);
    }*/
}


@end
