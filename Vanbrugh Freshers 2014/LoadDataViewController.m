//
//  LoadDataViewController.m
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 25/10/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import "LoadDataViewController.h"

@interface LoadDataViewController ()

@end

@implementation LoadDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
     ^ {
         [self updateEvents];
         [self updateFAQ];
     });
    
    dispatch_group_notify(group, dispatch_get_main_queue(),
      ^{
          [self moveOn];
      });
}

-(void)moveOn{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSObject *object = [defaults objectForKey:@"block"];
    if(object != nil){ //if default block has already been set!
        [self performSegueWithIdentifier:@"goToHome" sender:self];
    }
    else{
        [self performSegueWithIdentifier:@"goToPicker" sender:self];
    }
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"goToHome"]){
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
