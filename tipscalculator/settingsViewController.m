//
//  settingsViewController.m
//  tipscalculator
//
//  Created by Muthukumar S on 6/3/14.
//  Copyright (c) 2014 Muthukumar S. All rights reserved.
//

#import "settingsViewController.h"

@interface settingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *defaultTip;
@property (weak, nonatomic) IBOutlet UIButton *save;

- (IBAction)onTap:(id)sender;
- (void) storeDefaults;
@end

@implementation settingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self storeDefaults];
}

- (void) storeDefaults
{
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //[defaults setObject:@"some_string_to_save" forKey:@"some_key_that_you_choose"];
    //float defaultTip = [NSString stringWithFormat:@"%0.2f" , self.defaultTip.text];
    
    float defaultTip = self.defaultTip.text.floatValue;
    
    NSLog( @"this is the default tip %0.2f" , defaultTip);
    
    [defaults setFloat:defaultTip forKey:@"defaultTipAmount"];
    [defaults synchronize];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[settingsViewController alloc] init] animated:YES];
}

@end
