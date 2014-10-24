//
//  FirstViewController.m
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 09/06/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@implementation FirstViewController

@synthesize blockImage = _blockImage;
@synthesize blockNameLabel = _blockNameLabel;
@synthesize moveInLabel = _moveInLabel;
@synthesize headStycTitleLabel = _headStycTitleLabel;
@synthesize headStyc1img = _headStyc1img;
@synthesize headStyc1txt = _headStyc1txt;
@synthesize headStyc2img = _headStyc2img;
@synthesize headStyc2txt = _headStyc2txt;
@synthesize alternativeHeadStycTitleLabel = _alternativeHeadStycTitleLabel;
@synthesize alternativeHeadStyc1img = _alternativeHeadStyc1img;
@synthesize alternativeHeadStyc1txt = _alternativeHeadStyc1txt;
@synthesize alternativeHeadStyc2img = _alternativeHeadStyc2img;
@synthesize alternativeHeadStyc2txt = _alternativeHeadStyc2txt;
@synthesize getDirectionsButton = _getDirectionsButton;
@synthesize changeBlockButton = _changeBlockButton;
@synthesize scrollView = _scrollView;
@synthesize contentView = _contentView;

@synthesize blockName = _blockName;

-(BOOL)hasFourInchDisplay{
    return ([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568.0);
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.scrollView layoutIfNeeded];
    self.scrollView.contentSize = self.contentView.bounds.size;
    if([self hasFourInchDisplay]){
        CGRect scrollFrame;
        scrollFrame.origin = self.scrollView.frame.origin;
        scrollFrame.size = CGSizeMake(320, 449
                                      );
        self.scrollView.frame = scrollFrame;
    }
    else{
        CGRect scrollFrame;
        scrollFrame.origin = self.scrollView.frame.origin;
        scrollFrame.size = CGSizeMake(320, 361);
        self.scrollView.frame = scrollFrame;
    }
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
    self.moveInLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.headStycTitleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.headStyc1txt.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.headStyc2txt.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.getDirectionsButton.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.changeBlockButton.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    
    //reads what the block name is currently set to.
    self.blockName = [defaults stringForKey:@"block"];
	self.blockNameLabel.backgroundColor = [UIColor colorWithRed:(0) green:(0) blue:(0) alpha:0.6];
    [self.blockNameLabel setText:[NSString stringWithFormat:@"%@", self.blockName]];
    
    //The next lines, set the other labels accordingly
    if([self.blockName isEqualToString:@"Barbara Scott Court Block E"]){
		self.blockImage.image = [UIImage imageNamed:@"BarbaraScott.png"];
        [self.moveInLabel setText:[NSString stringWithFormat:@"Your move in date is\nSeptember 27th."]];
        [self.headStyc1txt setText:@"Victoria Bettney"];
        [self.headStyc1img setHidden:NO];
        [self.headStyc2txt setText:@""];
        [self.headStyc2img setHidden:YES];
    }
    else if([self.blockName isEqualToString:@"Barbara Scott Court Block F"]){
		self.blockImage.image = [UIImage imageNamed:@"BarbaraScott.png"];
        [self.moveInLabel setText:[NSString stringWithFormat:@"Your move in date is\nSeptember 27th."]];
        [self.headStyc1txt setText:@"Ben Lau"];
        [self.headStyc1img setHidden:NO];
        [self.headStyc2txt setText:@""];
        [self.headStyc2img setHidden:YES];
    }
    else if([self.blockName isEqualToString:@"Donald Barron Court Block B"]){
		self.blockImage.image = [UIImage imageNamed:@"DonaldBarron.png"];
        [self.moveInLabel setText:[NSString stringWithFormat:@"Your move in date is\nSeptember 27th."]];
        [self.headStyc1txt setText:@"Alex Stevenson"];
        [self.headStyc1img setHidden:NO];
        [self.headStyc2txt setText:@""];
        [self.headStyc2img setHidden:YES];
    }
    else if([self.blockName isEqualToString:@"Donald Barron Court Block C"]){
		self.blockImage.image = [UIImage imageNamed:@"DonaldBarron.png"];
        [self.moveInLabel setText:[NSString stringWithFormat:@"Your move in date is\nSeptember 27th."]];
        [self.headStyc1txt setText:@"Sarah Stanley"];
        [self.headStyc1img setHidden:NO];
        [self.headStyc2txt setText:@""];
        [self.headStyc2img setHidden:YES];
    }
    else if([self.blockName isEqualToString:@"Eric Milner White Court Block A"]){
		self.blockImage.image = [UIImage imageNamed:@"EricMilner.png"];
        [self.moveInLabel setText:[NSString stringWithFormat:@"Your move in date is\nSeptember 28th."]];
        [self.headStyc1txt setText:@"Hamish Dudgeon"];
		self.headStyc1img.image = [UIImage imageNamed:@"HamishDudgeon-EricA.png"];
        [self.headStyc1img setHidden:NO];
        [self.headStyc2txt setText:@"Rebecca Nelson"];
        [self.headStyc2img setHidden:NO];
    }
    else if([self.blockName isEqualToString:@"Eric Milner White Court Block B"]){
		self.blockImage.image = [UIImage imageNamed:@"EricMilner.png"];
        [self.moveInLabel setText:[NSString stringWithFormat:@"Your move in date is\nSeptember 28th."]];
        [self.headStyc1txt setText:@"Adam Mitchell"];
		self.headStyc1img.image = [UIImage imageNamed:@"AdamMitchell-EricB.png"];
        [self.headStyc1img setHidden:NO];
        [self.headStyc2txt setText:@""];
        [self.headStyc2img setHidden:YES];
    }
    else if([self.blockName isEqualToString:@"Fairfax House"]){
		self.blockImage.image = [UIImage imageNamed:@"FairfaxHouse.png"];
        [self.moveInLabel setText:[NSString stringWithFormat:@"Your move in date is\nSeptember 27th."]];
        [self.headStyc1txt setText:@"Alex Robertson"];
		self.headStyc1img.image = [UIImage imageNamed:@"AlexRobertson-Fairfax.png.png"];
        [self.headStyc2txt setText:@"James Gillie"];
    }
    else if([self.blockName isEqualToString:@"Le Page Court"]){
		self.blockImage.image = [UIImage imageNamed:@"LePageCourt.png"];
        [self.moveInLabel setText:[NSString stringWithFormat:@"Your move in date is\nSeptember 28th."]];
        [self.headStyc1txt setText:@"Millie Beach"];
        [self.headStyc1img setHidden:NO];
        [self.headStyc2txt setText:@"Jack Mehmet"];
        [self.headStyc2img setHidden:NO];
    }
	else if([self.blockName isEqualToString:@"Off Campus"]){
		self.blockImage.image = [UIImage imageNamed:@"OffCampus.png"];
		[self.moveInLabel setText:[NSString stringWithFormat:@"See you when you get here!"]];
		[self.headStyc1txt setText:@"Adrian Horan"];
		[self.headStyc2txt setHidden:YES];
	}
	else if([self.blockName isEqualToString:@"STYC"]){
		self.blockImage.image = [UIImage imageNamed:@"OffCampus.png"];
		[self.moveInLabel setText:[NSString stringWithFormat:@"STYC Training begins\nSeptember 26th"]];
	}
	else if([self.blockName isEqualToString:@"Second/Third Year"]){
		self.blockImage.image = [UIImage imageNamed:@"OffCampus.png"];
		[self.moveInLabel setText:[NSString stringWithFormat:@"See you when you get here!"]];
		[self.headStyc1img setHidden:YES];
		[self.headStyc1txt setHidden:YES];
		[self.headStyc2img setHidden:YES];
		[self.headStyc2txt setHidden:YES];
		UIImageView *comingSoon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 182, 320, 445)];
		comingSoon.backgroundColor = [UIColor colorWithRed:(93/255) green:(42/255) blue:(101/255) alpha:1];
		[self.contentView addSubview:comingSoon];
	}
	
	self.alternativeHeadStycTitleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
	self.alternativeHeadStyc1txt.font = [UIFont fontWithName:@"Cantarell" size:18];
	self.alternativeHeadStyc2txt.font = [UIFont fontWithName:@"Cantarell" size:18];
	self.alternativeHeadStyc1txt.text = @"Abby Neal";
	self.alternativeHeadStyc1img.image = [UIImage imageNamed:@"AbbyNeal-Alternative.png"];
	self.alternativeHeadStyc2txt.text = @"Yi Jing Kong";
}

- (IBAction)getDirections:(id)sender { //Opens Google Maps for directions to block if button is pressed
    if([[UIApplication sharedApplication] canOpenURL: //Check if Google Maps is installed
        [NSURL URLWithString:@"comgooglemaps://"]]){
        NSString* mapsDirections = [self.blockName stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        mapsDirections = [mapsDirections stringByAppendingString: @",+University+of+York,+York,+United+Kingdom"];
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"comgooglemaps://?daddr=" stringByAppendingString:mapsDirections]]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"comgooglemaps://?daddr=" stringByAppendingString:mapsDirections]]];
    }
    else{ //if Google Maps is not installed- redirect to App Store!
        NSString *stringURL = @"https://itunes.apple.com/gb/app/google-maps/id585027354?mt=8";
        NSURL *url = [NSURL URLWithString:stringURL];
        [[UIApplication sharedApplication] openURL:url];
    }
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
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:mail@oliverbinns.info"]];
        //NSURL *url = [NSURL URLWithString:stringUrl];
        //[[UIApplication sharedApplication] openURL:url];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:nil forKey:@"block"];
    [defaults synchronize];
}

@end
