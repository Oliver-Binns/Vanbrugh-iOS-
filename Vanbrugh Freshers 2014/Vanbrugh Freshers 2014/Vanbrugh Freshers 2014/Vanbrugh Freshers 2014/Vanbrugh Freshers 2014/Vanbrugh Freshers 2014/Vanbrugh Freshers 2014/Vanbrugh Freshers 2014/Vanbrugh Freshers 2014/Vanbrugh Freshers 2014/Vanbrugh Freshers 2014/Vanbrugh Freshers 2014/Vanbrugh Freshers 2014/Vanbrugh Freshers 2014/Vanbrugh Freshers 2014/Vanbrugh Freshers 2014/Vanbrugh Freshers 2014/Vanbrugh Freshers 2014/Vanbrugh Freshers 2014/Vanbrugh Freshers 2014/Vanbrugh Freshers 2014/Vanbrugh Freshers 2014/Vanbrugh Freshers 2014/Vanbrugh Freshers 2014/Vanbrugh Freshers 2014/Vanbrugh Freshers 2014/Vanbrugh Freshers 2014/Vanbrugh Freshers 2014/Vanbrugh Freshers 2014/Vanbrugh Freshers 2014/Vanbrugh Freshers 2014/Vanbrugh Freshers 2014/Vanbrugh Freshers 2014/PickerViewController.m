//
//  PickerViewController.m
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 16/06/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@end

@implementation PickerViewController

@synthesize pickerOptions = _pickerOptions;
@synthesize SelectButton = _SelectButton;
@synthesize SelectInstruction = _SelectInstruction;
@synthesize currentRow = _currentRow;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.SelectButton.titleLabel.font = [UIFont fontWithName: @"Cantarell" size:18];
    self.SelectInstruction.font = [UIFont fontWithName:@"Cantarell" size:18];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSObject *object = [defaults objectForKey:@"block"];
    if(object != nil){ //if default block has already been set!
        [self performSelector:@selector(jumpToHome) withObject:nil afterDelay:0.0];
        
    }
    
    self.pickerOptions = @[@"Barbara Scott Court Block E", @"Barbara Scott Court Block F", @"Donald Barron Court Block B", @"Donald Barron Court Block C", @"Eric Milner White Court Block A", @"Eric Milner White Court Block B", @"Fairfax House", @"Le Page Court", @"Off Campus", @"STYC", @"Second/Third Year"]; //What about Off Campus?
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    //return self.pickerOptions.count;
    return [self.pickerOptions count];
}

/*- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return self.pickerOptions[row];
}*/

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 44)];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Cantarell" size:18];
    label.text = self.pickerOptions[row];
    [label setTextAlignment:NSTextAlignmentCenter];
    return label;
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    self.currentRow = row; //updates the pointer for the current row
}


#pragma mark - Navigation

- (void)jumpToHome
{
    [self.SelectButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSObject *object = [defaults objectForKey:@"block"];
    if(object == nil){ //if default block has not already been set, sets it!
        [defaults setObject:[NSString stringWithString:self.pickerOptions[self.currentRow]] forKey:@"block"];
        [defaults synchronize];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
