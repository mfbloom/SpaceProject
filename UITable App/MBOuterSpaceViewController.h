//
//  MBOuterSpaceViewController.h
//  UITable App
//
//  Created by Michael Bloom on 5/30/14.
//  Copyright (c) 2014 Michael Bloom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBAddSpaceObjectViewController.h"

@interface MBOuterSpaceViewController : UITableViewController <MBAddSpaceObjectViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *planets;
@property (strong, nonatomic) NSMutableArray *addedSpaceObjects;

@end
