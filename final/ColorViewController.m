//
//  ColorViewController.m
//  final
//
//  Created by D C on 4/29/14.
//  Copyright (c) 2014 DC. All rights reserved.
//

#import "ColorViewController.h"
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface ColorViewController ()

@end

@implementation ColorViewController

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
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)slide1:(id)sender {
    //UISlider *slider = (UISlider *)sender;
    self.slider1=(UISlider *)sender;
    self.slider1.minimumValue = 0;
    self.slider1.maximumValue = 255;
    float val = self.slider1.value;
    self.label1.text = [NSString stringWithFormat:@"%f",val];
    [self setColor];
    
    
}
- (IBAction)slide2:(id)sender {
    self.slider2=(UISlider *)sender;
    self.slider2.minimumValue = 0;
    self.slider2.maximumValue = 255;
    float val = self.slider2.value;

    self.label2.text = [NSString stringWithFormat:@"%f",val];
    [self setColor];
}
- (IBAction)slide3:(id)sender {
    self.slider3=(UISlider *)sender;
    self.slider3.minimumValue = 0;
    self.slider3.maximumValue = 255;
    float val = self.slider3.value;
    self.label3.text = [NSString stringWithFormat:@"%f",val];
    [self setColor];
}
-(void)setColor{
    //NSString *red=[NSString stringWithFormat:@"%@",self.label1.text];
    double green=[[NSString stringWithFormat:@"%@",self.label2.text]floatValue];
    double blue=[[NSString stringWithFormat:@"%@",self.label3.text]floatValue];
    double red= [[NSString stringWithFormat:@"%@",self.label1.text] floatValue];
    
    [self.viewColor setBackgroundColor:RGB(red, green, blue)];
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
