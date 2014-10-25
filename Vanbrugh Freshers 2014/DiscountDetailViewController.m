//
//  DiscountDetailViewController.m
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 24/10/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import "DiscountDetailViewController.h"

@interface DiscountDetailViewController ()

@end

@implementation DiscountDetailViewController

@synthesize discountDetails = _discountDetails;
@synthesize discountLabel = _discountLabel;
@synthesize closeButton = _closeButton;
@synthesize timeLabel = _timeLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.discountLabel.text = [self.discountDetails objectAtIndex:1];
    self.discountLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.closeButton.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.timeLabel.font = [UIFont fontWithName:@"Cantarell" size:12];
    [self showTime];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showTime) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view.
}
-(void)showTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd\t\tHH:mm:ss zzz"];
    [formatter setTimeZone: [NSTimeZone timeZoneWithName:@"Europe/London"]];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
    NSString *timeString = [formatter stringFromDate:[NSDate date]];
    self.timeLabel.text = timeString;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"toDiscountsTab"]){
        UITabBarController *destViewController = segue.destinationViewController;
        [destViewController setSelectedIndex:2];
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
