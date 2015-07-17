//
//  ShoppingCartMaster.h
//  CoreDataAppTwo
//
//  Created by lin on 15/7/17.
//  Copyright (c) 2015年 lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface ShoppingCartMaster : NSManagedObject

@property (nonatomic, retain) NSNumber * cartID;
@property (nonatomic, retain) NSNumber * customerID;
@property (nonatomic, retain) NSManagedObject *customer;
@property (nonatomic, retain) NSSet *detail;
@end

@interface ShoppingCartMaster (CoreDataGeneratedAccessors)

- (void)addDetailObject:(NSManagedObject *)value;
- (void)removeDetailObject:(NSManagedObject *)value;
- (void)addDetail:(NSSet *)values;
- (void)removeDetail:(NSSet *)values;

@end
