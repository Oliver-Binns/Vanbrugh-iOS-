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
@property (strong, nonatomic) IBOutlet UILabel *newsLabel;
@property (strong, nonatomic) IBOutlet UILabel *blockRepsLabel;
@property (strong, nonatomic) IBOutlet UIImageView *blockRep1Img;
@property (strong, nonatomic) IBOutlet UIImageView *blockRep2Img;
@property (strong, nonatomic) IBOutlet UILabel *blockRep1Txt;
@property (strong, nonatomic) IBOutlet UILabel *blockRep2Txt;
@property (strong, nonatomic) IBOutlet UIView *blockRepView;


@property NSString *blockName;

@end
