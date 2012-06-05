//
//  Count.h
//  Count
//
//  Created by 征大 高山 on 6/5/12.
//  Copyright (c) 2012 mootoh.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Countee;

@interface Count : NSManagedObject

@property (nonatomic, retain) NSNumber * count;
@property (nonatomic, retain) NSDate * counted_at;
@property (nonatomic, retain) Countee *countee;

@end
