//
//  CWTWeatherSetup.h
//  CNN Weather Test
//
//  Created by TJ Mercer on 10/20/16.
//  Copyright © 2016 TJ Mercer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWTData.h"
#import <CoreLocation/CoreLocation.h>

@interface CWTWeatherSetup : NSObject

@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CWTData *currentWeather;
@property (nonatomic) NSArray *fiveDay;
+(CWTWeatherSetup *)weatherData;

@end
