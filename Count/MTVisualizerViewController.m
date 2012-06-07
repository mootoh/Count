//
//  MTVisualizerViewController.m
//  Count
//
//  Created by Motohiro Takayama on 5/22/12.
//  Copyright (c) 2012 mootoh.net. All rights reserved.
//

#import "MTVisualizerViewController.h"
#import "PCLineChartView.h"
#import "MTAppDelegate.h"
#import "Count.h"
#import <CoreData/CoreData.h>
#import "math.h"

@interface MTVisualizerViewController ()

@end

@implementation MTVisualizerViewController
@synthesize lineChartView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    [self drawChart];
}

- (void)viewDidUnload
{
    [self setLineChartView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (NSArray *) collectAllCounts
{
    MTAppDelegate *appDelegate = (MTAppDelegate *)[UIApplication sharedApplication].delegate;

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Count" inManagedObjectContext:appDelegate.managedObjectContext];
    [fetchRequest setEntity:entity];

    NSError *error = nil;
    NSArray *fetchedObjects = [appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"error in fetching: %@", [error localizedDescription]);
    }
    return fetchedObjects;
}


- (void) drawChart
{
    lineChartView.autoscaleYAxis = YES;
    NSArray *counts = [self collectAllCounts];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd"];

    float minSofar = FLT_MAX;
    float maxSofar = FLT_MIN;

    int i = 0;
    NSMutableArray *countNumbers = [NSMutableArray arrayWithCapacity:counts.count];
    NSMutableArray *xLabels = [NSMutableArray arrayWithCapacity:counts.count];
    for (Count *count in counts) {
        NSNumber *num = count.count;
        float floatNum = [num floatValue];
        maxSofar = fmaxf(floatNum, maxSofar);
        minSofar = fminf(floatNum, minSofar);

        [countNumbers insertObject:num atIndex:i];
        NSString *date = [dateFormatter stringFromDate:count.counted_at];
        [xLabels insertObject:date atIndex:i];
        i++;
    }

    lineChartView.minValue = minSofar;
    lineChartView.maxValue = maxSofar;

    NSMutableArray *components = [NSMutableArray array];

    PCLineChartViewComponent *component = [[PCLineChartViewComponent alloc] init];
    [component setTitle:@"hoge"];
    [component setPoints:countNumbers];
    [component setShouldLabelValues:NO];

    [component setColour:PCColorYellow];
    [components addObject:component];

    [lineChartView setComponents:components];
    [lineChartView setXLabels:xLabels];

}

@end