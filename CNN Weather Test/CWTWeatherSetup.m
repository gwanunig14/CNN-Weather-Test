//
//  CWTWeatherSetup.m
//  CNN Weather Test
//
//  Created by TJ Mercer on 10/20/16.
//  Copyright © 2016 TJ Mercer. All rights reserved.
//

#import "CWTWeatherSetup.h"
#import "CWTWeatherDataPull.h"

@interface CWTWeatherSetup ()

@property (nonatomic) CWTWeatherDataPull *dataPull;

@end

@implementation CWTWeatherSetup

+(CWTWeatherSetup *)weatherData
{
    static dispatch_once_t create;
    static CWTWeatherSetup * singleton=nil;
    
    dispatch_once (&create, ^{
        singleton = [[CWTWeatherSetup alloc]init];
    });
    
    return singleton;
}

-(CWTData *)currentWeather {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [self.locationManager startUpdatingLocation];
    
    self.dataPull = [[CWTWeatherDataPull alloc]init];
    self.dataPull.latitude = self.locationManager.location.coordinate.latitude;
    self.dataPull.longitude = self.locationManager.location.coordinate.longitude;
    if (!_currentWeather) {
        _currentWeather = self.dataPull.today;
        return _currentWeather;
    } else
        return _currentWeather;
}

-(NSArray *)fiveDay{
    if (!_fiveDay) {
        _fiveDay = self.dataPull.fiveDay;
        return _fiveDay;
    } else
        return _fiveDay;
}

@end
