//
//  SOSViewController.m
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 09/07/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import "SOSViewController.h"

@interface SOSViewController ()

@end

@implementation SOSViewController

@synthesize securityEmergency = _securityEmergency;
@synthesize securityNonEmergency = _securityNonEmergency;
@synthesize streamlineTaxis = _streamlineTaxis;
@synthesize yorkNightline = _yorkNightline;
@synthesize vanbrughWebsite = _vanbrughWebsite;
@synthesize welfareMobile = _welfareMobile;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.securityEmergency.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.securityNonEmergency.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.streamlineTaxis.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.yorkNightline.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.vanbrughWebsite.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.welfareMobile.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    // Do any additional setup after loading the view.
}
- (IBAction)callEmergency:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:0800433333"]];
}
- (IBAction)callSecurity:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:01904324444"]];
}
- (IBAction)callTaxi:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:01904656565"]];
}
- (IBAction)callNightline:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:01904323735"]];
}
- (IBAction)gotoWebsite:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.vanbrugh-college.co.uk"]];
}
- (IBAction)callWelfare:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:07919293078"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
