//
//  ViewController.h
//  CoreDataAppTwo
//
//  Created by lin on 15/7/17.
//  Copyright (c) 2015年 lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DetailViewController.h"
#import "ShoppingCartMaster.h"
#import "ShoppingCartDetail.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) NSArray *labelTexts;
@property (strong, nonatomic) NSArray *labels;
@property (strong, nonatomic) NSMutableArray *textFields;
@property (strong, nonatomic) UIButton *addButton;

@end

