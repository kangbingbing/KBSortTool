# KBSortTool
根据模型的属性按照首字母进行排序, 或者数组中的字符串按首字母排序,方便展示,以及检索

![示例 gif](https://ws1.sinaimg.cn/large/9e1008a3ly1fe15sj8ealg20ac0ijqsz.gif)


# use?


##传入字符串数组
	NSArray *array = @[@"阿布",@"阿西",@"aaa",@"八书",@"额额",@"大望路",@"故宫",@"广告",@"国家图书馆",@"国贸",@"guomao",@"欢乐谷",@"hujiaou",@"机器人",@"建国门",@"焦作",@"君子",@"李冰冰",@"李军",@"王一",@"天安门",@"太行山",@"双井",@"李四",@"永安里",@"73273",@" abcde"];
	
    // 数据源字典
    self.dataDic = [KBSortTool sortWithDataArray:array andPropertyName:nil];
    
    // 组头
    self.indexArray = [KBSortTool sortFirstStrWithArray:self.dataDic.allKeys];
    
    
##传入模型数组
	// 路径
	NSString *path = [[NSBundle mainBundle]pathForResource:@"friends.plist" ofType:nil];
	
    // 模型数组
    self.netArray = [KBModel mj_objectArrayWithFile:path];
    
    // 数据源
    self.dataDic = [KBSortTool sortWithDataArray:_netArray andPropertyName:@"name"];
    
    // 所有 key 组头
    self.indexArray = [KBSortTool sortFirstStrWithArray:self.dataDic.allKeys];