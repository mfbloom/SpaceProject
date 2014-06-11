//
//  MBOuterSpaceViewController.m
//  UITable App
//
//  Created by Michael Bloom on 5/30/14.
//  Copyright (c) 2014 Michael Bloom. All rights reserved.
//

#import "MBOuterSpaceViewController.h"
#import "AstronomicalData.h"
#import "MBSpaceObject.h"
#import "MBSpaceImageViewController.h"
#import "MBSpaceDataViewController.h"
#import "MBAddSpaceObjectViewController.h"

@interface MBOuterSpaceViewController ()

@end

@implementation MBOuterSpaceViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.planets = [[NSMutableArray alloc]init];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets])
    {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg",planetData [PLANET_NAME]];
        
        MBSpaceObject *planet = [[MBSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        
        [self.planets addObject:planet];
    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //sender is th object that trigger the segue
    
    //NSLog(@"%@",sender);
    
    if([sender isKindOfClass:[UITableViewCell class]])//compares if classes match
   {
       if([segue.destinationViewController isKindOfClass:[MBSpaceImageViewController class]])//check to make sure it is the correct view controller
       {
           //this is a proxy to pass data to the viewController - this occurs after the view is already loaded, so you need to save the data that will be passed.
           MBSpaceImageViewController *nextViewController = segue.destinationViewController;
           
           //figure out where you are on table view
           NSIndexPath *path = [self.tableView indexPathForCell:sender];
          // NSLog(@"%@",path);
           
           //select the value the user selected
           MBSpaceObject *selectedObject = [self.planets objectAtIndex:path.row];
           // or... MBSpaceObject *selectedObject = [self.planets[path.row]] - same thing as above
           
           nextViewController.spaceObject = selectedObject;
       }
       
    }
    
    if([sender isKindOfClass:[NSIndexPath class]])
    {
        if ([segue.destinationViewController isKindOfClass:[MBSpaceDataViewController class]])
        {
            MBSpaceDataViewController *targetViewController = segue.destinationViewController;
            NSIndexPath *path = sender;
            MBSpaceObject *selectedObject = self.planets[path.row];
            targetViewController.spaceObject = selectedObject;
        }
    }
    
    if([segue.destinationViewController isKindOfClass:[MBAddSpaceObjectViewController class]])
    {
        MBAddSpaceObjectViewController *addSpaceObjectVC = segue.destinationViewController;
        addSpaceObjectVC.delegate = self;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - MBAddSpaceObject

-(void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
    

}

-(void)addSpaceObject:(MBSpaceObject *)spaceObject
{
    //check to see if the array exists - only creates it once if does not exist
    if (!self.addedSpaceObjects)
    {
        self.addedSpaceObjects = [[NSMutableArray alloc]init];
        
    }
    [self.addedSpaceObjects addObject:spaceObject];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    
    if([self.addedSpaceObjects count])
    {
        return 2;
    }
    else return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
  
    if(section ==1)
    {
        return [self.addedSpaceObjects count];
    }
    else
    {
        return [self.planets count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(indexPath.section ==1)
    {
        //use new space object
        MBSpaceObject *planet = [self.addedSpaceObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
    }
    else{
    MBSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
    cell.textLabel.text = planet.name;
    cell.detailTextLabel.text = planet.nickname;
    cell.imageView.image = planet.spaceImage;
    }
    cell.backgroundColor = [UIColor clearColor];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma  mark UItableViewDelegate

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"pushToSpaceData" sender:indexPath];
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
