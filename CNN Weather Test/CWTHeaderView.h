//
//  CWTHeaderView.h
//  CNN Weather Test
//
//  Created by TJ Mercer on 10/20/16.
//  Copyright © 2016 TJ Mercer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWTData.h"

@interface CWTHeaderView : UIView

@property (nonatomic) IBOutlet UILabel * date;
@property (nonatomic) IBOutlet UILabel * high;
@property (nonatomic) IBOutlet UILabel * low;
@property (nonatomic) IBOutlet UILabel * dayDescription;
@property (nonatomic) IBOutlet UIImageView * forecastImage;
@property (nonatomic) CWTData * info;

-(void)displayForecastWithData:(CWTData *)data;

@end
