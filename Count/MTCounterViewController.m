//
//  MTCounterViewController.m
//  Count
//
//  Created by Motohiro Takayama on 5/21/12.
//  Copyright (c) 2012 mootoh.net. All rights reserved.
//

#import "MTCounterViewController.h"
#import <CoreData/CoreData.h>
#import "Countee.h"
#import "Count.h"
#import "MTAppDelegate.h"

@interface MTCounterViewController ()

@end

@implementation MTCounterViewController
@synthesize titleLabel;
@synthesize countTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setTitleLabel:nil];
    [self setCountTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void) collectAllCounts
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

    for (Count *count in fetchedObjects) {
        NSLog(@"count = %d, %@", [count.count intValue], count.counted_at);
    }
}

- (IBAction)recordCount:(id)sender
{
    MTAppDelegate *appDelegate = (MTAppDelegate *)[UIApplication sharedApplication].delegate;
    Count *count = [NSEntityDescription insertNewObjectForEntityForName:@"Count" inManagedObjectContext:appDelegate.managedObjectContext];
    NSString *input = countTextField.text;
    count.count = [NSNumber numberWithInt:[input intValue]];
    count.counted_at = [NSDate new];

    NSError *error = nil;
    [appDelegate.managedObjectContext save:&error];
    if (error) {
        NSLog(@"error in saving: %@", [error localizedDescription]);
        return;
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"countEnteredToVisualizer"])
        [self recordCount:sender];
}
@end