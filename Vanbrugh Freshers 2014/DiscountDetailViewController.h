//
//  DiscountDetailViewController.h
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 24/10/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscountDetailViewController : UIViewController

@property NSArray *discountDetails;
@property (strong, nonatomic) IBOutlet UIButton *closeButton;
@property (strong, nonatomic) IBOutlet UILabel *discountLabel;

@end
