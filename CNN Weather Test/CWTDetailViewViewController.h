//
//  CWTDetailViewViewController.h
//  CNN Weather Test
//
//  Created by TJ Mercer on 10/20/16.
//  Copyright © 2016 TJ Mercer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWTData.h"

@interface CWTDetailViewViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *forecastImage;
@property (weak, nonatomic) IBOutlet UILabel *day;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *high;
@property (weak, nonatomic) IBOutlet UILabel *low;
@property (weak, nonatomic) IBOutlet UILabel *humidityPercentage;
@property (weak, nonatomic) IBOutlet UILabel *windSpeed;
@property (weak, nonatomic) IBOutlet UILabel *pressureAmount;
@property (weak, nonatomic) IBOutlet UILabel *forecast;
@property (weak, nonatomic) CWTData *info;

@end
