//
//  StringViewController.m
//  KBSortTool
//
//  Created by kangbing on 16/8/18.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import "StringViewController.h"
#import "KBSortTool.h"
#import "KBModel.h"

@interface StringViewController ()

@property (nonatomic, strong) NSDictionary *dataDic;

@property (nonatomic, strong) NSArray *indexArray;

@end

@implementation StringViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *array = @[@"阿布",@"阿西",@"aaa",@"八书",@"额额",@"大望路",@"故宫",@"广告",@"国家图书馆",@"国贸",@"guomao",@"欢乐谷",@"hujiaou",@"机器人",@"建国门",@"焦作",@"君子",@"李冰冰",@"李军",@"王一",@"天安门",@"太行山",@"双井",@"李四",@"永安里",@"73273",@" abcde"];


    self.dataDic = [KBSortTool sortWithDataArray:array andPropertyName:@"name"];
    
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
    
    NSArray *value = [self.dataDic objectForKey:_indexArray[indexPath.section]];
    cell.textLabel.text = value[indexPath.row];
    
    
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
