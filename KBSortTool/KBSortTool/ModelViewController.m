//
//  ModelViewController.m
//  KBSortTool
//
//  Created by kangbing on 16/8/18.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import "ModelViewController.h"
#import "KBSortTool.h"
#import "KBModel.h"
#import "MJExtension.h"

@interface ModelViewController ()

@property (nonatomic, strong) NSDictionary *dataDic;

@property (nonatomic, strong) NSArray *indexArray;

@property (nonatomic, strong) NSArray *netArray;

@property (nonatomic, strong) NSDictionary *netDict;

@end

@implementation ModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"friends.plist" ofType:nil];
    self.netArray = [KBModel mj_objectArrayWithFile:path];
    
    self.dataDic = [KBSortTool sortWithDataArray:_netArray andPropertyName:@"name"];
    
    self.indexArray = [KBSortTool sortFirstStrWithArray:self.dataDic.allKeys];
    
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    // 索引定组
    return self.indexArray.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *value = [self.dataDic objectForKey:_indexArray[section]];
    // 根据索引取值, 取完返回
    return value.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cellindex";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    NSArray *value = [_dataDic objectForKey:_indexArray[indexPath.section]];
    KBModel *model = value[indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.pic;
    
    NSLog(@"%@",model.name);
    
    return cell;
}

#pragma mark 组头
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return _indexArray[section];
    
}

#pragma mark 索引
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    return _indexArray;
    
}


- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    NSLog(@"%@---%lu",title,index);
    return index;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
