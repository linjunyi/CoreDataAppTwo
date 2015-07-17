//
//  Customer.h
//  CoreDataAppTwo
//
//  Created by lin on 15/7/17.
//  Copyright (c) 2015年 lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ShoppingCartMaster;

@interface Customer : NSManagedObject

@property (nonatomic, retain) NSNumber * customerID;
@property (nonatomic, retain) NSString * customerName;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) ShoppingCartMaster *cart;

@end
