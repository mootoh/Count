//
//  Countee.h
//  Count
//
//  Created by 征大 高山 on 6/5/12.
//  Copyright (c) 2012 mootoh.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Countee : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * unit;
@property (nonatomic, retain) NSManagedObject *counts;

@end
