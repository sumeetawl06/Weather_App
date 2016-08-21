//
//  WeatherForcastView.m
//  Weather_App
//
//  Created by reliancegames on 8/2/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import "WeatherForcastView.h"

@implementation WeatherForcastView

- (id)initForAutoLayout {
    
    self = [super initForAutoLayout];
    
    if (self) {
        
        [self configureUI];
    }
    
    return self;
}

- (void)configureUI {
    
    [self addCollectionView];
}

- (void)addCollectionView {
    
    
}

@end
