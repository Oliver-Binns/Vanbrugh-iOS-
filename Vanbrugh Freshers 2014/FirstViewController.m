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
@synthesize newsLabel = _newsLabel;
@synthesize blockRepsLabel = _blockRepsLabel;
@synthesize blockRep1Img = _blockRep1Img;
@synthesize blockRep1Txt = _blockRep1Txt;
@synthesize blockRep2Img = _blockRep2Img;
@synthesize blockRep2Txt = _blockRep2Txt;
@synthesize blockRepView = _blockRepView;

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
    self.newsLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    [self newsLabelUpdate];
    self.blockRepsLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    [self newsLabelUpdate];
    self.blockRep1Txt.font = [UIFont fontWithName:@"Cantarell" size:18];
    [self newsLabelUpdate];
    self.blockRep2Txt.font = [UIFont fontWithName:@"Cantarell" size:18];
    [self newsLabelUpdate];
    self.faqButton.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    
    //reads what the block name is currently set to.
    self.blockName = [defaults stringForKey:@"block"];
	self.blockNameLabel.backgroundColor = [UIColor colorWithRed:(0) green:(0) blue:(0) alpha:0.6];
    [self.blockNameLabel setText:[NSString stringWithFormat:@"%@", self.blockName]];
    
    //The next lines, set the other labels accordingly
    if([self.blockName isEqualToString:@"Barbara Scott Court Block E"]){
		self.blockImage.image = [UIImage imageNamed:@"BarbaraScott.png"];
        self.blockRep1Txt.text = @"Alex Light";
        self.blockRep1Img.image = [UIImage imageNamed:@"Alex Light"];
        self.blockRep2Txt.text = @"Toby Churchley";
        self.blockRep2Img.image = [UIImage imageNamed:@"Toby Churchley"];
    }
    else if([self.blockName isEqualToString:@"Barbara Scott Court Block F"]){
		self.blockImage.image = [UIImage imageNamed:@"BarbaraScott.png"];
        self.blockRep1Txt.text = @"Alex Light";
        self.blockRep1Img.image = [UIImage imageNamed:@"Alex Light"];
        self.blockRep2Txt.text = @"Toby Churchley";
        self.blockRep2Img.image = [UIImage imageNamed:@"Toby Churchley"];
    }
    else if([self.blockName isEqualToString:@"Donald Barron Court Block B"]){
		self.blockImage.image = [UIImage imageNamed:@"DonaldBarron.png"];
        self.blockRep1Txt.text = @"Alex Light";
        self.blockRep1Img.image = [UIImage imageNamed:@"Alex Light"];
        self.blockRep2Txt.text = @"Toby Churchley";
        self.blockRep2Img.image = [UIImage imageNamed:@"Toby Churchley"];
    }
    else if([self.blockName isEqualToString:@"Donald Barron Court Block C"]){
		self.blockImage.image = [UIImage imageNamed:@"DonaldBarron.png"];
        self.blockRep1Txt.text = @"Alex Light";
        self.blockRep1Img.image = [UIImage imageNamed:@"Alex Light"];
        self.blockRep2Txt.text = @"Toby Churchley";
        self.blockRep2Img.image = [UIImage imageNamed:@"Toby Churchley"];
    }
    else if([self.blockName isEqualToString:@"Eric Milner White Court Block A"]){
		self.blockImage.image = [UIImage imageNamed:@"EricMilner.jpg"];
        self.blockRep1Txt.text = @"Alice Strawbridge";
        self.blockRep1Img.image = [UIImage imageNamed:@"Alice Strawbridge"];
        self.blockRep2Txt.text = @"Hamish Dudgeon";
        self.blockRep2Img.image = [UIImage imageNamed:@"Hamish Dudgeon"];
    }
    else if([self.blockName isEqualToString:@"Eric Milner White Court Block B"]){
		self.blockImage.image = [UIImage imageNamed:@"EricMilner.jpg"];
        self.blockRep1Txt.text = @"Alice Strawbridge";
        self.blockRep1Img.image = [UIImage imageNamed:@"Alice Strawbridge"];
        self.blockRep2Txt.text = @"Hamish Dudgeon";
        self.blockRep2Img.image = [UIImage imageNamed:@"Hamish Dudgeon"];
    }
    else if([self.blockName isEqualToString:@"Fairfax House"]){
		self.blockImage.image = [UIImage imageNamed:@"FairfaxHouse.png"];
        self.blockRep1Txt.text = @"Abigail Creak";
        self.blockRep1Img.image = [UIImage imageNamed:@"Abigail Creak"];
        self.blockRep2Txt.text = @"David Waters";
        self.blockRep2Img.image = [UIImage imageNamed:@"David Waters"];
    }
    else if([self.blockName isEqualToString:@"Le Page Court"]){
		self.blockImage.image = [UIImage imageNamed:@"LePage.png"];
        self.blockRep1Txt.text = @"Amie Nevin";
        self.blockRep1Img.image = [UIImage imageNamed:@"Amie Nevin"];
        
        //ONLY ONE BLOCK REP, Layout in centre of view.
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.blockRep1Img attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        //Calculate width of image- view minus margins / 2.
        NSInteger imageWidth = (self.view.frame.size.width - 80) / 2;
        
        //make the image equal to this width
        [self.blockRep1Img addConstraint:[NSLayoutConstraint constraintWithItem:self.blockRep1Img attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.blockRep1Img attribute:NSLayoutAttributeHeight multiplier:0 constant:imageWidth]];
        [self.blockRep1Img addConstraint:[NSLayoutConstraint constraintWithItem:self.blockRep1Img attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.blockRep1Img attribute:NSLayoutAttributeWidth multiplier:0 constant:imageWidth]];
        
        //Hide the other label and image.
        self.blockRep2Img.hidden = YES;
        self.blockRep2Txt.hidden = YES;
    }
	else if([self.blockName isEqualToString:@"Off Campus"]){
		self.blockImage.image = [UIImage imageNamed:@"offcampus"];
        self.blockRepsLabel.text = @"Your Off-Campus Rep:";
        self.blockRep1Txt.text = @"Adrian Horan";
        self.blockRep1Img.image = [UIImage imageNamed:@"Adrian Horan"];
        
        //ONLY ONE BLOCK REP, Layout in centre of view.
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.blockRep1Img attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        //Calculate width of image- view minus margins / 2.
        NSInteger imageWidth = (self.view.frame.size.width - 80) / 2;
        
        //make the image equal to this width
        [self.blockRep1Img addConstraint:[NSLayoutConstraint constraintWithItem:self.blockRep1Img attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.blockRep1Img attribute:NSLayoutAttributeHeight multiplier:0 constant:imageWidth]];
        [self.blockRep1Img addConstraint:[NSLayoutConstraint constraintWithItem:self.blockRep1Img attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.blockRep1Img attribute:NSLayoutAttributeWidth multiplier:0 constant:imageWidth]];
        
        //Hide the other label and image.
        self.blockRep2Img.hidden = YES;
        self.blockRep2Txt.hidden = YES;
	}
	else if([self.blockName isEqualToString:@"Second/Third Year"]){
		self.blockImage.image = [UIImage imageNamed:@"offcampus"];
        self.blockRepsLabel.hidden = YES;
        self.blockRep1Img.hidden = YES;
        self.blockRep1Txt.hidden = YES;
        self.blockRep2Img.hidden = YES;
        self.blockRep2Txt.hidden = YES;
        self.blockRepView.hidden = YES;
	}
}
-(void)newsLabelUpdate{
    self.newsLabel.text = @"Welcome to the new Vanbrugh College app.\n\nYou can access information about all the upcoming events, Vanbrugh Discount scheme and even get quick access to important phone numbers and bus times.";
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
