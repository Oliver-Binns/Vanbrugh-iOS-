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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSObject *object = [defaults objectForKey:@"block"];
    if([[NSString stringWithFormat:@"%@", object] isEqualToString:@"STYC"]){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *block = @"Second/Third Year";
        [defaults setObject:[NSString stringWithString:block] forKey:@"block"];
        [defaults synchronize];
    }
    //[self setUpNotifications];
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
     ^ {
         NSString* content = [self getFile:@"events-v1_1.txt"];
         if(content != nil){
             [self saveFileWithName:@"events.txt" andContent:content];
         }
         
         content = [self getFile:@"faq-v1_1.txt"];
         if(content != nil){
             [self saveFileWithName:@"faq.txt" andContent:content];
         }
         
         content = [self getFile:@"discounts.txt"];
         if(content != nil){
             [self saveFileWithName:@"discounts.txt" andContent:content];
         }
         
         content =[self getFile:@"notifications.txt"];
         if(content != nil){
             [self setUpNotificationsWithData:content];
         }
     });
    
    dispatch_group_notify(group, dispatch_get_main_queue(),
      ^{
          [self moveOn];
      });
}
-(NSMutableArray *)getNotificationsWithData:(NSString *)data{
    NSString *content = data;
    
    NSArray *notifications = [[NSArray alloc] initWithArray:[content componentsSeparatedByString:@"\n"]];
    NSMutableArray *notificationsData = [[NSMutableArray alloc] init];
    for(int i = 0; i < [notifications count]; i++){
        [notificationsData addObject:[[notifications objectAtIndex:i] componentsSeparatedByString:@";"]];
    }
    return notificationsData;
}
-(void)setUpNotificationsWithData:(NSString *)data{
    NSArray *notificationsList = [[NSArray alloc] initWithArray:[self getNotificationsWithData:data]];
    for(int i = 1; i < [notificationsList count]; i++){ //start from line 1, line 0 is a file verification
        NSArray *notification = [[NSArray alloc] initWithArray:[notificationsList objectAtIndex:i]];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:nil]];
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        
        localNotification.soundName = @"quack.caf";
        localNotification.fireDate = [NSDate dateWithTimeIntervalSince1970:[[notification objectAtIndex:1] doubleValue]];
        
        localNotification.alertBody = [notification objectAtIndex:0];
        
        NSDate *now = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
        if ([now compare:localNotification.fireDate] == NSOrderedAscending) { //the local notification time is in the future
            [[UIApplication sharedApplication] scheduleLocalNotification:localNotification]; //only schedules the notification if it is in the future
        }
    }
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
-(NSString *)getFile:(NSString *)text{
    NSError* e;
    NSURL *textFile = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.vanbrugh-college.co.uk/%@", text]];
    NSString* str = [NSString stringWithContentsOfURL:textFile encoding:NSUTF8StringEncoding error:&e];
    if(e == nil && [str hasPrefix:text]){
        return str;
    }
    else{
        return nil;
    }
}
-(BOOL)saveFileWithName:(NSString *)name andContent:(NSString *)content{
    // Create file manager
    //NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    // Point to Document directory
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:name];
    //Remove the file verification
    content = [content substringFromIndex:[name length]+6];
    // Write the file
    [content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil]; //no error handling needed- this is provided when they are accessed.
    return true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//}

@end
