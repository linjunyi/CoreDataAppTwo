//
//  ViewController.m
//  CoreDataAppTwo
//
//  Created by lin on 15/7/17.
//  Copyright (c) 2015年 lin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    for(NSInteger i = 0; i < self.labels.count; i++){
        UILabel *label = (UILabel *)self.labels[i];
        label.text = self.labelTexts[i];
        label.frame = CGRectMake(40, 100+50*i, 40, 100);
        label.textColor = [UIColor whiteColor];
        UITextField *textFiled = (UITextField *)self.textFields[i];
        textFiled.frame = CGRectMake( 0, 0, 220,34);
        textFiled.center = CGPointMake(label.center.x + 160, label.center.y);
        textFiled.layer.cornerRadius = 8;
        textFiled.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:label];
        [self.view addSubview:textFiled];
    }
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addButton.frame = CGRectMake(0, 0, 120, 40);
    self.addButton.center = CGPointMake(self.view.center.x, 400);
    self.addButton.layer.cornerRadius = 8;
    self.addButton.backgroundColor = [UIColor whiteColor];
    [self.addButton setTitle:@"加入购物车" forState:UIControlStateNormal];
    [self.addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.addButton.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [self.addButton addTarget:self action:@selector(addButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addButton];
    
    //[self insertDataIntoSqlite];
    [self showDataInSqlite];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addButtonClicked {
    [self insertDataIntoDetail];
    [self showDataInDetail];
    [self.navigationController pushViewController:[[DetailViewController alloc] init] animated:YES];
}

- (void)insertDataIntoSqlite {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    ShoppingCartMaster *master = [NSEntityDescription insertNewObjectForEntityForName:@"ShoppingCartMaster" inManagedObjectContext:delegate.managedObjectContext];
    master.cartID = @1;
    master.customerID = @1;
    [delegate.managedObjectContext insertObject:master];
    [delegate saveContext];
}

- (void)showDataInSqlite {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ShoppingCartMaster" inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:entity];
    NSArray *result = [delegate.managedObjectContext executeFetchRequest:request error:nil];
    for(NSInteger i=0; i<result.count; i++) {
        ShoppingCartMaster *master = result[i];
        NSLog(@"%@",master.customerID);
    }
}

- (void)insertDataIntoDetail {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    ShoppingCartDetail *detail = [NSEntityDescription insertNewObjectForEntityForName:@"ShoppingCartDetail" inManagedObjectContext:delegate.managedObjectContext];
    detail.customerID = @1;
    detail.cartID     = @1;
    detail.productSysNo = @1;
    UITextField *field = (UITextField *)self.textFields[0];
    detail.productID = [NSNumber numberWithInteger:[field.text integerValue]];
    field = (UITextField *)self.textFields[1];
    detail.productName = field.text;
    field = (UITextField *)self.textFields[2];
    detail.currentPrice = [NSNumber numberWithInteger:[field.text integerValue]];
    [delegate.managedObjectContext insertObject:detail];
    [delegate saveContext];
}

- (void)showDataInDetail {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ShoppingCartDetail" inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:entity];
    NSArray *result = [delegate.managedObjectContext executeFetchRequest:request error:nil];
    for(int i=0; i<result.count; i++) {
        ShoppingCartDetail *detail = (ShoppingCartDetail *)result[i];
        NSLog(@"名称: %@    编号: %d    价格:%.2f", detail.productName, [detail.productID intValue], [detail.currentPrice floatValue]);
    }
}

#pragma property

- (NSArray *)labelTexts {
    if(!_labelTexts) {
        _labelTexts = [NSArray arrayWithObjects:@"编号:", @"名称:", @"价格:", nil];
    }
    return _labelTexts;
}

- (NSArray *)labels {
    if(!_labels) {
        _labels = [NSArray arrayWithObjects:[[UILabel alloc] init], [[UILabel alloc] init], [[UILabel alloc] init], nil];
    }
    return _labels;
}

- (NSMutableArray *)textFields {
    if(!_textFields) {
        self.textFields = [NSMutableArray array];
        for(NSInteger i = 0; i < 3; i++) {
            UITextField *textField = [[UITextField alloc] init];
            [self.textFields addObject:textField];
        }
    }
    return _textFields;
}

@end
