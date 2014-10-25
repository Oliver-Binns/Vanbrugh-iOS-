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
@synthesize UoYBuses = _UoYBuses;
@synthesize scrollView = _scrollView;
@synthesize contentView = _contentView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.securityEmergency.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.securityNonEmergency.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.streamlineTaxis.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.yorkNightline.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.vanbrughWebsite.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.welfareMobile.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.UoYBuses.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    // Do any additional setup after loading the view.
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.scrollView layoutIfNeeded];
    self.scrollView.contentSize = self.contentView.bounds.size;
}

- (IBAction)callEmergency:(id)sender {
    UIDevice *device = [UIDevice currentDevice];
    UIAlertView *alert;
	
    if ([[device model] isEqualToString:@"iPhone"] ) {
        alert =[[UIAlertView alloc] initWithTitle:@"Security (Emergency)" message:@"Your phone carrier may charge you for this call if it is not within your agreed allowance. Do you wish to proceed?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"OK", nil];
    }
    else {//iPad, iPod
        alert =[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"You can't make a call from your current device.\n\nPlease use an iPhone to call Campus Security on 0044 (0) 800 433333." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    }
	[alert show];
}
- (IBAction)callSecurity:(id)sender {
    UIDevice *device = [UIDevice currentDevice];
    UIAlertView *alert;
	
    if ([[device model] isEqualToString:@"iPhone"] ) {
        alert =[[UIAlertView alloc] initWithTitle:@"Security" message:@"Your phone carrier may charge you for this call if it is not within your agreed allowance. Do you wish to proceed?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"OK", nil];
    }
    else {//iPad, iPod
        alert =[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"You can't make a call from your current device.\n\nPlease use an iPhone to call Campus Security on 0044 (0) 1904 324444." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		
    }
	[alert show];
}
- (IBAction)callTaxi:(id)sender {
    UIDevice *device = [UIDevice currentDevice];
    UIAlertView *alert;
    if ([[device model] isEqualToString:@"iPhone"] ) {
        alert =[[UIAlertView alloc] initWithTitle:@"Streamline Taxis" message:@"Your phone carrier may charge you for this call if it is not within your agreed allowance. Do you wish to proceed?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"OK", nil];
    }
    else {//iPad, iPod
        alert =[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"You can't make a call from your current device.\n\nPlease use an iPhone to call Streamline Taxis on 0044 (0) 1904 656565." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    }
	[alert show];
}
- (IBAction)callWelfare:(id)sender {
    UIDevice *device = [UIDevice currentDevice];
    UIAlertView *alert;
    if ([[device model] isEqualToString:@"iPhone"] ) {
		alert =[[UIAlertView alloc] initWithTitle:@"Welfare Tutor Mobile" message:@"Your phone carrier may charge you for this call if it is not within your agreed allowance. Do you wish to proceed?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"OK", nil];
    }
    else {//iPad, iPod
        alert =[[UIAlertView alloc] initWithTitle:@"Sorry!" message:[NSString stringWithFormat:@"You can't make a call from your current device.\n\nPlease use an iPhone to call the Welfare Tutor Mobile on +44 7919 293078."] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		
    }
	[alert show];
}
- (IBAction)callNightline:(id)sender {
    UIDevice *device = [UIDevice currentDevice];
    UIAlertView *alert;
    
    if ([[device model] isEqualToString:@"iPhone"] ) {
        alert =[[UIAlertView alloc] initWithTitle:@"York Nightline" message:@"Your phone carrier may charge you for this call if it is not within your agreed allowance. Do you wish to proceed?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"OK", nil];
    }
    else {//iPad, iPod
        alert =[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"You can't make a call from your current device.\n\nPlease use an iPhone to call Nightline on 0044 (0) 1904 323735." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    }
	[alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0)
	{
	}
	else if(buttonIndex == 1)
	{
		NSString *cellNameStr;
		if ([alertView.title isEqualToString:@"Security (Emergency)"]) {
			cellNameStr = @"0044800433333";
		}
		if ([alertView.title isEqualToString:@"Security"]) {
			cellNameStr = @"00441904324444";
		}
		else if([alertView.title isEqualToString:@"Streamline Taxis"]){
			cellNameStr = @"00441904656565";
		}
		else if([alertView.title isEqualToString:@"Welfare Tutor Mobile"]){
			cellNameStr = @"00447919293078";
		}
		else if([alertView.title isEqualToString:@"York Nightline"]){
			cellNameStr = @"00441904323735";
		}
		NSString *phoneNumber = [@"tel://" stringByAppendingString:cellNameStr];
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
	}
}

- (IBAction)goToBuses:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://UOYB.us"]];
    
}
- (IBAction)gotoWebsite:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.vanbrugh-college.co.uk"]];
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
