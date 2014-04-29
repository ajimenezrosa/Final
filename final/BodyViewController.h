//
//  BodyViewController.h
//  final
//
//  Created by D C on 4/28/14.
//  Copyright (c) 2014 DC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BodyViewController : UIViewController

@property(weak,nonatomic)IBOutlet UIImageView *image;

@property(weak,nonatomic)IBOutlet UIView *viewArm1;
@property(weak,nonatomic)IBOutlet UIView *viewArm1back;

@property(weak,nonatomic)IBOutlet UIView *viewArm2;
@property(weak,nonatomic)IBOutlet UIView *viewArm2back;

@property(weak,nonatomic)IBOutlet UIView *leg1;
@property(weak,nonatomic)IBOutlet UIView *leg1back;

@property(weak,nonatomic)IBOutlet UIView *leg2;
@property(weak,nonatomic)IBOutlet UIView *leg2back;

@property(weak,nonatomic)IBOutlet UIView *head;
@property(weak,nonatomic)IBOutlet UIView *headback;

@property(weak,nonatomic)IBOutlet UIView *body;
@property(weak,nonatomic)IBOutlet UIView *bodyback;



@end
