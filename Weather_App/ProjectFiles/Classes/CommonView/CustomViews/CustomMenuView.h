//
//  CustomMenuView.h
//  Weather_App
//
//  Created by Sumeet on 14/08/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomMenuViewDelegate <NSObject, UIAlertViewDelegate>

@optional
- (void)changeCity:(NSString *)cityName;
- (void)menuDelegateAction;
- (void)addCity:(NSString *)cityName;

@end

@interface CustomMenuView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<CustomMenuViewDelegate> customMenuViewDelegate;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *cityList;
@property (nonatomic, strong) UIButton *menuButton;
@property (nonatomic, strong) UIButton *addCityButton;
@property (nonatomic, strong) UILabel *cityLabel;

- (void)reload;

@end
