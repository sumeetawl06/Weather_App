//
//  HomeTableViewCell.h
//  Weather_App
//
//  Created by Sumeet on 13/08/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIImageView *mainWeatherImage;
@property (nonatomic, strong) UILabel *maximumTemp;
@property (nonatomic, strong) UILabel *minimumTemp;

@end
