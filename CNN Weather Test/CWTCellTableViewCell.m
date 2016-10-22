//
//  CWTCellTableViewCell.m
//  CNN Weather Test
//
//  Created by TJ Mercer on 10/20/16.
//  Copyright © 2016 TJ Mercer. All rights reserved.
//

#import "CWTCellTableViewCell.h"

@implementation CWTCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)createCell{
    [self.day setText:_info.day];
    [self.high setText:[NSString stringWithFormat:@"%.0d%@", _info.high.intValue, @"\u00B0"]];
    [self.low setText:[NSString stringWithFormat:@"%.0d%@", _info.low.intValue, @"\u00B0"]];
    [self.dayDescription setText:_info.forecast];
    [self.forecastImage setImage:[UIImage imageNamed:_info.cellImage]];
}

@end
