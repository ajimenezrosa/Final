//
//  BodyViewController.m
//  final
//
//  Created by D C on 4/28/14.
//  Copyright (c) 2014 DC. All rights reserved.
//

#import "BodyViewController.h"

#import <AudioToolbox/AudioToolbox.h>
#define degreesToRadians(x) (M_PI * x / 180.0)
#define degressAnti(x) (1.5*M_PI/x)


@interface BodyViewController (){
    BOOL sound;
}

@end

@implementation BodyViewController

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
   
    
    self.viewArm1.transform = CGAffineTransformRotate(self.viewArm1.transform, degreesToRadians(10));
    self.viewArm1back.transform = CGAffineTransformRotate(self.viewArm1.transform, degreesToRadians(7));
     self.viewArm2.transform = CGAffineTransformRotate(self.viewArm1.transform, degressAnti(-13));
    self.viewArm2back.transform = CGAffineTransformRotate(self.viewArm1.transform, degressAnti(-15));
    
    
    UITapGestureRecognizer *head =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(headView:)];
    
    [self.head addGestureRecognizer:head];

    /****/
    
    UITapGestureRecognizer *arm1 =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(arm1View:)];
    
    [self.viewArm1 addGestureRecognizer:arm1];
    
    /***/
    
    
    UITapGestureRecognizer *arm2 =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(arm2View:)];
    
    [self.viewArm2 addGestureRecognizer:arm2];
    
    /***/
    
    
    UITapGestureRecognizer *leg1 =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(leg1View:)];
    
    [self.leg1 addGestureRecognizer:leg1];
    /***/
    
    
    UITapGestureRecognizer *leg2 =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(leg2View:)];
    
    [self.leg2 addGestureRecognizer:leg2];
    /***/
    
    
    UITapGestureRecognizer *body =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(bodyView:)];
    
    [self.body addGestureRecognizer:body];
    

}
-(void)clean{
    [self.headback setBackgroundColor:[UIColor clearColor]];
    [self.viewArm1back setBackgroundColor:[UIColor clearColor]];
    [self.viewArm2back setBackgroundColor:[UIColor clearColor]];
    [self.bodyback setBackgroundColor:[UIColor clearColor]];
    [self.leg1back setBackgroundColor:[UIColor clearColor]];
    [self.leg2back setBackgroundColor:[UIColor clearColor]];
    
}
-(void)play: (NSString *)name{
    
    sound=1;
    
    CFBundleRef mainBundle = CFBundleGetMainBundle();
    CFURLRef soundFileURLRef = CFBundleCopyResourceURL(mainBundle,(__bridge CFStringRef)(name), CFSTR ("mp3"), NULL);
    UInt32 soundID;
    while(sound){
        AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
        AudioServicesPlaySystemSound(soundID);
        //[self.headback setBackgroundColor:[UIColor greenColor]];
        sound=0;
    }
    [self performSelector:@selector(clean) withObject:self afterDelay:1.0 ];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)headView:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    NSLog(@"click head");
    [self.headback setBackgroundColor:[UIColor greenColor]];
    [self play:@"head"];
    //[self clean];
}

- (void)arm1View:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    NSLog(@"click arm1");
    [self.viewArm1back setBackgroundColor:[UIColor greenColor]];
    [self play:@"Rarm"];
    //[self clean];
}
- (void)arm2View:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    NSLog(@"click arm2");
    [self.viewArm2back setBackgroundColor:[UIColor greenColor]];
    [self play:@"Larm"];
    //[self clean];

}
- (void)leg1View:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    NSLog(@"click leg1");
    [self.leg1back setBackgroundColor:[UIColor greenColor]];
    [self play:@"Rleg"];
    //[self clean];
}

- (void)leg2View:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    NSLog(@"click leg2");
    [self.leg2back setBackgroundColor:[UIColor greenColor]];
    [self play:@"Lleg"];
    //[self clean];
}
- (void)bodyView:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    NSLog(@"click body");
    [self.bodyback setBackgroundColor:[UIColor greenColor]];
    [self play:@"body"];
    //[self clean];
}


@end
