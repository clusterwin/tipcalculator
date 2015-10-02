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
    [ self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
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
    [self.view endEditing:YES];
    [self updateValues];
    
}

- (IBAction)sliderChanged:(id)sender {
    int tipRate = floor(self.tipSlider.value*100);
    self.TipRateLabel.text = [NSString stringWithFormat:@"%d%%",tipRate];
    [self updateValues];
}

- (void)updateValues{
    float billAmount = [self.billTextField.text floatValue];
    float tipAmount = billAmount * floor(self.tipSlider.value*100)/100;
    float totalAmount = tipAmount + billAmount;
    self.tipLable.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount];
    self.halfTipLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount/2];
    self.thirdTipLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount/3];
    self.quarterTipLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount/4];
}

- (void)onSettingsButton{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];

}
@end
