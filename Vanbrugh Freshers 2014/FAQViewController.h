//
//  FAQViewController.h
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 12/08/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FAQViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *faqTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *faqTextLabel;
@property (strong, nonatomic) IBOutlet UIButton *prevButton;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
//@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeRight;
@property (strong, nonatomic) IBOutlet UIImageView *prevImage;
//@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeLeft;
@property (strong, nonatomic) IBOutlet UIImageView *nextImage;
-(IBAction)swipeRight:(UISwipeGestureRecognizer *)sender;
-(IBAction)swipeLeft:(UISwipeGestureRecognizer *)sender;

@end
