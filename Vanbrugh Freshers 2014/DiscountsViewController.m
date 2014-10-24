//
//  DiscountsViewController.m
//  Vanbrugh Freshers 2014
//
//  Created by Oliver Binns on 24/10/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import "DiscountsViewController.h"

@interface DiscountsViewController ()

@end

@implementation DiscountsViewController

NSArray *DiscountsArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    DiscountsArray = [[NSArray alloc] initWithArray:[self parseDiscounts]];
    // Do any additional setup after loading the view.
}
- (NSString *)loadDiscounts{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"discounts" ofType:@"txt"];
    return [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
}

- (NSArray *)parseDiscounts{
    NSString *content = [self loadDiscounts];
    NSArray *arrayOfDiscountData = [content componentsSeparatedByString:@"\n"];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSLog(@"%lu", (unsigned long)[arrayOfDiscountData count]);
    for(int i = 0; i < [arrayOfDiscountData count] - 1; i++){
        NSArray *DiscountDataArray = [[arrayOfDiscountData objectAtIndex:i] componentsSeparatedByString:@";"];
        [array addObject:DiscountDataArray];
        NSLog(@"%@", [DiscountDataArray objectAtIndex:0]);
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
	NSLog(@"%lu", [DiscountsArray count]);
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
    cell.textLabel.text = [NSString stringWithFormat:@"%@", title];
    cell.textLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    //cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", cellEvent.image]];
    /*cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", cellEvent.location];
     cell.detailTextLabel.hidden = NO;
     cell.detailTextLabel.font = [UIFont fontWithName:@"Cantarell" size:18];*/
    //[cell setSeparatorInset:UIEdgeInsetsZero];
    return cell;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return nil;
}

#pragma mark - onClick of a cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self performSegueWithIdentifier:@"ViewDiscount" sender:self];
	return;
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
