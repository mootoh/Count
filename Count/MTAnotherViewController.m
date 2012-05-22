//
//  MTViewController.m
//  Count
//
//  Created by Motohiro Takayama on 5/21/12.
//  Copyright (c) 2012 mootoh.net. All rights reserved.
//

#import "MTAnotherViewController.h"

@interface MTAnotherViewController ()

@end

@implementation MTAnotherViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)gesture;
{
    NSLog(@"aaaaaaaaaaa");
}

@end
