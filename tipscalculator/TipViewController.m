//
//  TipViewController.m
//  tipscalculator
//
//  Created by Muthukumar S on 6/1/14.
//  Copyright (c) 2014 Muthukumar S. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *defaultTipLabel;

- (IBAction)onTap:(id)sender;
- (void) updateValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateValues];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //NSString *stringValue = [defaults objectForKey:@"some_key_that_you_choose"];
    float defaultTipAmount = [defaults floatForKey:@"defaultTipAmount"] * 100;
    
    NSMutableString *defaultTippercentage =  [NSMutableString stringWithFormat:@"%0.1f" , defaultTipAmount];
    [defaultTippercentage appendString:@"%"];
    
    [self.tipControl setTitle:defaultTippercentage forSegmentAtIndex:0];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //NSString *stringValue = [defaults objectForKey:@"some_key_that_you_choose"];
    float defaultTipAmount = [defaults floatForKey:@"defaultTipAmount"];
    
    self.defaultTipLabel.text = [NSString stringWithFormat:@"%0.2f" , defaultTipAmount];
    
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(defaultTipAmount) , @(0.15), @(0.2)];
    
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = billAmount + tipAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"%0.2f" , tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"%0.2f" , totalAmount];
    
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[settingsViewController alloc] init] animated:YES];
}

@end
