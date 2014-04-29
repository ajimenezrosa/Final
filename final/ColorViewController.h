//
//  ColorViewController.h
//  final
//
//  Created by D C on 4/29/14.
//  Copyright (c) 2014 DC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorViewController : UIViewController
@property(weak,nonatomic)IBOutlet UILabel *label1;
@property(weak,nonatomic)IBOutlet UILabel *label2;
@property(weak,nonatomic)IBOutlet UILabel *label3;

@property (weak, nonatomic) IBOutlet UIView *viewColor;

@property(weak,nonatomic)IBOutlet UISlider *slider1;
@property(weak,nonatomic)IBOutlet UISlider *slider2;
@property(weak,nonatomic)IBOutlet UISlider *slider3;

@property(weak,nonatomic)IBOutlet UIImageView *image1;


@end
