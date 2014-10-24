//
//  SecondViewController.m
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 09/06/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import "SecondViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface SecondViewController ()

@property (strong, nonatomic) NSMutableArray *events;

@end

@implementation SecondViewController

@synthesize events = _events;
UIView *eventView;

-(BOOL)hasFourInchDisplay{
    return ([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568.0);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.tableView setShowsVerticalScrollIndicator:NO];
	
    if([self hasFourInchDisplay]){
        CGRect scrollFrame;
        scrollFrame.origin = self.tableView.frame.origin;
        scrollFrame.size = CGSizeMake(320, 449
                                      );
        self.tableView.frame = scrollFrame;
    }
    else{
        CGRect scrollFrame;
        scrollFrame.origin = self.tableView.frame.origin;
        scrollFrame.size = CGSizeMake(320, 362);
        self.tableView.frame = scrollFrame;
    }
    [self parseEvents];
	// Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

-(void)parseEvents{ //reads the Events.txt file and extracts the data into our events array!
    if(self.events == nil){
        self.events = [[NSMutableArray alloc] init];
    }
    else{
        [self.events removeAllObjects];
    }
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"events"
                                                     ofType:@"txt"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    NSArray *myEvents = [content componentsSeparatedByString:@"\n"];
    
    NSDate *firstDate = [NSDate date]; //timestamp of the first day of Fresher's week (27th Sept).
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSUInteger preservedComponents = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit);
    firstDate = [calendar dateFromComponents:[calendar components:preservedComponents fromDate:firstDate]];
    
    NSMutableArray *dayEvents = [[NSMutableArray alloc] init];
    NSArray *myEvent = [myEvents[0] componentsSeparatedByString:@";"];
    NSInteger dayDifference = [self daysBetweenDate:firstDate andDate:[NSDate dateWithTimeIntervalSince1970:[myEvent[3] doubleValue]]];
    
    for(int i = 0; i < [myEvents count]; i++){
        myEvent = [myEvents[i] componentsSeparatedByString:@";"];
        //NSLog([myEvent objectAtIndex:0]);
        if([self daysBetweenDate:firstDate andDate:[NSDate dateWithTimeIntervalSince1970:[myEvent[3] doubleValue]]] < 0){
            break;
        }
        else if(dayDifference != [self daysBetweenDate:firstDate andDate:[NSDate dateWithTimeIntervalSince1970:[myEvent[3] doubleValue]]]){
            //Starts a new section if we've hit a new day!
            dayDifference = [self daysBetweenDate:firstDate andDate:[NSDate dateWithTimeIntervalSince1970:[myEvent[3] doubleValue]]];
            NSMutableArray *dayEventsSnapshot = [[NSMutableArray alloc] initWithArray:dayEvents];
            [self.events addObject:dayEventsSnapshot];
            [dayEvents removeAllObjects];
            
        }
        Event *myEventObject = [[Event alloc] init];
        [myEventObject setName:myEvent[0]];
        [myEventObject setLocation:myEvent[1]];
        [myEventObject setImage:myEvent[2]];
        [myEventObject setTime:[NSDate dateWithTimeIntervalSince1970:[myEvent[3] doubleValue]]];
        [myEventObject setDescr: myEvent[4]];
        [dayEvents addObject:myEventObject];
    }
    //[self.events addObject:dayEvents];
    if([dayEvents count] > 0){
        [self.events addObject:dayEvents];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.events count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSMutableArray *day = [self.events objectAtIndex:section];
    return [day count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // Configure the cell...
    NSMutableArray *section = [self.events objectAtIndex:indexPath.section];
    Event *cellEvent = [section objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", cellEvent.name];
    cell.textLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    //cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", cellEvent.image]];
    /*cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", cellEvent.location];
    cell.detailTextLabel.hidden = NO;
    cell.detailTextLabel.font = [UIFont fontWithName:@"Cantarell" size:18];*/
    //[cell setSeparatorInset:UIEdgeInsetsZero];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.frame = CGRectMake(10, 0, 320, 20);
    myLabel.font = [UIFont fontWithName:@"Cantarell" size:12];
    myLabel.textColor = [UIColor whiteColor];
    myLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor colorWithRed:(128/255.0) green:(128/255.0) blue:(128/255.0) alpha:1];
    [headerView addSubview:myLabel];
    
    return headerView;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSMutableArray *dayEvents = [self.events objectAtIndex:section];
    Event *thisEvent = [dayEvents objectAtIndex:0];
    
    /*NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *timeString = [formatter stringFromDate:thisEvent.time];
    NSLog(timeString);*/
    //NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
    [dateFormat setDateFormat:@"EEEE, d MMMM yyyy"];
    NSString *dateString = [dateFormat stringFromDate:thisEvent.time];
    return dateString;
    return nil;
    //return timeString;
}

#pragma mark - onClick of a cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self showEventViewforDay:indexPath.section andEvent:indexPath.row];
    //open a view with the details for self.events[indexPath.section, indexPath.row].
}
-(void)showEventViewforDay:(NSInteger)day andEvent:(NSInteger)event{
    //Change your frame here.
    NSInteger offset = 0;
    if([self hasFourInchDisplay]){
        eventView = [[UIView alloc] initWithFrame:CGRectMake(0, 70, 320, 504)];
        offset = 88;
    }
    else{
        eventView = [[UIView alloc] initWithFrame:CGRectMake(0, 70, 320, 416)];
    }
    
    //Set up objects on Event View
    eventView.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *dayEvents = [self.events objectAtIndex:day];
    Event *thisEvent = [dayEvents objectAtIndex:event];
    
    UIImageView *eventTitleImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 55, 55)];
    eventTitleImage.backgroundColor = [UIColor colorWithRed:(55/255.0) green:(160/255.0) blue:(250/255.0) alpha:1];
    eventTitleImage.image = [UIImage imageNamed:@"calendar"];
    [eventView addSubview:eventTitleImage];
    
    UIImageView *eventTitleBottomBorder = [[UIImageView alloc] initWithFrame:CGRectMake(0, 55, 320, 1)];
    eventTitleBottomBorder.backgroundColor = [UIColor lightGrayColor];
    [eventView addSubview:eventTitleBottomBorder];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(55, 0, 264, 55)];
    title.text = thisEvent.name;
    title.font = [UIFont fontWithName:@"Cantarell" size:18];
    title.textAlignment = NSTextAlignmentCenter;
    [eventView addSubview:title];
    
    UIImageView *eventTimeImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 56, 55, 55)];
    eventTimeImage.backgroundColor = [UIColor colorWithRed:(250/255.0) green:(55/255.0) blue:(160/255.0) alpha:1];
    eventTimeImage.image = [UIImage imageNamed:@"clock"];
    [eventView addSubview:eventTimeImage];
    
    UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(55, 56, 264, 55)];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *timeString = [formatter stringFromDate:thisEvent.time];
    time.text = [NSString stringWithFormat: @"Start Time: %@", timeString];
    time.font = [UIFont fontWithName:@"Cantarell" size:18];
    time.textAlignment = NSTextAlignmentCenter;
    [eventView addSubview:time];
    
    UIImageView *eventTimeBottomBorder = [[UIImageView alloc] initWithFrame:CGRectMake(0, 111, 320, 1)];
    eventTimeBottomBorder.backgroundColor = [UIColor lightGrayColor];
    [eventView addSubview:eventTimeBottomBorder];
    
    CLLocationCoordinate2D position = [thisEvent getCoordinates];
    GMSMarker *marker = [GMSMarker markerWithPosition:position];
    marker.title = thisEvent.location;
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithTarget:position zoom:17];

    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectMake(0, 112, 320, 193+offset) camera:camera];
    marker.map = mapView;
    mapView.selectedMarker = marker;
    
    [eventView addSubview:mapView];
    
    UIImageView *eventMapBottomBorder = [[UIImageView alloc] initWithFrame:CGRectMake(0, 305+offset, 320, 1)];
    eventMapBottomBorder.backgroundColor = [UIColor lightGrayColor];
    [eventView addSubview:eventMapBottomBorder];
    
    UIImageView *eventCloseImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 306+offset, 55, 55)];
    eventCloseImage.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(0/255.0) blue:(0/255.0) alpha:1];
    eventCloseImage.image = [UIImage imageNamed:@"close"];
    [eventView addSubview:eventCloseImage];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(hideEventView)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Close" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(55, 304+offset, 264, 55);
    [eventView addSubview:button];
    
    [UIView transitionWithView:self.view duration:0.2
                            options:UIViewAnimationOptionTransitionCrossDissolve //change to whatever animation you like
                         animations:^ { [self.view addSubview:eventView]; }
                         completion:nil];
}

-(void)hideEventView{
    //[tableView removeFromSuperview];
    [UIView transitionWithView:self.view duration:0.2
                            options:UIViewAnimationOptionTransitionCrossDissolve //change to whatever animation you like
                         animations:^ { [eventView removeFromSuperview]; }
                         completion:nil];
    //[self showDirectionsButton];
}

@end