//
//  JCNSStringViewController.m
//  JCClassExample
//
//  Created by molin on 16/1/5.
//  Copyright © 2016年 molin. All rights reserved.
//

#import "JCNSStringViewController.h"

@interface JCNSStringViewController ()

@end

@implementation JCNSStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str1 = @"class NSString";
    
    NSString *resultOfLength = [NSString stringWithFormat:@"NSString *str = @\"class NSString\";\nstr.length ---> %@",[[NSNumber alloc]initWithInteger:str1.length]];
    [self addMethod:@"@property (readonly) NSUInteger length; //字符串长度" result:resultOfLength];
    
    resultOfLength = [NSString stringWithFormat:@"NSString *str = @\"class NSString; \nchar c = [str characterAtIndex:2]\nc ---> %C",[str1 characterAtIndex:2]];
    [self addMethod:@"- (unichar)characterAtIndex:(NSUInteger)index;//根据下标获取单个字符" result:resultOfLength];
    
    resultOfLength = [NSString stringWithFormat:@"NSString *str = @\"class NSString\";\nNSString *str1 = [str substringFromIndex:4];\nstr1 ---> %@",[str1 substringFromIndex:4]];
    [self addMethod:@"- (NSString *)substringFromIndex:(NSUInteger)from;//从给定下标开始到结束截取一段字符串" result:resultOfLength];
    
    resultOfLength = [NSString stringWithFormat:@"NSString *str = @\"class NSString\";\nNSString *str1 = [str substringToIndex:4];\nstr1 ---> %@",[str1 substringToIndex:4]];
    [self addMethod:@"- (NSString *)substringToIndex:(NSUInteger)to;//从第一个字符开始到给定的下标结束截取一段字符串" result:resultOfLength];
    
    resultOfLength = [NSString stringWithFormat:@"NSString *str = @\"class NSString\";\nNSString *str1 = [str substringWithRange:NSMakeRange(4, 7)];\nstr1 ---> %@",[str1 substringWithRange:NSMakeRange(4, 7)]];
    [self addMethod:@"- (NSString *)substringWithRange:(NSRange)range; //截取给定范围内的字符串" result:resultOfLength];

    resultOfLength = [NSString stringWithFormat:@"NSString *str = @\\\"class NSString\\\"; \nunichar c = [str characterAtIndex:2];\nc ---> a\n[str1 getCharacters:&c range:NSMakeRange(1, 5)];\nc ---> l"];
    [self addMethod:@"- (void)getCharacters:(unichar *)buffer range:(NSRange)range; " result:resultOfLength];
    
    [self addMethod:@"- (NSComparisonResult)compare:(NSString *)string; //比较两个字符串" result:@"NSString *str = @\\\"class NSString\\\";\n NSComparisonResult result = [str compare:@\"class NSString\"];\n    result ---> NSOrderedSame （完全一致的）\nNSComparisonResult 是个枚举\n 定义：{NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending};"];
    
    [self addMethod:@"- (NSComparisonResult)compare:(NSString *)string option (NSStringCompareOptions)mask; //按要求比较两个字符串 \nNSStringCompareOptions 枚举：\n    NSCaseInsensitiveSearch = 1  不区分大小写比较\n\n    NSLiteralSearch = 2  区分大小写比较\n\n    NSBackwardsSearch = 4  从字符串末尾开始搜索\n\n    NSAnchoredSearch = 8  搜索限制范围的字符串\n\n    NSNumbericSearch = 64  按照字符串里的数字为依据，算出顺序。例如 Foo2.txt < Foo7.txt < Foo25.txt\n\n    NSDiacriticInsensitiveSearch = 128  忽略 \"-\" 符号的比较\n\n    NSWidthInsensitiveSearch = 256  忽略字符串的长度，比较出结果\n\n    NSForcedOrderingSearch = 512  忽略不区分大小写比较的选项，并强制返回 NSOrderedAscending 或者NSOrderedDescending\n\n    NSRegularExpressionSearch = 1024 只能应用于rangeOfString:..,stringByReplacingOccurrencesOfString:...和 replaceOccurrencesOfString:... 方法。使用通用兼容的比较方法，如果设置此项，可以去掉 NSCaseInsensitiveSearch 和 NSAnchoredSearch\n" result:@""];
    [self addMethod:@"- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)compareRange;" result:@""];
    [self addMethod:@"- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)compareRange locale:(nullable id)locale;" result:@""];
    [self addMethod:@"- (NSComparisonResult)caseInsensitiveCompare:(NSString *)string;" result:@""];
    [self addMethod:@"- (NSComparisonResult)localizedCompare:(NSString *)string;" result:@""];
    [self addMethod:@"- (NSComparisonResult)localizedCaseInsensitiveCompare:(NSString *)string;" result:@""];
    [self addMethod:@"- (NSComparisonResult)localizedStandardCompare:(NSString *)string NS_AVAILABLE(10_6, 4_0);" result:@""];
    [self addMethod:@"- (BOOL)isEqualToString:(NSString *)aString;" result:@""];
    [self addMethod:@"- (BOOL)hasPrefix:(NSString *)str;" result:@""];
    [self addMethod:@"- (BOOL)hasSuffix:(NSString *)str;" result:@""];
    [self addMethod:@"- (NSString *)commonPrefixWithString:(NSString *)str options:(NSStringCompareOptions)mask;" result:@""];
    [self addMethod:@"- (BOOL)containsString:(NSString *)str NS_AVAILABLE(10_10, 8_0);" result:@""];
    [self addMethod:@"- (BOOL)localizedCaseInsensitiveContainsString:(NSString *)str NS_AVAILABLE(10_10, 8_0);" result:@""];
    [self addMethod:@"- (BOOL)localizedStandardContainsString:(NSString *)str NS_AVAILABLE(10_11, 9_0);" result:@""];
    [self addMethod:@"- (NSRange)localizedStandardRangeOfString:(NSString *)str NS_AVAILABLE(10_11, 9_0);" result:@""];
    [self addMethod:@"- (NSRange)rangeOfString:(NSString *)searchString;" result:@""];
    [self addMethod:@"- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask;" result:@""];
    [self addMethod:@"- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)searchRange;" result:@""];
    [self addMethod:@"- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)searchRange locale:(nullable NSLocale *)locale NS_AVAILABLE(10_5, 2_0);" result:@""];
    [self addMethod:@"- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet;" result:@""];
    [self addMethod:@"- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask;" result:@""];
    [self addMethod:@"- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask range:(NSRange)searchRange;" result:@""];
    [self addMethod:@"- (NSRange)rangeOfComposedCharacterSequenceAtIndex:(NSUInteger)index;" result:@""];
    [self addMethod:@"- (NSRange)rangeOfComposedCharacterSequencesForRange:(NSRange)range NS_AVAILABLE(10_5, 2_0);" result:@""];
    [self addMethod:@"- (NSString *)stringByAppendingString:(NSString *)aString;" result:@""];
    [self addMethod:@"- (NSString *)stringByAppendingFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);" result:@""];
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
