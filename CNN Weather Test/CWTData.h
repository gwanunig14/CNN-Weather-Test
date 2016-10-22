//
//  CWTData.h
//  CNN Weather Test
//
//  Created by TJ Mercer on 10/20/16.
//  Copyright © 2016 TJ Mercer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWTData : NSObject

@property (nonatomic) NSString *day;
@property (nonatomic) NSString *date;
@property (nonatomic) NSNumber *high;
@property (nonatomic) NSNumber *low;
@property (nonatomic) NSString *forecast;
@property (nonatomic) NSString *forecastImage;
@property (nonatomic) NSString *cellImage;
@property (nonatomic) NSNumber *humidity;
@property (nonatomic) NSNumber *pressure;
@property (nonatomic) NSNumber *wind;
@property (nonatomic) NSNumber *windDegree;
@property (nonatomic) NSString *direction;

@end
