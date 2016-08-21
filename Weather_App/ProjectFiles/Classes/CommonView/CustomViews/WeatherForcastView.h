//
//  WeatherForcastView.h
//  Weather_App
//
//  Created by reliancegames on 8/2/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherForcastView : UIView

@property (nonatomic, strong) NSMutableDictionary *dataDict;
@property (nonatomic, strong) UICollectionView *collectionView;

@end
