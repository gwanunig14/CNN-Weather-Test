//
//  CWTCellTableViewCell.h
//  CNN Weather Test
//
//  Created by TJ Mercer on 10/20/16.
//  Copyright © 2016 TJ Mercer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWTData.h"

@interface CWTCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *forecastImage;
@property (weak, nonatomic) IBOutlet UILabel *day;
@property (weak, nonatomic) IBOutlet UILabel *dayDescription;
@property (weak, nonatomic) IBOutlet UILabel *high;
@property (weak, nonatomic) IBOutlet UILabel *low;
@property (weak, nonatomic) CWTData *info;

-(void)createCell;
-(void)clearCell;

@end
