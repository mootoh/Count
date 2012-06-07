//
//  MTVisualizerViewController.h
//  Count
//
//  Created by Motohiro Takayama on 5/22/12.
//  Copyright (c) 2012 mootoh.net. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PCLineChartView;

@interface MTVisualizerViewController : UIViewController
@property (weak, nonatomic) IBOutlet PCLineChartView *lineChartView;
@end
