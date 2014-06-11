//
//  MBAddSpaceObjectViewController.m
//  UITable App
//
//  Created by Michael Bloom on 6/5/14.
//  Copyright (c) 2014 Michael Bloom. All rights reserved.
//

#import "MBAddSpaceObjectViewController.h"


@interface MBAddSpaceObjectViewController ()

@end

@implementation MBAddSpaceObjectViewController

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
    
    UIImage *orion = [UIImage imageNamed:@"Orion.jpg"];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:orion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cancelButton:(UIButton *)sender {
    
    //access the delegate property and run the method
    [self.delegate didCancel];
}

- (IBAction)addButton:(UIButton *)sender {
    
    MBSpaceObject *newSpaceObject = [self returnNewSpaceObject];
    [self.delegate addSpaceObject:(newSpaceObject)];
}

-(MBSpaceObject *)returnNewSpaceObject
{
    MBSpaceObject *addedSpaceObject = [[MBSpaceObject alloc]init];
    addedSpaceObject.name = self.nameTextField.text;
    addedSpaceObject.nickname = self.nicknameTextField.text;
    addedSpaceObject.diameter = [self.diameterTextField.text floatValue];
    addedSpaceObject.temperature = [self.temperatureTextField.text floatValue];
    addedSpaceObject.numberOfMoons = [self.numberOfMoonsTextField.text intValue];
    addedSpaceObject.interestingFact = self.diameterTextField.text;
    
    return addedSpaceObject;
}
@end
