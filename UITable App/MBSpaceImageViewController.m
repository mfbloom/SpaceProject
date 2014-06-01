//
//  MBSpaceImageViewController.m
//  UITable App
//
//  Created by Michael Bloom on 6/1/14.
//  Copyright (c) 2014 Michael Bloom. All rights reserved.
//

#import "MBSpaceImageViewController.h"

@interface MBSpaceImageViewController ()

@end

@implementation MBSpaceImageViewController

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
    
    self.imageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Jupiter.jpg"]];
    
    self.scrollView.contentSize = self.imageView.frame.size;
    
    [self.scrollView addSubview:self.imageView];
    
    self.scrollView.delegate = self; //register me (this view controller) to listen to evetnts from scroll view.
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView //which view do we scroll in on
{
    
    
    return self.imageView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
