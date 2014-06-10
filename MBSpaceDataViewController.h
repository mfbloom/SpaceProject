//
//  MBSpaceDataViewController.h
//  UITable App
//
//  Created by Michael Bloom on 6/4/14.
//  Copyright (c) 2014 Michael Bloom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBSpaceObject.h"

@interface MBSpaceDataViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic)MBSpaceObject *spaceObject;

@end
