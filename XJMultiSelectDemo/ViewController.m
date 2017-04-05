//
//  ViewController.m
//  XJMultiSelectDemo
//
//  Created by 邢进 on 2017/4/5.
//  Copyright © 2017年 邢进. All rights reserved.
//

#import "ViewController.h"
#import "XJTableHelper.h"
#import "SelectCell.h"
#import "UIView+TapBlock.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic)XJTableHelper *tableHelper;
@property (strong, nonatomic)NSMutableArray *dataArray;

@end

@implementation ViewController

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [@[] mutableCopy];
        for (int i = 0; i < 20; i++) {
            [_dataArray addObject:@"0"];
        }
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     这里拿最常见的cell多选举例:
     任何view的点击事件都能用到,小巧但令人感动😝
     */
    self.title = @"table多选Demo";
    __weak typeof(self) weakSelf = self;
    //XJTableHelper
    _tableHelper = [[XJTableHelper alloc] initWithidentifier:@"SelectCell" cellConfigureBlock:^(id cell, id model, NSIndexPath *indexPath) {
        //重头戏来了 *****  view点击block  ******
        [cell tapView:^(id sender) {
            //需要改变数据源,重新配置cell
            [cell configureCell:[weakSelf changeModel:model index:indexPath]];
        }];
        [cell configureCell:model];
    }];
    _table.dataSource = _tableHelper;
    [_tableHelper addModels:self.dataArray];
    [_table reloadData];
}

//改变数据源
- (id)changeModel:(id)model index:(NSIndexPath *)index {
    id temp = _dataArray[index.row] == @"0" ? @"1" : @"0";
    [self.dataArray replaceObjectAtIndex:index.row withObject:temp];
    [self.tableHelper.dataArray replaceObjectAtIndex:index.row withObject:temp];
    self.title = [NSString stringWithFormat:@"已选 %ld 个", [self resultOfSelected]];
    return temp;
}

//title显示结果
- (NSInteger)resultOfSelected {
    NSMutableArray *selectedArray = [@[] mutableCopy];
    for (id model in _dataArray) {
        if (model == @"1") {
            [selectedArray addObject:model];
        }
    }
    return selectedArray.count;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
