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
@synthesize refreshBusTimes = _refreshBusTimes;
@synthesize blockRepTopLine = _blockRepTopLine;
@synthesize changeBlockTopLine = _changeBlockTopLine;
@synthesize blockRepsView = _blockRepsView;
@synthesize styLabel = _styLabel;
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
    [self busLabelUpdate];
    self.blockRepsLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.blockRep1Txt.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.blockRep2Txt.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.faqButton.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    self.refreshBusTimes.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    
    //reads what the block name is currently set to.
    self.blockName = [defaults stringForKey:@"block"];
	self.blockNameLabel.backgroundColor = [UIColor colorWithRed:(0) green:(0) blue:(0) alpha:0.6];
    [self.blockNameLabel setText:[NSString stringWithFormat:@"%@", self.blockName]];
    
    //The next lines, set the other labels accordingly
    if([self.blockName isEqualToString:@"Barbara Scott Court Block E"]){
		self.blockImage.image = [UIImage imageNamed:@"BarbaraScott.png"];
        self.blockRep1Txt.text = @"Kajsa Arnlund";
        self.blockRep1Img.image = [UIImage imageNamed:@"Kajsa Arnlund"];
        self.blockRep2Txt.text = @"Rachel Terry";
        self.blockRep2Img.image = [UIImage imageNamed:@"Rachel Terry"];
    }
    else if([self.blockName isEqualToString:@"Barbara Scott Court Block F"]){
		self.blockImage.image = [UIImage imageNamed:@"BarbaraScott.png"];
		self.blockRep1Txt.text = @"Kajsa Arnlund";
		self.blockRep1Img.image = [UIImage imageNamed:@"Kajsa Arnlund"];
		self.blockRep2Txt.text = @"Rachel Terry";
		self.blockRep2Img.image = [UIImage imageNamed:@"Rachel Terry"];
    }
    else if([self.blockName isEqualToString:@"Donald Barron Court Block B"]){
		self.blockImage.image = [UIImage imageNamed:@"DonaldBarron.png"];
		self.blockRep1Txt.text = @"Kajsa Arnlund";
		self.blockRep1Img.image = [UIImage imageNamed:@"Kajsa Arnlund"];
		self.blockRep2Txt.text = @"Rachel Terry";
		self.blockRep2Img.image = [UIImage imageNamed:@"Rachel Terry"];
    }
    else if([self.blockName isEqualToString:@"Donald Barron Court Block C"]){
		self.blockImage.image = [UIImage imageNamed:@"DonaldBarron.png"];
		self.blockRep1Txt.text = @"Kajsa Arnlund";
		self.blockRep1Img.image = [UIImage imageNamed:@"Kajsa Arnlund"];
		self.blockRep2Txt.text = @"Rachel Terry";
		self.blockRep2Img.image = [UIImage imageNamed:@"Rachel Terry"];
    }
    else if([self.blockName isEqualToString:@"Eric Milner White Court Block A"]){
		self.blockImage.image = [UIImage imageNamed:@"EricMilner.jpg"];
        self.blockRep1Txt.text = @"Orkney Bankes";
        self.blockRep1Img.image = [UIImage imageNamed:@"Orkney Bankes"];
        self.blockRep2Txt.text = @"Sarah Weinberg";
        self.blockRep2Img.image = [UIImage imageNamed:@"Sarah Weinberg"];
    }
    else if([self.blockName isEqualToString:@"Eric Milner White Court Block B"]){
		self.blockImage.image = [UIImage imageNamed:@"EricMilner.jpg"];
		self.blockRep1Txt.text = @"Orkney Bankes";
		self.blockRep1Img.image = [UIImage imageNamed:@"Orkney Bankes"];
		self.blockRep2Txt.text = @"Sarah Weinberg";
		self.blockRep2Img.image = [UIImage imageNamed:@"Sarah Weinberg"];
    }
    else if([self.blockName isEqualToString:@"Fairfax House"]){
		self.blockImage.image = [UIImage imageNamed:@"FairfaxHouse.png"];
        self.blockRep1Txt.text = @"Brad Dunkley";
        self.blockRep1Img.image = [UIImage imageNamed:@"Brad Dunkley"];
		
		//ONLY ONE BLOCK REP, Layout in centre of view.
		[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.blockRep1Img attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
		
		//Hide the other label and image.
		self.blockRep2Img.hidden = YES;
		self.blockRep2Txt.hidden = YES;
		
    }
    else if([self.blockName isEqualToString:@"Le Page Court"]){
		self.blockImage.image = [UIImage imageNamed:@"LePage.png"];
        self.blockRep1Txt.text = @"Alex Payne";
        self.blockRep1Img.image = [UIImage imageNamed:@"Alex Payne"];
        
        //ONLY ONE BLOCK REP, Layout in centre of view.
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.blockRep1Img attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        
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
        //self.blockRepView.hidden = YES;
        //[self.blockRepsView removeFromSuperview];
        self.styLabel.hidden = NO;
        self.styLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
        //[self.blockRepTopLine addConstraint:[NSLayoutConstraint constraintWithItem:self.blockRepTopLine attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.changeBlockTopLine attribute:NSLayoutAttributeTop multiplier:1 constant:1]];
	}
}
- (NSMutableArray *)simpleJsonParsing:(NSString *)jsonURL
{
    //-- Make URL request with server
    NSHTTPURLResponse *response = nil;
    NSString *jsonUrlString = jsonURL;
    NSURL *url = [NSURL URLWithString:[jsonUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    //-- Get request and response though URL
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if(error != nil){
        return nil;
    }
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    if([result count] == 0){
        return nil;
    }
    NSDictionary *departures = result[@"departures"];
    NSMutableArray *buses = [[NSMutableArray alloc] init];

    if(departures[@"4"] != nil){
        [buses addObject:departures[@"4"]];
    }
    if(departures[@"44"] != nil){
        [buses addObject:departures[@"44"]];
    }
    if(departures[@"UB1"] != nil){
        [buses addObject:departures[@"UB1"]];
    }
    return buses;
}
-(void)busLabelUpdate{
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
     ^ {
         NSArray *buses = [[NSArray alloc] initWithArray:[self simpleJsonParsing:@"http://transportapi.com/v3/uk/bus/stop/3290YYA00279/live.json?group=route&api_key=cc0dfbfadb5ef786c386a43c4dd8c1c7&app_id=52946486"]];
         if([buses count] != 0){
             [self busFetchComplete:buses];
         }
         else{
             self.newsLabel.text = @"Sorry, an error occured loading bus times.";
         }
     });
}
-(void)busFetchComplete:(NSArray *)buses{//still need to code for -over request limit, no connection, etc.
    NSString *labelString = @"The next buses from Market Square towards York are:\n";
    
    for(int i = 0; i < [buses count]; i++){
        NSArray *times = [[NSArray alloc] initWithArray:[buses objectAtIndex:i]];
        labelString = [NSString stringWithFormat:@"%@\n%@:\t\t", labelString, [[times objectAtIndex:0] valueForKey:@"line"]];
        
        for(int j = 0; j < [times count]; j++){
            labelString = [NSString stringWithFormat:@"%@%@,", labelString, [[times objectAtIndex:j] valueForKey:@"best_departure_estimate"]];
            if(j != [times count] - 1){
                labelString = [NSString stringWithFormat:@"%@\t\t", labelString];
            }
        }
        
    }
    
    NSArray *eastBuses = [[NSArray alloc] initWithArray:[self simpleJsonParsing:@"http://transportapi.com/v3/uk/bus/stop/3290YYA00282/live.json?group=route&api_key=cc0dfbfadb5ef786c386a43c4dd8c1c7&app_id=52946486"]];
    
    labelString = [NSString stringWithFormat:@"%@\n\nThe next buses from Market Square towards East Campus are:\n", labelString];
    
    for(int i = 0; i < [eastBuses count]; i++){
        NSArray *times = [[NSArray alloc] initWithArray:[eastBuses objectAtIndex:i]];
        labelString = [NSString stringWithFormat:@"%@\n%@:\t\t", labelString, [[times objectAtIndex:0] valueForKey:@"line"]];
        
        for(int j = 0; j < [times count]; j++){
            labelString = [NSString stringWithFormat:@"%@%@,", labelString, [[times objectAtIndex:j] valueForKey:@"best_departure_estimate"]];
            if(j != [times count] - 1){
                labelString = [NSString stringWithFormat:@"%@\t\t", labelString];
            }
        }
        
    }
    
    self.newsLabel.text = labelString;
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
- (IBAction)refreshBusTimes:(id)sender {
    self.newsLabel.text = @"Reloading bus times...";
    [self busLabelUpdate];
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
