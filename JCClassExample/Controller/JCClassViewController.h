//
//  JCClassViewController.h
//  JCClassExample
//
//  Created by molin on 16/1/5.
//  Copyright © 2016年 molin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIColor+Hexadecimal.h"

@interface JCClassViewController : UIViewController

@property (nonatomic, strong) UITextView     *logTextView;

@property (nonatomic, strong) UITableView    *methodsTableView;

@property (nonatomic, strong) NSMutableArray *methods;

@property (nonatomic, strong) NSMutableArray *results;

- (void)addMethod:(NSString *)method result:(id)result;

@end
