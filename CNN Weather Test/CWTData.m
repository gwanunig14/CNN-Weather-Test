//
//  CWTData.m
//  CNN Weather Test
//
//  Created by TJ Mercer on 10/20/16.
//  Copyright © 2016 TJ Mercer. All rights reserved.
//

#import "CWTData.h"

@implementation CWTData

-(NSString *)cellImage {
    NSMutableString *cell = _forecastImage.mutableCopy;
    NSRange range = NSMakeRange(2, 1);
    [cell deleteCharactersInRange:range];
    [cell appendString:@"n"];
    return cell;
}

-(NSString *)direction{
    if (self.windDegree) {
        NSString *angle;
        int degree = self.windDegree.intValue;
        if (degree < 22.5 || degree > 337.5)
            angle = @"N";
        else if (degree < 67.5)
            angle = @"NE";
        else if (degree < 112.5)
            angle = @"E";
        else if (degree < 157.5)
            angle = @"SE";
        else if (degree < 202.5)
            angle = @"S";
        else if (degree < 247.5)
            angle = @"SW";
        else if (degree <292.5)
            angle = @"W";
        else if (degree < 337.5)
            angle = @"NW";
        
        return angle;
    } else
        return nil;
}

@end
