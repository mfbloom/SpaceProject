//
//  MBSpaceImageViewController.h
//  UITable App
//
//  Created by Michael Bloom on 6/1/14.
//  Copyright (c) 2014 Michael Bloom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBSpaceObject.h"

@interface MBSpaceImageViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic)  UIImageView *imageView;
@property (strong,nonatomic) MBSpaceObject *spaceObject;
@end
