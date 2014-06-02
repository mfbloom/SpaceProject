//
//  MBSpaceObject.h
//  UITable App
//
//  Created by Michael Bloom on 5/30/14.
//  Copyright (c) 2014 Michael Bloom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBSpaceObject : NSObject

-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image;


@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *name;
@property (nonatomic) float gravitationalForce;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) int numberOfMoons;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *interestingFact;

@property (strong, nonatomic) UIImage *spaceImage;


@end
