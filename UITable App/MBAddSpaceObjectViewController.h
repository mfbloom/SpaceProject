//
//  MBAddSpaceObjectViewController.h
//  UITable App
//
//  Created by Michael Bloom on 6/5/14.
//  Copyright (c) 2014 Michael Bloom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBSpaceObject.h"

@protocol MBAddSpaceObjectViewControllerDelegate <NSObject>

@required
-(void)addSpaceObject:(MBSpaceObject *)spaceObject;
-(void)didCancel;

@end

@interface MBAddSpaceObjectViewController : UIViewController

//weak - avoid retain cylces - both classes would be held and wouldn't be able to deallocate memory if was strong
//id - object of type of unknown
@property (weak,nonatomic) id <MBAddSpaceObjectViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberOfMoonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestingFactTextField;

- (IBAction)cancelButton:(UIButton *)sender;
- (IBAction)addButton:(UIButton *)sender;

@end
