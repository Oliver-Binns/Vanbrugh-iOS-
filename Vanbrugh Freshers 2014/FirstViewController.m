//
//  FirstViewController.m
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 09/06/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import "FirstViewController.h"
#import "Event.h"

@interface FirstViewController ()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@implementation FirstViewController

@synthesize blockImage = _blockImage;
@synthesize blockNameLabel = _blockNameLabel;
@synthesize faqButton = _faqButton;
@synthesize getDirectionsButton = _getDirectionsButton;
@synthesize changeBlockButton = _changeBlockButton;
@synthesize scrollView = _scrollView;
@synthesize contentView = _contentView;
@synthesize faqImage = _faqImage;

@synthesize blockName = _blockName;

-(BOOL)hasFourInchDisplay{
    return ([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568.0);
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.scrollView layoutIfNeeded];
    self.scrollView.contentSize = self.contentView.bounds.size;
	/*CGRect scrollFrame;
	scrollFrame.origin = self.scrollView.frame.origin;
     scrollFrame.size = self.scrollView.frame.size;
    //scrollFrame.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
	self.scrollView.frame = scrollFrame;*/
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.scrollView setShowsVerticalScrollIndicator:NO];
    //Opens the user's settings of the App, and
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger object = [defaults integerForKey:@"appOpens"];
    if(object > 0 && object % 5 == 0){
        //Show alert on 5th App Open?
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Vanbrugh Freshers"
                                                       message: @"Have you found the Vanbrugh\nFreshers App useful?\n\nPlease let us know what you think!"
                                                      delegate: self
                                             cancelButtonTitle:@"No"
                                             otherButtonTitles:@"Yes",@"Later", nil];



        [alert show];
    }
    if(object!= -1){
        [defaults setInteger:(object+1) forKey:@"appOpens"];
        [defaults synchronize];
    }
    
    //Sets the tint colour of the tab bar to Vanbrugh Purple!
    [[UITabBar appearance] setTintColor: [UIColor colorWithRed:(93/255.0) green:(42/255.0) blue:(101/255.0) alpha:1]];
    //Sets the nav bar content to white!
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //Sets the font of all the labels on this View Controller to Cantarell, Size 18
    self.blockNameLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.getDirectionsButton.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
	self.faqImage.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:35];
    self.changeBlockButton.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.faqButton.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    
    //reads what the block name is currently set to.
    self.blockName = [defaults stringForKey:@"block"];
	self.blockNameLabel.backgroundColor = [UIColor colorWithRed:(0) green:(0) blue:(0) alpha:0.6];
    [self.blockNameLabel setText:[NSString stringWithFormat:@"%@", self.blockName]];
    
    //The next lines, set the other labels accordingly
    if([self.blockName isEqualToString:@"Barbara Scott Court Block E"]){
		self.blockImage.image = [UIImage imageNamed:@"BarbaraScott.png"];
    }
    else if([self.blockName isEqualToString:@"Barbara Scott Court Block F"]){
		self.blockImage.image = [UIImage imageNamed:@"BarbaraScott.png"];
    }
    else if([self.blockName isEqualToString:@"Donald Barron Court Block B"]){
		self.blockImage.image = [UIImage imageNamed:@"DonaldBarron.png"];
    }
    else if([self.blockName isEqualToString:@"Donald Barron Court Block C"]){
		self.blockImage.image = [UIImage imageNamed:@"DonaldBarron.png"];
    }
    else if([self.blockName isEqualToString:@"Eric Milner White Court Block A"]){
		self.blockImage.image = [UIImage imageNamed:@"EricMilner.jpg"];
    }
    else if([self.blockName isEqualToString:@"Eric Milner White Court Block B"]){
		self.blockImage.image = [UIImage imageNamed:@"EricMilner.jpg"];
    }
    else if([self.blockName isEqualToString:@"Fairfax House"]){
		self.blockImage.image = [UIImage imageNamed:@"FairfaxHouse.png"];
    }
    else if([self.blockName isEqualToString:@"Le Page Court"]){
		self.blockImage.image = [UIImage imageNamed:@"LePage.png"];
    }
	else if([self.blockName isEqualToString:@"Off Campus"]){
		self.blockImage.image = [UIImage imageNamed:@"offcampus"];
	}
	else if([self.blockName isEqualToString:@"Second/Third Year"]){
		self.blockImage.image = [UIImage imageNamed:@"offcampus"];
		/*[self.moveInLabel setText:[NSString stringWithFormat:@"See you when you get here!"]];
		[self.headStyc1img setHidden:YES];
		[self.headStyc1txt setHidden:YES];
		[self.headStyc2img setHidden:YES];
		[self.headStyc2txt setHidden:YES];
		UIImageView *comingSoon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 182, 320, 445)];
		comingSoon.image = [UIImage imageNamed:@"ComingSoon.jpg"];
		[self.contentView addSubview:comingSoon];*/
	}
}

- (IBAction)getDirections:(id)sender { //Opens Google Maps for directions to block if button is pressed
    Event *directions = [[Event alloc] init];
    if([self.blockName rangeOfString:@"Barbara Scott Court"].location != NSNotFound){
        [directions setLocation:@"Barbara Scott Court"];
    }
    else if([self.blockName rangeOfString:@"Donald Barron"].location != NSNotFound){
        [directions setLocation:@"Donald Barron Court"];
    }
    else if([self.blockName rangeOfString:@"Eric"].location != NSNotFound){
        [directions setLocation:@"Eric Milner White Court"];
    }
    else if([self.blockName rangeOfString:@"Off Campus"].location != NSNotFound){
        [directions setLocation:@"York City Centre"];
    }
    else if([self.blockName rangeOfString:@"STYC"].location != NSNotFound){
        [directions setLocation:@"York City Centre"];
    }
    else if([self.blockName rangeOfString:@"Second/Third Year"].location != NSNotFound){
        [directions setLocation:@"York City Centre"];
    }
    else{
        [directions setLocation:self.blockName];
    }
    //NSString* mapsDirections = [self.blockName stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    NSString* mapsDirections = [NSString stringWithFormat:@"%f,%f", directions.getCoordinates.latitude, directions.getCoordinates.longitude];
    
    if([[UIApplication sharedApplication] canOpenURL: //Check if Google Maps is installed
        [NSURL URLWithString:@"comgooglemaps://"]]){
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"comgooglemaps://?saddr=&daddr=" stringByAppendingString:mapsDirections]]];
    }
    else{ //if Google Maps is not installed- redirect to App Store!
        NSString *stringURL = @"https://itunes.apple.com/gb/app/google-maps/id585027354?mt=8";
        NSURL *url = [NSURL URLWithString:stringURL];
        [[UIApplication sharedApplication] openURL:url];
    }
    /*else{ //if Google Maps is not installed- redirect to browser
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"http://maps.google.com/maps?daddr=" stringByAppendingString:mapsDirections]]];
    }*/
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:(-1) forKey:@"appOpens"];
        [defaults synchronize];
    }
    else if(buttonIndex == 1)
    {   //Sends user to review the app!
        //NSString *stringUrl = @"itms-apps://itunes.apple.com/app/idAPP_ID";
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:mail@oliverbinns.info"]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/vanbrugh-jcr/id906717788?ls=1&mt=8"]];
        //NSURL *url = [NSURL URLWithString:stringUrl];
        //[[UIApplication sharedApplication] openURL:url];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton*)sender{
    if([sender.titleLabel.text isEqualToString:@"Change Block"]){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:nil forKey:@"block"];
        [defaults synchronize];
    }
}

@end
