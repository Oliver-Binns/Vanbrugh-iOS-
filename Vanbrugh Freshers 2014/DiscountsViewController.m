//
//  DiscountsViewController.m
//  Vanbrugh Freshers 2014
//
//  Created by Oliver Binns on 24/10/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import "DiscountsViewController.h"
#import "DiscountDetailViewController.h"

@interface DiscountsViewController ()

@end

@implementation DiscountsViewController

NSArray *DiscountsArray;
@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    DiscountsArray = [[NSArray alloc] initWithArray:[self parseDiscounts]];
    // Do any additional setup after loading the view.
}
- (NSString *)loadDiscounts{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"discounts.txt"];
    NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    NSLog(@"1: %@", content);
    
    if(content == nil){
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"discounts" ofType:@"txt"];
        content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    }
    return content;
}

- (NSArray *)parseDiscounts{
    NSString *content = [self loadDiscounts];
    NSArray *arrayOfDiscountData = [content componentsSeparatedByString:@"\n"];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for(int i = 0; i < [arrayOfDiscountData count] - 1; i++){
        NSArray *DiscountDataArray = [[arrayOfDiscountData objectAtIndex:i] componentsSeparatedByString:@";"];
        [array addObject:DiscountDataArray];
    }
    return array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	// Return the number of sections.
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [DiscountsArray count];
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
    //NSMutableArray *section = [self.events objectAtIndex:indexPath.section];
    //Event *cellEvent = [section objectAtIndex:indexPath.row];
    NSString *title = [[DiscountsArray objectAtIndex:indexPath.row] objectAtIndex:0];
    cell.textLabel.text = title;
    cell.textLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    if([title isEqualToString:@"ÜGOT"]){
        cell.imageView.image = [UIImage imageNamed:@"UGOT"];
    }
    else{
        cell.imageView.image = [UIImage imageNamed:title];
    }
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
	return @"Discounts";
}

#pragma mark - onClick of a cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self performSegueWithIdentifier:@"ViewDiscount" sender:self];
	return;
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ViewDiscount"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DiscountDetailViewController *destViewController = segue.destinationViewController;
        destViewController.discountDetails = [DiscountsArray objectAtIndex:indexPath.row];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
