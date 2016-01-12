//
//  MMDropDownTableViewController.m
//  下拉菜单
//
//  Created by mm on 15/12/5.
//  Copyright © 2015年 mm. All rights reserved.
//

#import "MMDropDownTableViewController.h"

@interface MMDropDownTableViewController ()

@end

@implementation MMDropDownTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"臭傻逼";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"贱脑残";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"大畜生";
    }
    
    return cell;
}

@end
