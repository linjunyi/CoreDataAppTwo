//
//  ShoppingCartDetail.h
//  CoreDataAppTwo
//
//  Created by lin on 15/7/17.
//  Copyright (c) 2015年 lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ShoppingCartMaster;

@interface ShoppingCartDetail : NSManagedObject

@property (nonatomic, retain) NSNumber * cartID;
@property (nonatomic, retain) NSNumber * currentPrice;
@property (nonatomic, retain) NSNumber * customerID;
@property (nonatomic, retain) NSNumber * productID;
@property (nonatomic, retain) NSString * productName;
@property (nonatomic, retain) NSNumber * productSysNo;
@property (nonatomic, retain) ShoppingCartMaster *master;

@end
