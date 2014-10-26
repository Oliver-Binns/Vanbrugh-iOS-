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
@synthesize eventNameLabel = _eventNameLabel;
@synthesize timeButton = _timeButton;
@synthesize mapPlaceholder = _mapPlaceholder;

UIView *eventView;
Event *thisEvent;

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
        scrollFrame.size = CGSizeMake(320, 449);
        self.tableView.frame = scrollFrame;
    }
    else{
        CGRect scrollFrame;
        scrollFrame.origin = self.tableView.frame.origin;
        scrollFrame.size = CGSizeMake(320, 362);
        self.tableView.frame = scrollFrame;
    }
    self.closeTextButton.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
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
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"events.txt"];
    NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    if(content == nil){
        filePath = [[NSBundle mainBundle] pathForResource:@"events" ofType:@"txt"];
        content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    }
    
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
        if([self daysBetweenDate:firstDate andDate:[NSDate dateWithTimeIntervalSince1970:[myEvent[3] doubleValue]]] < 0){
			
        }
		else{
			if(dayDifference != [self daysBetweenDate:firstDate andDate:[NSDate dateWithTimeIntervalSince1970:[myEvent[3] doubleValue]]]){
				//Starts a new section if we've hit a new day!
				dayDifference = [self daysBetweenDate:firstDate andDate:[NSDate dateWithTimeIntervalSince1970:[myEvent[3] doubleValue]]];
				if([dayEvents count] != 0){
					NSMutableArray *dayEventsSnapshot = [[NSMutableArray alloc] initWithArray:dayEvents];
					[self.events addObject:dayEventsSnapshot];
					[dayEvents removeAllObjects];
				}
			}
			Event *myEventObject = [[Event alloc] init];
			[myEventObject setName:myEvent[0]];
			[myEventObject setLocation:myEvent[1]];
			[myEventObject setImage:myEvent[2]];
			[myEventObject setStartTime:[NSDate dateWithTimeIntervalSince1970:[myEvent[3] doubleValue]]];
			[myEventObject setEndTime:[NSDate dateWithTimeIntervalSince1970:[myEvent[4] doubleValue]]];
			//[myEventObject setDescr: myEvent[5]];
			//DESCRIPTION NOT CURRENTLY USED BY APP.
            [dayEvents addObject:myEventObject];
		}
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
	
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
    [dateFormat setDateFormat:@"EEEE, d MMMM yyyy"];
    NSString *dateString = [dateFormat stringFromDate:thisEvent.startTime];
    return dateString;
}

#pragma mark - onClick of a cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self showEventViewforDay:indexPath.section andEvent:indexPath.row];
    //open a view with the details for self.events[indexPath.section, indexPath.row].
}

-(void)changeTimeView{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    [formatter setTimeZone: [NSTimeZone timeZoneWithName:@"Europe/London"]];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
    if([self.timeButton.titleLabel.text rangeOfString:@"Start"].location != NSNotFound){
        NSString *timeString = [formatter stringFromDate:thisEvent.endTime];
        [self.timeButton setTitle:[NSString stringWithFormat: @"End Time: %@", timeString] forState:UIControlStateNormal];
    }
    else{
        NSString *timeString = [formatter stringFromDate:thisEvent.startTime];
        [self.timeButton setTitle:[NSString stringWithFormat: @"Start Time: %@", timeString] forState:UIControlStateNormal];
    }
}
- (IBAction)closeDetail:(id)sender {
    [self.detailView setHidden:YES];
}

-(void)showEventViewforDay:(NSInteger)day andEvent:(NSInteger)event{
    //Change your frame here.
    /*//Set up objects on Event View
    eventView.backgroundColor = [UIColor whiteColor];*/
    
    NSMutableArray *dayEvents = [self.events objectAtIndex:day];
    thisEvent = [dayEvents objectAtIndex:event];
    
    self.eventNameLabel.text = thisEvent.name;
    self.eventNameLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    [formatter setTimeZone: [NSTimeZone timeZoneWithName:@"Europe/London"]];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
    NSString *timeString = [formatter stringFromDate:thisEvent.startTime];
    [self.timeButton setTitle:[NSString stringWithFormat: @"Start Time: %@", timeString] forState:UIControlStateNormal];
    self.timeButton.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    [self.timeButton addTarget:self action:@selector(changeTimeView) forControlEvents:UIControlEventTouchUpInside];
    
    CLLocationCoordinate2D position = [thisEvent getCoordinates];
	CLLocation *test = [[CLLocation alloc] initWithLatitude:position.latitude longitude:position.longitude];
	CLLocation *nullCoordinates = [[CLLocation alloc] initWithLatitude:0 longitude:0];
	
	CLLocationDistance dist = [test distanceFromLocation:nullCoordinates];
	int distance = dist;
	
	if(distance != 0){
		GMSMarker *marker = [GMSMarker markerWithPosition:position];
		marker.title = thisEvent.location;
		
		GMSCameraPosition *camera = [GMSCameraPosition cameraWithTarget:position zoom:17];

		GMSMapView *mapView = [GMSMapView mapWithFrame:self.mapPlaceholder.frame camera:camera];
		marker.map = mapView;
        mapView.myLocationEnabled = YES;
		mapView.selectedMarker = marker;
		
		[self.detailView addSubview:mapView];
	}
	else{
		if([self hasFourInchDisplay]){
			self.mapPlaceholder.image = [UIImage imageNamed:@"UpdateNeeded-4.jpg"];
		}
		else{
			self.mapPlaceholder.image = [UIImage imageNamed:@"UpdateNeeded-3.jpg"];
		}
	}
	self.detailView.hidden = NO;	
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