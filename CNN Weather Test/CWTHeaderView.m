//
//  CWTHeaderView.m
//  CNN Weather Test
//
//  Created by TJ Mercer on 10/20/16.
//  Copyright © 2016 TJ Mercer. All rights reserved.
//

#import "CWTHeaderView.h"

@implementation CWTHeaderView

-(void)displayForecastWithData:(CWTData *)data{
    self.date.text = [NSString stringWithFormat:@"%@, %@", data.day, data.date];
    self.high.text = [NSString stringWithFormat:@"%.0d%@", data.high.intValue, @"\u00B0"];
    self.low.text = [NSString stringWithFormat:@"%.0d%@", data.low.intValue, @"\u00B0"];
    self.dayDescription.text = data.forecast;
    [self.forecastImage setImage:[UIImage imageNamed:data.forecastImage]];
    self.info = data;
}

@end
