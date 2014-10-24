//
//  FirstViewController.h
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 09/06/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *blockImage;
@property (strong, nonatomic) IBOutlet UILabel *blockNameLabel;
@property (strong, nonatomic) IBOutlet UIButton *getDirectionsButton;
@property (strong, nonatomic) IBOutlet UIButton *changeBlockButton;
@property (strong, nonatomic) IBOutlet UIButton *faqButton;
@property (strong, nonatomic) IBOutlet UIButton *faqImage;


@property NSString *blockName;

@end
