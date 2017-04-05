//
//  SelectCell.h
//  XJMultiSelectDemo
//
//  Created by 邢进 on 2017/4/5.
//  Copyright © 2017年 邢进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *selectedState;

- (void)configureCell:(id)model;


@end
