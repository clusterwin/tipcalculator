//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Alex Lester on 1/10/2015.
//  Copyright (c) 2015 Alex Lester. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *defaultTipLabel;
@property (weak, nonatomic) IBOutlet UITextField *defaultTipTextField;
- (IBAction)onTap:(id)sender;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)onTap:(id)sender {
    int defaultRate = [self.defaultTipTextField.text intValue];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:defaultRate forKey:@"default_tip_rate"];
    [defaults synchronize];
    [self.view endEditing:YES];
    
}
@end
