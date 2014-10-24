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
@property (strong, nonatomic) IBOutlet UILabel *moveInLabel;
@property (strong, nonatomic) IBOutlet UILabel *headStycTitleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *headStyc1img;
@property (strong, nonatomic) IBOutlet UILabel *headStyc1txt;
@property (strong, nonatomic) IBOutlet UIImageView *headStyc2img;
@property (strong, nonatomic) IBOutlet UILabel *headStyc2txt;
@property (strong, nonatomic) IBOutlet UILabel *alternativeHeadStycTitleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *alternativeHeadStyc1img;
@property (strong, nonatomic) IBOutlet UILabel *alternativeHeadStyc1txt;
@property (strong, nonatomic) IBOutlet UIImageView *alternativeHeadStyc2img;
@property (strong, nonatomic) IBOutlet UILabel *alternativeHeadStyc2txt;

@property (strong, nonatomic) IBOutlet UIButton *getDirectionsButton;
@property (strong, nonatomic) IBOutlet UIButton *changeBlockButton;

@property NSString *blockName;

@end
