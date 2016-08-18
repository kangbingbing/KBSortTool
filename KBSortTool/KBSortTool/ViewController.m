//
//  ViewController.m
//  KBSortTool
//
//  Created by kangbing on 16/8/18.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import "ViewController.h"
#import "ModelViewController.h"
#import "StringViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *array = @[@[@"模型数组"],@[@"字符串数组"]];
    self.array = array;
    
    [self prepareTableView];
    
    
}

- (void)prepareTableView{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    // 索引定组
    return self.array.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // 根据索引取值, 取完返回
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cellindex";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    NSArray *strarr = self.array[indexPath.section];
    cell.textLabel.text = strarr[indexPath.row];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    if (indexPath.section == 0) {
        
        ModelViewController *modelVC = [[ModelViewController alloc]init];
        [self.navigationController pushViewController:modelVC animated:YES];
    }else{
    
        StringViewController *stringVC = [[StringViewController alloc]init];
        [self.navigationController pushViewController:stringVC animated:YES];
    
    }



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
