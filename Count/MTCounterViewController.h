//
//  MTCounterViewController.h
//  Count
//
//  Created by Motohiro Takayama on 5/21/12.
//  Copyright (c) 2012 mootoh.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTCounterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *countTextField;

- (IBAction)recordCount:(id)sender;

@end
