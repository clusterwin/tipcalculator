//
//  TipViewController.m
//  TipCalculator
//
//  Created by Alex Lester on 27/09/2015.
//  Copyright (c) 2015 Alex Lester. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLable;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UILabel *TipRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *halfTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *quarterTipLabel;

- (IBAction)onTap:(id)sender;
- (IBAction)sliderChanged:(id)sender;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Tip Calculator";
    // Load defaults if they exist
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *previousBillAmount = [defaults objectForKey:@"bill_amount"];
    if(previousBillAmount){
        self.billTextField.text = previousBillAmount;
    }
    
    [ self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
    [self.billTextField becomeFirstResponder];
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
    [self updateValues];
}

- (IBAction)sliderChanged:(id)sender {
    [self updateValues];
}

- (void)updateValues{
    int tipRate = floor(self.tipSlider.value*100);
    self.TipRateLabel.text = [NSString stringWithFormat:@"%d%%",tipRate];
    float billAmount = [self.billTextField.text floatValue];
    float tipAmount = billAmount * floor(self.tipSlider.value*100)/100;
    float totalAmount = tipAmount + billAmount;
    self.tipLable.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount];
    self.halfTipLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount/2];
    self.thirdTipLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount/3];
    self.quarterTipLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount/4];
    if([self.billTextField.text length]!= 0){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.billTextField.text forKey:@"bill_amount"];
        [defaults synchronize];
    }
}

- (void)onSettingsButton{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}


- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipRate = [defaults integerForKey:@"default_tip_rate"];
    self.tipSlider.value = ((float)defaultTipRate)/100;

    [self updateValues];
}
@end
