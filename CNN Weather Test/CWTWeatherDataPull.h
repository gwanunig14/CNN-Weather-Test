//
//  CWTWeatherDataPull.h
//  CNN Weather Test
//
//  Created by TJ Mercer on 10/20/16.
//  Copyright © 2016 TJ Mercer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWTData.h"

@interface CWTWeatherDataPull : NSObject

@property (nonatomic) float latitude;
@property (nonatomic) float longitude;

@property (nonatomic) NSArray *fiveDay;
@property (nonatomic) CWTData *today;

@end
