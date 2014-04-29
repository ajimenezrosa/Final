//
//  SeasonsViewController.m
//  final
//
//  Created by D C on 4/29/14.
//  Copyright (c) 2014 DC. All rights reserved.
//

#import "SeasonsViewController.h"
#import "XCDYouTubeVideoPlayerViewController.h"
#define primavera 326


@interface SeasonsViewController (){
    NSMutableArray *season;
    NSString *video;
    NSInteger day ;
   
    
    NSDateComponents *primaveradays;
    NSDateComponents *veranodays;
    NSDateComponents *otonodays;
    NSDateComponents *inviernodays;
}
@property (nonatomic, strong) XCDYouTubeVideoPlayerViewController *videoPlayerViewController;
@end

@implementation SeasonsViewController

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
    season=[[NSMutableArray alloc]initWithObjects:@"Primavera",@"Verano",@"Otoño",@"Invierno", nil];
    NSDate *now = [NSDate date];
    [self faltantes:now];
    /**---*/
    // This just sets up the two dates you want to compare
}
-(void)faltantes: (NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //NSDate *startDate = [formatter dateFromString:@"01-01-2011"];
    NSDate *endDate = [formatter dateFromString:@"2015-03-21"];
    NSDate *BegVerano=[formatter dateFromString:@"2014-06-21"];
    NSDate *BegOto=[formatter dateFromString:@"2014-09-23"];
    NSDate *BegInv=[formatter dateFromString:@"2014-12-21"];
    
    // This performs the difference calculation
    unsigned flags = NSDayCalendarUnit;
    primaveradays = [[NSCalendar currentCalendar] components:flags fromDate:date toDate:endDate options:0];
    veranodays = [[NSCalendar currentCalendar] components:flags fromDate:date toDate:BegVerano options:0];
    otonodays = [[NSCalendar currentCalendar] components:flags fromDate:date toDate:BegOto options:0];
    inviernodays = [[NSCalendar currentCalendar] components:flags fromDate:date toDate:BegInv options:0];

    
    // This just logs your output
    NSLog(@"Start Date, %@", date);
    NSLog(@"End Date, %@", endDate);
    NSLog(@"%ld", (long)[primaveradays day]);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark TableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    //Regresa el numero de secciones en la tabla
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    //regresa el numero de celdas en nuestra tabla
    return [season count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text=[season objectAtIndex:indexPath.row];
    if(indexPath.row==0){
    cell.detailTextLabel.text=[NSString stringWithFormat:@"Dias faltantes: %ld",(long)[primaveradays day]];
    }
    if(indexPath.row==1){
        cell.detailTextLabel.text=[NSString stringWithFormat:@"Dias faltantes: %ld",(long)[veranodays day]];
    }
    if(indexPath.row==2){
        cell.detailTextLabel.text=[NSString stringWithFormat:@"Dias faltantes: %ld",(long)[otonodays day]];
    }
    if(indexPath.row==3){
        cell.detailTextLabel.text=[NSString stringWithFormat:@"Dias faltantes: %ld",(long)[inviernodays day]];
    }
    return cell;
    
}


#pragma mark UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"numero de row %ld",(long)indexPath.row);
    if(indexPath.row==0){
        video=@"KdBgsYQxQ6M";
        [self videoPlay];
        
    }else if(indexPath.row==1){
        video=@"UyMlOoWlu2o";
        [self videoPlay];
        
    }else if (indexPath.row==2){
        video=@"JYIPC7f6EXI";
        [self videoPlay];
        
    }else if (indexPath.row==3){
        video=@"GZGIRvoSeQs";
        [self videoPlay];
        
    }
}
- (void) viewWillDisappear:(BOOL)animated
{
	// Beware, viewWillDisappear: is called when the player view enters full screen on iOS 6+
	if ([self isMovingFromParentViewController])
		[self.videoPlayerViewController.moviePlayer stop];
    
    
}
-(void)videoPlay{
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
	
	self.videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:video];
	
	[self.videoPlayerViewController presentInView:self.contentView];
	
	
    [self.videoPlayerViewController.moviePlayer prepareToPlay];
}


@end
