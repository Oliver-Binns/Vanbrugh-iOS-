//
//  FAQViewController.m
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 12/08/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import "FAQViewController.h"
#import "CircularLinkedList.h"

@interface FAQViewController ()

@property CircularLinkedList* faqList;

@end

@implementation FAQViewController
@synthesize faqList = _faqList;
@synthesize faqTitleLabel = _faqTitleLabel;
@synthesize faqTextLabel = _faqTextLabel;
@synthesize prevButton = _prevButton;
@synthesize nextButton = _nextButton;
@synthesize nextImage = _nextImage;
@synthesize prevImage = _prevImage;
@synthesize closeButton = _closeButton;

-(BOOL)hasFourInchDisplay{
    return ([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568.0);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.faqTitleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    if(![self hasFourInchDisplay]){
        self.faqTextLabel.font = [UIFont fontWithName:@"Cantarell" size:12];
    }
    else{
        self.faqTextLabel.font = [UIFont fontWithName:@"Cantarell" size:14];
    }
    self.closeButton.titleLabel.font = [UIFont fontWithName:@"Cantarell" size:18];
    /*if(![self hasFourInchDisplay]){
        self.faqTitleLabel.frame = CGRectMake(16, 70, 288, 50);
        self.faqTextLabel.frame = CGRectMake(45, 100, 230, 330);
        self.nextImage.frame = CGRectMake(285, 240, 25, 50);
        self.prevImage.frame = CGRectMake(10, 240, 25, 50);
    }*/
    self.prevImage.transform = CGAffineTransformMakeRotation(M_PI);
    [self setUpList];
    [self displayNextItem];
    // Do any additional setup after loading the view.
    
}
-(void)setUpList{
    if(self.faqList == nil){
        self.faqList = [[CircularLinkedList alloc] init];
    }
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"faq.txt"];
    NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];

    if(content == nil){
        filePath = [[NSBundle mainBundle] pathForResource:@"faq" ofType:@"txt"];
        content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    }
    
    NSArray *faqContent = [content componentsSeparatedByString:@"\n"];
    for(int i = 0; i < [faqContent count]; i+=2){
        [self.faqList insertFAQItemWithName:[faqContent objectAtIndex:i] andDescription:[faqContent objectAtIndex:i+1]];
    }
}

-(void)displayNextItem{
    self.faqTitleLabel.text = [self.faqList returnNextItem].name;
    self.faqTextLabel.text = [self.faqList returnCurrentItem].text;
}
-(void)displayPrevItem{
    for(int i = 0; i < self.faqList.size - 1; i++){
        [self displayNextItem];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)prevButtonPress:(id)sender {
    [self displayPrevItem];
}

- (IBAction)nextButtonPress:(id)sender {
    [self displayNextItem];
}
- (IBAction)swipeRight:(id)sender {
    [self displayNextItem];
}
- (IBAction)swipeLeft:(id)sender {
    [self displayPrevItem];
}

@end
