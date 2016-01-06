//
//  JCClassViewController.m
//  JCClassExample
//
//  Created by molin on 16/1/5.
//  Copyright © 2016年 molin. All rights reserved.
//

#import "JCClassViewController.h"

@interface JCClassViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSDictionary *fontOfSize;

@property (nonatomic, assign) CGPoint tablePoint;

@end

@implementation JCClassViewController

#pragma mark - ViewController方法

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.methodsTableView];
    [self.view addSubview:self.logTextView];
    
    [self.view addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.view removeObserver:self forKeyPath:@"frame"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    self.methodsTableView.frame = self.view.frame;
    [self.methodsTableView reloadData];
    self.logTextView.frame = CGRectMake(0, self.view.bounds.size.height/3*2, self.view.bounds.size.width, self.view.bounds.size.height/3);
}

#pragma mark - 自定义方法

- (void)addMethod:(NSString *)method result:(id)result {
    [self.methods addObject:method];
    if (result) {
        [self.results addObject:[NSString stringWithFormat:@"%@",result]];
    }else {
        [self.results addObject:@""];
    }
    [self.methodsTableView reloadData];
}

- (NSMutableAttributedString *)propertySetColor:(NSString *)string {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string];
    NSMutableArray *attributeArray = [NSMutableArray new];
    NSRange range_0 = [string rangeOfString:@"@"];
    NSRange range_1_0 = [string rangeOfString:@"("];
    NSRange range_1_1 = [string rangeOfString:@")"];
    
    if (range_0.location != NSNotFound && range_1_0.location != NSNotFound) {
        NSDictionary *dic_0 = @{@"location":@(0),@"length":@(range_1_0.location),@"color":[UIColor colorWithHexString:@"b833a1"]};
        [attributeArray addObject:dic_0];
        
        NSString *sting_2 = [string substringWithRange:NSMakeRange(range_1_1.location+2, string.length-range_1_1.location-2)];
        NSArray *string_2_arr = [sting_2 componentsSeparatedByString:@" "];
        if (string_2_arr.count > 1) {
            NSString *className = string_2_arr[0];
            NSDictionary *dic_2 = @{@"location":@(range_1_1.location+2),@"length":@(className.length),@"color":[UIColor colorWithHexString:@"6f41a7"]};
            [attributeArray addObject:dic_2];
        }
    }
    
    NSString *string_0 = string;
    NSUInteger len = 0;
    while (range_1_0.location != NSNotFound) {
        if (range_1_0.location < range_1_1.location) {
            NSString *subString = [string substringWithRange:NSMakeRange(range_1_0.location+1+len, range_1_1.location-range_1_0.location-1)];
            NSArray *subStringArray = [subString componentsSeparatedByString:@","];
            if (subStringArray.count > 1) {
                NSUInteger location_sub = range_1_0.location+1;
                for (NSString *str in subStringArray) {
                    NSDictionary *dic_1 = @{@"location":@(location_sub+len),@"length":@(str.length),@"color":[UIColor colorWithHexString:@"b833a1"]};
                    [attributeArray addObject:dic_1];
                    location_sub += str.length+1;
                }
            }else {
                NSDictionary *dic_1 = @{@"location":@(range_1_0.location+1+len),@"length":@(range_1_1.location-range_1_0.location-1),@"color":[UIColor colorWithHexString:@"b833a1"]};
                [attributeArray addObject:dic_1];
            }
        }
        len += range_1_1.location+1;
        string_0 = [string_0 substringWithRange:NSMakeRange(range_1_1.location+1, string_0.length-range_1_1.location-1)];
        range_1_0 = [string_0 rangeOfString:@"("];
        range_1_1 = [string_0 rangeOfString:@")"];
    }
    NSRange range_2 = [string rangeOfString:@"//"];
    if (range_2.location != NSNotFound) {
        NSDictionary *dic = @{@"location":@(range_2.location),@"length":@(string.length-range_2.location),@"color":[UIColor colorWithHexString:@"008312"]};
        [attributeArray addObject:dic];
    }
    
    for (NSDictionary *dic in attributeArray) {
        NSUInteger location = [dic[@"location"] integerValue];
        NSUInteger length = [dic[@"length"] integerValue];
        UIColor *color = dic[@"color"];
        [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(location, length)];
    }
    
    return attributedString;
}

#pragma mark - 表格代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.methods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.attributedText = [self propertySetColor:self.methods[indexPath.row]];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.numberOfLines = 0;
    NSLog(@"cell.frame:(x:%f,y:%f,w:%f,h:%f)",cell.frame.origin.x,cell.frame.origin.y,cell.frame.size.width,cell.frame.size.height);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *string = self.methods[indexPath.row];
    CGFloat height = [string boundingRectWithSize:CGSizeMake(self.view.bounds.size.width-50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:self.fontOfSize context:nil].size.height;
    if (height<40) {
        if (string.length > 56) {
            return 60;
        }
        return 50;
    }
    return height+15;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSString *result = self.results[indexPath.row];
    if (![result isEqualToString:@""]) {
        if (self.logTextView.hidden) {
            self.logTextView.hidden = NO;
            self.tablePoint = tableView.contentOffset;
            [UIView animateWithDuration:0.5 animations:^{
                tableView.contentOffset = CGPointMake(tableView.contentOffset.x, tableView.contentOffset.y+self.logTextView.bounds.size.height);
            }];
        }
        self.logTextView.text = result;
    }else {
        self.logTextView.hidden = YES;
    }
}

#pragma mark - 手势

- (void)logTextViewWithTapGestureRecognizer:(UITapGestureRecognizer *)sender {
    self.logTextView.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
       self.methodsTableView.contentOffset = self.tablePoint;
    }];
}

#pragma mark - 视图懒加载

- (UITextView *)logTextView {
    if (!_logTextView) {
        _logTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height/3*2, self.view.bounds.size.width, self.view.bounds.size.height/3)];
        _logTextView.backgroundColor = [UIColor blackColor];
        _logTextView.textColor = [UIColor whiteColor];
        _logTextView.font = [UIFont systemFontOfSize:15];
        _logTextView.editable = NO;
        _logTextView.hidden = YES;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(logTextViewWithTapGestureRecognizer:)];
        tapGestureRecognizer.numberOfTapsRequired = 2;
        [_logTextView addGestureRecognizer:tapGestureRecognizer];
    }
    return _logTextView;
}

- (UITableView *)methodsTableView {
    if (!_methodsTableView) {
        _methodsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _methodsTableView.delegate = self;
        _methodsTableView.dataSource = self;
    }
    return _methodsTableView;
}

#pragma mark - 属性懒加载

- (NSMutableArray *)methods {
    if (!_methods) {
        _methods = [NSMutableArray new];
    }
    return _methods;
}

- (NSMutableArray *)results {
    if (!_results) {
        _results = [NSMutableArray new];
    }
    return _results;
}

- (NSDictionary *)fontOfSize {
    if (!_fontOfSize) {
        _fontOfSize = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    }
    return _fontOfSize;
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
