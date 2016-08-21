//
//  GetWeatherInformationProxy.h
//  Weather_App
//
//  Created by reliancegames on 8/2/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import "AbstractProxy.h"

@protocol GetWeatherInformationProxyDelegate <NSObject>

@optional
- (void)getWeatherInformationSuccessful:(NSMutableDictionary *)dataDict;
- (void)getWeatherInformationFailed:(NSMutableDictionary *)dataDict;
@end

@interface GetWeatherInformationProxy : AbstractProxy

@property (nonatomic, weak) id<GetWeatherInformationProxyDelegate> getWeatherInformationProxyDelegate;

- (void)getWeatherInfoWithCityName:(NSString *)cityName;

@end
