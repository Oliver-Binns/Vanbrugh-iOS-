//
//  PickerViewController.h
//  Vanbrugh Freshers 2014
//
//  Created by Oliver on 16/06/2014.
//  Copyright (c) 2014 Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewController : UIViewController
    <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) NSArray *pickerOptions;
@property (strong, nonatomic) IBOutlet UIButton *SelectButton;
@property (strong, nonatomic) IBOutlet UILabel *SelectInstruction;
@property NSInteger currentRow;

@end
