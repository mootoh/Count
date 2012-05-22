//
//  MTCounterViewController.m
//  Count
//
//  Created by Motohiro Takayama on 5/21/12.
//  Copyright (c) 2012 mootoh.net. All rights reserved.
//

#import "MTCounterViewController.h"

@interface MTCounterViewController ()

@end

@implementation MTCounterViewController

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
