//
//  MTViewController.h
//  Count
//
//  Created by Motohiro Takayama on 5/21/12.
//  Copyright (c) 2012 mootoh.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTAnotherViewController : UIViewController <UIGestureRecognizerDelegate>

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)gesture;

@end