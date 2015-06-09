//
//  SOSViewController.h
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 09/07/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SafariServices/SafariServices.h>

@interface SOSViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *securityEmergency;
@property (strong, nonatomic) IBOutlet UIButton *securityNonEmergency;
@property (strong, nonatomic) IBOutlet UIButton *streamlineTaxis;
@property (strong, nonatomic) IBOutlet UIButton *yorkNightline;
@property (strong, nonatomic) IBOutlet UIButton *vanbrughWebsite;
@property (strong, nonatomic) IBOutlet UIButton *welfareMobile;
@property (strong, nonatomic) IBOutlet UIButton *UoYBuses;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;


@end
