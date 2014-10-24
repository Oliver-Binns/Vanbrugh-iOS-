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
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSObject *object = [defaults objectForKey:@"block"];
	if([[NSString stringWithFormat:@"%@", object] isEqualToString:@"STYC"]){
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		NSString *block = @"Second/Third Year";
		[defaults setObject:[NSString stringWithString:block] forKey:@"block"];
		[defaults synchronize];
	}
	
    [self updateEvents];
    [self updateFAQ];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.SelectButton.titleLabel.font = [UIFont fontWithName: @"Cantarell" size:18];
    self.SelectInstruction.font = [UIFont fontWithName:@"Cantarell" size:18];
    
    if(object != nil){ //if default block has already been set!
        [self performSelector:@selector(jumpToHome) withObject:nil afterDelay:0.0];
        
    }
    
    self.pickerOptions = @[@"Barbara Scott E Fresher", @"Barbara Scott F Fresher", @"Donald Barron B Fresher", @"Donald Barron C Fresher", @"Eric A Fresher", @"Eric B Fresher", @"Fairfax House Fresher", @"Le Page Fresher", @"Off Campus Fresher", @"Second/Third Year"]; //What about Off Campus?
}
-(void)updateFAQ{
    NSError* e;
    NSURL *textFile = [NSURL URLWithString:@"http://www.vanbrugh-college.co.uk/faq.txt"];
    NSString* str = [NSString stringWithContentsOfURL:textFile encoding:NSASCIIStringEncoding error:&e];
    if(e == nil){
        // For error information
        NSError *error;
        
        // Create file manager
        //NSFileManager *fileMgr = [NSFileManager defaultManager];
        
        // Point to Document directory
        NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"faq.txt"];
        // Write the file
        [str writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    }
    //Everything good
}
-(void)updateEvents{
    NSError* e;
    NSURL *textFile = [NSURL URLWithString:@"http://www.vanbrugh-college.co.uk/events.txt"];
    NSString* str = [NSString stringWithContentsOfURL:textFile encoding:NSASCIIStringEncoding error:&e];
    if(e == nil){
        // For error information
        NSError *error;
        
        // Create file manager
        //NSFileManager *fileMgr = [NSFileManager defaultManager];
        
        // Point to Document directory
        NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"events.txt"];
        // Write the file
        [str writeToFile:filePath atomically:YES encoding:NSASCIIStringEncoding error:&error];
    }
    //Everything good
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
		NSString *block;
		if([[NSString stringWithString:self.pickerOptions[self.currentRow]] isEqualToString:@"Barbara Scott E Fresher"]){
			block = @"Barbara Scott Court Block E";
		}
		else if([[NSString stringWithString:self.pickerOptions[self.currentRow]] isEqualToString:@"Barbara Scott F Fresher"]){
			block = @"Barbara Scott Court Block F";
		}
		else if([[NSString stringWithString:self.pickerOptions[self.currentRow]] isEqualToString:@"Donald Barron B Fresher"]){
			block = @"Donald Barron Court Block B";
		}
		else if([[NSString stringWithString:self.pickerOptions[self.currentRow]] isEqualToString:@"Donald Barron C Fresher"]){
			block = @"Donald Barron Court Block C";
		}
		else if([[NSString stringWithString:self.pickerOptions[self.currentRow]] isEqualToString:@"Eric A Fresher"]){
			block = @"Eric Milner White Court Block A";
		}
		else if([[NSString stringWithString:self.pickerOptions[self.currentRow]] isEqualToString:@"Eric B Fresher"]){
			block = @"Eric Milner White Court Block B";
		}
		else if([[NSString stringWithString:self.pickerOptions[self.currentRow]] isEqualToString:@"Fairfax House Fresher"]){
			block = @"Fairfax House";
		}
		else if([[NSString stringWithString:self.pickerOptions[self.currentRow]] isEqualToString:@"Le Page Fresher"]){
			block = @"Le Page Court";
		}
		else if([[NSString stringWithString:self.pickerOptions[self.currentRow]] isEqualToString:@"Off Campus Fresher"]){
			block = @"Off Campus";
		}
		else if([[NSString stringWithString:self.pickerOptions[self.currentRow]] isEqualToString:@"Second/Third Year"]){
			block = @"Second/Third Year";
		}
        [defaults setObject:[NSString stringWithString:block] forKey:@"block"];
        [defaults synchronize];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
