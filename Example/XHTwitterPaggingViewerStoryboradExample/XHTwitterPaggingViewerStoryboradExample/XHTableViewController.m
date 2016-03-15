//
//  XHTableViewController.m
//  TwitterPagging
//
//  Created by 曾 宪华 on 14-6-21.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHTableViewController.h"

@interface XHTableViewController ()

@end

@implementation XHTableViewController

- (void)loadDataSource {
    self.dataSource = (NSMutableArray *)@[@"A twitter like navigation bar, page viewer.", @"A twitter like navigation bar, page viewer.", @"A twitter like navigation bar, page viewer.", @"A twitter like navigation bar, page viewer.", @"A twitter like navigation bar, page viewer.", @"A twitter like navigation bar, page viewer.", @"A twitter like navigation bar, page viewer.", @"A twitter like navigation bar, page viewer.", @"A twitter like navigation bar, page viewer.", @"A twitter like navigation bar, page viewer.", @"A twitter like navigation bar, page viewer.", @"A twitter like navigation bar, page viewer.", @"A twitter like navigation bar, page viewer.", @"A twitter like navigation bar, page viewer."];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (!self.showPushDetail) {
        UIEdgeInsets edgeInsets = self.tableView.contentInset;
        edgeInsets.top = ([XHFoundationCommon isIOS7] ? 64 : 0);
        self.tableView.contentInset = edgeInsets;
        self.tableView.scrollIndicatorInsets = edgeInsets;
    }
    [self loadDataSource];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.numberOfLines = 0;
    }
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icon_avator%d", (indexPath.row % 3)]];
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XHTableViewController *detailTableViewController = [[[self class] alloc] init];
    detailTableViewController.showPushDetail = YES;
    detailTableViewController.title = @"Detail";
    [self.navigationController pushViewController:detailTableViewController animated:YES];
}

@end
