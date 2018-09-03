//
//  ViewController.m
//  WQNnusualCategory
//
//  Created by wangda on 2018/9/3.
//  Copyright © 2018年 wangda. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"
#import "UIViewController+WQNnususl.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,assign) BOOL unusual;

@end
static NSString *const WQNUSUALCATEGORYCELL = @"WQNUSUALCATEGORYCELL";
@implementation ViewController

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataSource;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.rowHeight = 60;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.unusual = NO;
            [self refreshData];
        }];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:WQNUSUALCATEGORYCELL];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
    __weak __typeof(self)weakSelf = self;
    self.unusualClickblock = ^() {
        weakSelf.unusual = YES;
        [weakSelf removeUnusualView];
        [weakSelf refreshData];
    };
    [self refreshData];
}

- (void)refreshData {
    NSArray *dataArr = [NSArray array];
    if (self.unusual) {
        dataArr = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    } else {
        dataArr = @[];
    }
    self.dataSource = [NSMutableArray arrayWithArray:dataArr];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.tableView.mj_header isRefreshing]) {
            [self.tableView.mj_header endRefreshing];
        }
        if (self.dataSource.count == 0) {
            [self showWQUnusualMessage:@"没有内容,点击重试" unusualImageName:nil superView:self.tableView isNeedcontentSet:NO];
        }
        [self.tableView reloadData];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WQNUSUALCATEGORYCELL forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
