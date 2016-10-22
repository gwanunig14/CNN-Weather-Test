//
//  CWTWeatherDataPull.m
//  CNN Weather Test
//
//  Created by TJ Mercer on 10/20/16.
//  Copyright © 2016 TJ Mercer. All rights reserved.
//

#import "CWTWeatherDataPull.h"
#import <CoreLocation/CoreLocation.h>

@implementation CWTWeatherDataPull

-(CWTData *)today{
    NSString * page = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&appid=086eac4ee882807bb363301370dac1f0&units=imperial", self.latitude, self.longitude];
    
    NSDictionary * weatherInfo = [self dataFromURL:page];
    
    NSTimeInterval d = [weatherInfo[@"dt"] doubleValue];
    NSDate *stringDate = [NSDate dateWithTimeIntervalSince1970:d];
    
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM-dd"];
    
    CWTData *today = [CWTData new];
    today.low = weatherInfo[@"main"][@"temp_min"];
    today.high = weatherInfo[@"main"][@"temp_max"];
    today.pressure = weatherInfo[@"main"][@"pressure"];
    today.humidity = weatherInfo[@"main"][@"humidity"];
    today.day = @"Today";
    today.date = [dateFormatter stringFromDate:stringDate];
    today.wind = weatherInfo[@"wind"][@"speed"];
    today.forecast = weatherInfo[@"weather"][0][@"description"];
    today.forecastImage = weatherInfo[@"weather"][0][@"icon"];
    today.windDegree = weatherInfo[@"wind"][@"speed"];
    return today;
}

-(NSArray *)fiveDay{
    NSMutableArray *days = [NSMutableArray new];
    NSString * page = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?lat=%f&lon=%f&appid=086eac4ee882807bb363301370dac1f0&units=imperial", self.latitude, self.longitude];
    
    NSDictionary * weatherInfo = [self dataFromURL:page];
    int i = 0;
    for (NSDictionary *day in weatherInfo[@"list"]) {
        if (i != 0 && i < 5){
            NSTimeInterval d = [day[@"dt"] doubleValue];
            NSDate *stringDate = [NSDate dateWithTimeIntervalSince1970:d];
            
            NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MMM-dd"];
            
            NSDateFormatter *weekDayFormatter = [[NSDateFormatter alloc] init];
            [weekDayFormatter setDateFormat:@"EEEE"];
            
            CWTData *forecastDay = [CWTData new];
            forecastDay.low = day[@"temp"][@"min"];
            forecastDay.high = day[@"temp"][@"max"];
            forecastDay.pressure = day[@"pressure"];
            forecastDay.humidity = day[@"humidity"];
            forecastDay.day = i == 1? @"Tomorrow" : [weekDayFormatter stringFromDate:stringDate];
            forecastDay.date = [dateFormatter stringFromDate:stringDate];
            forecastDay.wind = day[@"speed"];
            forecastDay.forecast = day[@"weather"][0][@"description"];
            forecastDay.forecastImage = day[@"weather"][0][@"icon"];
            [days addObject:forecastDay];
        }
        i++;
    }
    return days;
}

-(NSDictionary *)dataFromURL:(NSString *)page{
    __block NSDictionary *json;
    
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:page]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                NSError * jsonError = nil;
                json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                dispatch_semaphore_signal(sema);
            }] resume];
    
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
    return json;
}

@end
