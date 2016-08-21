

//
//  ViewController.m
//  Weather_App
//
//  Created by reliancegames on 8/1/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import "HomeViewController.h"
#import "GetWeatherInformationProxy.h"
#import "CityWeatherModel.h"
#import "HomeTableViewCell.h"
#import "CustomMenuView.h"

@interface HomeViewController () <GetWeatherInformationProxyDelegate, UIAlertViewDelegate, UITableViewDelegate, UITableViewDataSource, CustomMenuViewDelegate>

@property (nonatomic, strong) UILabel *cityNameLabel;
@property (nonatomic, strong) UILabel *weatherDescriptionLabel;
@property (nonatomic, strong) UILabel *currentTemperatureLabel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CustomMenuView *slideView;
@property (nonatomic, strong) NSMutableArray *weatherDataArray;
@property (nonatomic, strong) NSString *currentCityName;
@property (nonatomic, strong) GetWeatherInformationProxy *getWeatherInformationProxy;
@property (nonatomic, strong) UIButton *menuButton;
@property (nonatomic, strong) NSLayoutConstraint *leftConstraintCityNameTableView;
@property (nonatomic, strong) NSLayoutConstraint *rightConstraintCityNameTableView;
//@property (nonatomic, assign) BOOL isMenuVisible;

@end

@implementation HomeViewController

#pragma mark - View Controller Methods

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController setNavigationBarHidden:YES];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self startLocationManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView {
    
    [super loadView];
    
    [self.view addSubview:self.cityNameLabel];
    [self setConstraintsForCityNameLabel];
    
    [self.view addSubview:self.weatherDescriptionLabel];
    [self setConstraintsForWeatherDescriptionLabel];
    
    [self.view addSubview:self.currentTemperatureLabel];
    [self setConstraintsForCurrentTemperatureLabel];
    
    [self.view addSubview:self.tableView];
    [self setConstraintsForTableView];
    
    [self.view addSubview:self.menuButton];
    [self setConstraintsForMenuButton];
    
    [self.view addSubview:self.slideView];
    [self setConstraintsForSlideView];
}

#pragma mark - Getters

- (UILabel *)cityNameLabel {
    
    if (!_cityNameLabel) {
        
        _cityNameLabel = [UtilityMethods createLabelWitText:@""
                                                       font:@""
                                                   fontSize:20
                                               fontColorHex:@"000000"
                                              textAlignment:NSTextAlignmentCenter];
    }
    return _cityNameLabel;
}

- (UILabel *)weatherDescriptionLabel {
    
    if (!_weatherDescriptionLabel) {
        
        _weatherDescriptionLabel = [UtilityMethods createLabelWitText:@""
                                                                 font:@""
                                                             fontSize:12
                                                         fontColorHex:@"000000"
                                                        textAlignment:NSTextAlignmentCenter];
    }
    return _weatherDescriptionLabel;
}

- (UILabel *)currentTemperatureLabel {
    
    if (!_currentTemperatureLabel) {
        
        _currentTemperatureLabel = [UtilityMethods createLabelWitText:@""
                                                                 font:@""
                                                             fontSize:38
                                                         fontColorHex:@"000000"
                                                        textAlignment:NSTextAlignmentCenter];
    }
    return _currentTemperatureLabel;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initForAutoLayout];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
    }
    return _tableView;
}

- (UIButton *)menuButton {
    
    if (!_menuButton) {
        
        _menuButton = [UtilityMethods createButtonWithBGImageName:@"menu"
                                          andHighlightedImageName:@""
                                                   andEventTarget:self
                                                        andAction:@selector(menuButtonTapped)
                                                           andTag:10
                                                   andButtonTitle:@""
                                                      andFontSize:10
                                                      andFontType:@""
                                                  andFontColorHEX:@""
                                                  andLeftCapWidth:0
                                                 andLeftCapHeight:0];
    }
    return  _menuButton;
}

- (void)addMenuButton {
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"menu"]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(menuButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    backBtn.imageView.contentMode = UIViewContentModeCenter;
    backBtn.frame = CGRectMake(0, 0, 16, 16);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn] ;
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void)addChangeCityButton {
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"university"]  ;
    [rightButton setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [rightButton setTitle:@"Change City" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(changeCityButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    rightButton.imageView.contentMode = UIViewContentModeCenter;
    rightButton.frame = CGRectMake(0, 0, 24, 24);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:rightButton] ;
    self.navigationItem.rightBarButtonItem = backButton;
}

- (CustomMenuView *)slideView {
    
    if (!_slideView) {
        
        _slideView = [[CustomMenuView alloc]initForAutoLayout];
        _slideView.customMenuViewDelegate = self;
    }
    return _slideView;
}

#pragma mark - Constraints

- (void)setConstraintsForCityNameLabel {
    
    [_cityNameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:30];
    [_cityNameLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
//    [_cityNameLabel autoSetDimension:ALDimensionHeight toSize:22];
}

- (void)setConstraintsForWeatherDescriptionLabel {
    
    [_weatherDescriptionLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_cityNameLabel withOffset:10];
    [_weatherDescriptionLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
//    [_weatherDescriptionLabel autoSetDimension:ALDimensionHeight toSize:15];
}

- (void)setConstraintsForCurrentTemperatureLabel {
    
    [_currentTemperatureLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_weatherDescriptionLabel withOffset:10];
    [_currentTemperatureLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
//    [_currentTemperatureLabel autoSetDimension:ALDimensionHeight toSize:32];
}

- (void)setConstraintsForTableView {
    
    [_tableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_currentTemperatureLabel withOffset:10.0];
    [_tableView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view withOffset:-10];
    [_tableView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:10];
    [_tableView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.view withOffset:-10];
}

- (void)setConstraintsForMenuButton {
    
    [_menuButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:30];
    [_menuButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10.0];
    [_menuButton autoSetDimensionsToSize:CGSizeMake(16, 16)];
}

- (void)setConstraintsForSlideView {
    
    [_slideView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [_slideView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    _leftConstraintCityNameTableView = [_slideView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:-self.view.frame.size.width];
    _rightConstraintCityNameTableView = [_slideView autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.view withOffset:0];
}

#pragma mark - Event Handling

-(void)menuButtonTapped {
    
    if (APP_Delegate.isMenuHidden) {
        
        [self hideView];
    }else {
        
        
        [self.view removeConstraint:_leftConstraintCityNameTableView];
        [self.view removeConstraint:_rightConstraintCityNameTableView];
        
        [UIView animateWithDuration:0.8
         
                              delay:0.0 options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             
                             _leftConstraintCityNameTableView = [_slideView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:0];
                             _rightConstraintCityNameTableView = [_slideView autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.view withOffset:self.view.frame.size.width];
                         }
                         completion:^(BOOL finished) {
                             
                             _slideView.cityList = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] valueForKey:CITY_NAME_LIST]];
                             [_slideView reload];
                         }];
        APP_Delegate.isMenuHidden = YES;
        
    }
}

- (void)hideView {
    
    APP_Delegate.isMenuHidden = NO;
    [self.view removeConstraint:_leftConstraintCityNameTableView];
    [self.view removeConstraint:_rightConstraintCityNameTableView];
    
    [UIView animateWithDuration:0.8
     
                          delay:0.0 options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         _leftConstraintCityNameTableView = [_slideView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:-self.view.frame.size.width];
                         _rightConstraintCityNameTableView = [_slideView autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.view withOffset:0];
                     }
                     completion:^(BOOL finished) {
                         
                         
                     }];

}

- (void)changeCityButtonTapped {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Change City"
                                                                   message:@"Enter City Name."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              NSLog(@"%@", [alert.textFields objectAtIndex:0].text);
                                                              if ([UtilityMethods isStringPresent:[alert.textFields objectAtIndex:0].text]) {
                                                                  
                                                                  [self callGetWeatherInformationAPIWithCityName:[alert.textFields objectAtIndex:0].text];
                                                              }
                                                              
                                                          }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)menuDelegateAction {
    
    [self menuButtonTapped];
}

#pragma mark - Private Methods

- (void)startLocationManager {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    locationManager = [[CLLocationManager alloc]init];

    locationManager.delegate = self;
    [CLLocationManager locationServicesEnabled];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
    
}

- (NSString *)getDateString:(NSString *)date {
    
    NSTimeInterval interval = [date doubleValue];
    NSDate *online = [NSDate date];
    online = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/mm/YY"];
    return [dateFormatter stringFromDate:online];
    
}

- (void)addAndChangeCity:(NSString *)cityName {
    
    NSMutableArray *cityArray;
    if ([[NSUserDefaults standardUserDefaults] valueForKey:CITY_NAME_LIST]) {
        
        cityArray = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] valueForKey:CITY_NAME_LIST]];
    }else {
        
        cityArray = [[NSMutableArray alloc]init];
    }
    if (![cityArray containsObject:cityName]) {
        
        [cityArray addObject:cityName];
    }
    [[NSUserDefaults standardUserDefaults] setObject:cityArray forKey:CITY_NAME_LIST];
    
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSLog(@"didFailWithError: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation 	{
    
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
    }
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    CLLocation *location = [locations lastObject];
    
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:location
                   completionHandler:^(NSArray *placemarks, NSError *error) {
                       for (CLPlacemark *placemark in placemarks) {
                           
                           NSLog(@"placemark.subLocality %@",placemark.subLocality);
                           [MBProgressHUD hideHUDForView:self.view animated:YES];
                           if ([UtilityMethods isStringPresent:placemark.subLocality]) {
                           
                               [self callGetWeatherInformationAPIWithCityName:placemark.subLocality];
                               [locationManager stopUpdatingLocation];
                               locationManager = nil;

                           }
                       }
                   }];
}

#pragma mark - API Calls

- (void)callGetWeatherInformationAPIWithCityName:(NSString *)cityName {
    
    self.currentCityName = cityName;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.getWeatherInformationProxy = [[GetWeatherInformationProxy alloc]init];
    _getWeatherInformationProxy.getWeatherInformationProxyDelegate = self;
    [_getWeatherInformationProxy getWeatherInfoWithCityName:cityName];
}

#pragma mark - API Call Backs

- (void)getWeatherInformationSuccessful:(NSMutableDictionary *)dataDict {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    if (!_weatherDataArray) {
        
        _weatherDataArray = [[NSMutableArray alloc]init];
    }
    
    [self addAndChangeCity:self.currentCityName];
    self.weatherDataArray = [dataDict valueForKey:WEATHER_DATA_LIST];
    CityWeatherModel *cityWeatherModel;
    if ([self.weatherDataArray count] > 0) {
        
        cityWeatherModel = [self.weatherDataArray objectAtIndex:0];
    }else {
        
        return;
    }
    
    [_cityNameLabel setText:[dataDict valueForKey:CITY_NAME]];
    self.navigationController.navigationBar.topItem.title = [dataDict valueForKey:CITY_NAME];
    
    self.weatherDescriptionLabel.text = cityWeatherModel.weatherDescription;
    self.currentTemperatureLabel.text = [NSString stringWithFormat:@"%@°",cityWeatherModel.dayTemperature];
    
    [_tableView reloadData];
}

- (void)getWeatherInformationFailed:(NSMutableDictionary *)dataDict {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}

#pragma mark - Table View Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50.0;
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _weatherDataArray.count-1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeTableViewCell *cell;
    NSString *cellIdentifier = @"Cell Identifier";
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    CityWeatherModel *cityWeatherModel = [_weatherDataArray objectAtIndex:indexPath.row+1];
    
    cell.dateLabel.text = [self getDateString:cityWeatherModel.dateString];
    cell.mainWeatherImage.image = [UIImage imageNamed:cityWeatherModel.weatherIconName];
    cell.maximumTemp.text = [NSString stringWithFormat:@"%@°",cityWeatherModel.maxTemperature];
    cell.minimumTemp.text = [NSString stringWithFormat:@"%@°",cityWeatherModel.minTemperature];
    
    return cell;
}
/*
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 40.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc]init];
    [headerView setBackgroundColor:[UtilityMethods colorFromHexString:@"1414oc"]];
    [headerView setFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
    UILabel *dateLabel = [UtilityMethods createLabelWitText:@"Date" font:@"" fontSize:12 fontColorHex:@"ffffff" textAlignment:NSTextAlignmentCenter];
    [headerView addSubview:dateLabel];
    [dateLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5.0];
    [dateLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:headerView];
    [dateLabel autoSetDimension:ALDimensionWidth toSize:headerView.frame.size.width/4];
    
    UILabel *minTempLabel = [UtilityMethods createLabelWitText:@"Max Temp" font:@"" fontSize:12 fontColorHex:@"ffffff" textAlignment:NSTextAlignmentRight];
    [headerView addSubview:minTempLabel];
    [minTempLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:5.0];
    [minTempLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:headerView];
    [minTempLabel autoSetDimension:ALDimensionWidth toSize:headerView.frame.size.width/4];

    UILabel *maxTempLabel = [UtilityMethods createLabelWitText:@"Min Temp" font:@"" fontSize:12 fontColorHex:@"ffffff" textAlignment:NSTextAlignmentRight];
    [headerView addSubview:maxTempLabel];
    [maxTempLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:minTempLabel withOffset:0.0];
    [maxTempLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:headerView];
    [maxTempLabel autoSetDimension:ALDimensionWidth toSize:headerView.frame.size.width/4];
    
    return headerView;
}
*/
- (void)changeCity:(NSString *)cityName {
    
    [self callGetWeatherInformationAPIWithCityName:cityName];
    [self hideView];
}

- (void)addCity:(NSString *)cityName {
    
    [self callGetWeatherInformationAPIWithCityName:cityName];

}

@end
