//
//  CWTWeatherReportTableViewTableViewController.m
//  CNN Weather Test
//
//  Created by TJ Mercer on 10/18/16.
//  Copyright © 2016 TJ Mercer. All rights reserved.
//

#import "CWTWeatherReportTableViewTableViewController.h"
#import "CWTCellTableViewCell.h"
#import "CWTDetailViewViewController.h"
#import "CWTHeaderView.h"
#import "CWTWeatherSetup.h"

@interface CWTWeatherReportTableViewTableViewController ()
@property (weak, nonatomic) IBOutlet CWTHeaderView *header;

@end

@implementation CWTWeatherReportTableViewTableViewController

{
    NSArray *dailyForecasts;
    CWTData *forecastForDetailView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CWTWeatherSetup *setup = [[CWTWeatherSetup alloc] init];
    forecastForDetailView = [CWTWeatherSetup weatherData].currentWeather;
    dailyForecasts = [CWTWeatherSetup weatherData].fiveDay;
    
    [self.tableView reloadData];
    
    [self.header displayForecastWithData:[CWTWeatherSetup weatherData].currentWeather];
}

-(void)viewDidAppear:(BOOL)animated{
    forecastForDetailView = [CWTWeatherSetup weatherData].currentWeather;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dailyForecasts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CWTCellTableViewCell *cell = (CWTCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.info = dailyForecasts[indexPath.row];
    
    [cell createCell];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    forecastForDetailView = dailyForecasts[indexPath.row];
    [self performSegueWithIdentifier:@"presentDetails" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CWTDetailViewViewController *details = [segue destinationViewController];
    details.info = forecastForDetailView;
}

@end
