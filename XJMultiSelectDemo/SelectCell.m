//
//  SelectCell.m
//  XJMultiSelectDemo
//
//  Created by 邢进 on 2017/4/5.
//  Copyright © 2017年 邢进. All rights reserved.
//

#import "SelectCell.h"

@implementation SelectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)configureCell:(id)model {
    if (model == @"0") {
        _selectedState.backgroundColor = [UIColor grayColor];
    } else {
        _selectedState.backgroundColor = [UIColor orangeColor];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
