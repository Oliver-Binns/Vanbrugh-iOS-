//
//  SecondViewController.h
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 09/06/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "EventsTableViewController.h"

@interface SecondViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet UIView *detailView;
@property (strong, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (strong, nonatomic) IBOutlet UIButton *timeButton;
@property (strong, nonatomic) IBOutlet UIButton *closeTextButton;
@property (strong, nonatomic) IBOutlet UIImageView *mapPlaceholder;

@end
