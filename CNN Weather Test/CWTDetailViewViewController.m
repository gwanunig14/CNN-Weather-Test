//
//  CWTDetailViewViewController.m
//  CNN Weather Test
//
//  Created by TJ Mercer on 10/20/16.
//  Copyright © 2016 TJ Mercer. All rights reserved.
//

#import "CWTDetailViewViewController.h"

@interface CWTDetailViewViewController ()

@end

@implementation CWTDetailViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.forecastImage setImage:[UIImage imageNamed:self.info.forecastImage]];
    self.day.text = self.info.day;
    self.date.text = self.info.date;
    self.high.text = [NSString stringWithFormat:@"%.0d%@", self.info.high.intValue, @"\u00B0"];
    self.low.text = [NSString stringWithFormat:@"%.0d%@", self.info.low.intValue, @"\u00B0"];
    self.humidityPercentage.text = [NSString stringWithFormat:@"%.0d %%", self.info.humidity.intValue];
    self.windSpeed.text = self.info.direction ? [NSString stringWithFormat:@"%.1d %@", self.info.wind.intValue, self.info.direction] : [NSString stringWithFormat:@"%.1d MPH", self.info.wind.intValue];
    self.pressureAmount.text = [NSString stringWithFormat:@"%.02d", self.info.pressure.intValue];
    self.forecast.text = self.info.forecast;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
