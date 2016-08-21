//
//  HomeTableViewCell.m
//  Weather_App
//
//  Created by Sumeet on 13/08/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self configureUI];
    }
    return self;
}

- (void)configureUI {
    
    [self addDateLabel];
    [self addMainWeatherImage];
    [self addMaximumTemp];
    [self addMinimumTemp];
}

- (void)addDateLabel {
    
    self.dateLabel = [UtilityMethods createLabelWitText:@"" font:@"" fontSize:10 fontColorHex:@"000000" textAlignment:NSTextAlignmentLeft];
    [self addSubview:_dateLabel];
    [_dateLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:10.0];
    [_dateLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
    [_dateLabel autoSetDimension:ALDimensionWidth toSize:self.frame.size.width/4];
    
}

- (void)addMainWeatherImage {
    
    self.mainWeatherImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    [_mainWeatherImage setBackgroundColor:[UIColor clearColor]];
    _mainWeatherImage.contentMode = UIViewContentModeCenter;
    [self addSubview:_mainWeatherImage];
    [_mainWeatherImage autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_dateLabel withOffset:0.0];
    [_mainWeatherImage autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
    [_mainWeatherImage autoSetDimension:ALDimensionWidth toSize:self.frame.size.width/4];
}

- (void)addMaximumTemp {
    
    self.maximumTemp = [UtilityMethods createLabelWitText:@"" font:@"" fontSize:15 fontColorHex:@"000000" textAlignment:NSTextAlignmentCenter];
    [self addSubview:_maximumTemp];
    [_maximumTemp autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_mainWeatherImage withOffset:0.0];
    [_maximumTemp autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
    [_maximumTemp autoSetDimension:ALDimensionWidth toSize:self.frame.size.width/4];
    

}

- (void)addMinimumTemp {
    
    self.minimumTemp = [UtilityMethods createLabelWitText:@"" font:@"" fontSize:15 fontColorHex:@"000000" textAlignment:NSTextAlignmentCenter];
    [self addSubview:_minimumTemp];
    [_minimumTemp autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_maximumTemp withOffset:0.0];
    [_minimumTemp autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
    [_minimumTemp autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:0.0];

}

@end
