//
//  mapViewController.m
//  final
//
//  Created by D C on 4/29/14.
//  Copyright (c) 2014 DC. All rights reserved.
//

#import "mapViewController.h"

@interface mapViewController (){
    CLLocationManager *locationManager;
}

@end

@implementation mapViewController

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
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [locationManager startUpdatingLocation];

    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Remove old red circles on screen
    NSLog(@"%@", [self deviceLocation]);
    NSArray *subviews = [self.view subviews];
//    for (UIView *view in subviews) {
//        [view removeFromSuperview];
//    }
    
    // Enumerate over all the touches and draw a red dot on the screen where the touches were
    [touches enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        // Get a single touch and it's location
        UITouch *touch = obj;
        CGPoint touchPoint = [touch locationInView:self.view];
        
        // Draw a red circle where the touch occurred
        /*UIView *touchView = [[UIView alloc] init];
        [touchView setBackgroundColor:[UIColor redColor]];
        touchView.frame = CGRectMake(touchPoint.x, touchPoint.y, 30, 30);
        touchView.layer.cornerRadius = 15;
        [self.view addSubview:touchView];
         */
        //NSLog(@"x: %f, y: %f",touchPoint.x,touchPoint.y);
        
    
    if(touchPoint.x==102.000000 && touchPoint.y==187.500000){
        [self mapaDistance:@"chihuahua"];
    }
    else if(touchPoint.x==305.000000 && touchPoint.y==187.500000){
        [self mapaDistance:@"yucatan"];
    }
        }];
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

-(void)mapaDistance: (NSString *)ciudad{
    if([ciudad isEqualToString:@"chihuahua"]){
        
       // NSLog(@"click chihuahua");
    }else if([ciudad isEqualToString:@"yucatan"]){
        //NSLog(@"yucatan");
    }
    
    

}
- (NSString *)deviceLocation {
    return [NSString stringWithFormat:@"latitude: %f longitude: %f", locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude];
}

- (IBAction)btnYucatan:(id)sender {
     NSLog(@"click yucatan");
    NSLog(@"%@", [self deviceLocation]);
    NSString *local=[self deviceLocation];
    self.geo.text=local;
    
    self.distance.text=@"Distacia a Yucatan: 1434 km";
}
- (IBAction)btnchihuahua:(id)sender {
     NSLog(@"click chihuahua");
    NSString *local=[self deviceLocation];
    self.geo.text=local;
    
    self.distance.text=@"Distacia a Chihuahua: 924.5 km";
    
}

- (IBAction)btnTamaulipas:(id)sender {
     NSLog(@"click tamaulipas");
    
    
    NSString *local=[self deviceLocation];
    self.geo.text=local;
    
    self.distance.text=@"Distacia a Tamaulipas: 554.6 km";
}

@end
