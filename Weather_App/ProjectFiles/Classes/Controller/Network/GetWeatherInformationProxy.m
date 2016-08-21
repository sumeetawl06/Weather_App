//
//  GetWeatherInformationProxy.m
//  Weather_App
//
//  Created by reliancegames on 8/2/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import "GetWeatherInformationProxy.h"
#import "CityWeatherModel.h"

#define GET_INFO_WITHCITYNAME @"GET_INFO_WITHCITYNAME"

@implementation GetWeatherInformationProxy

- (void)getWeatherInfoWithCityName:(NSString *)cityName {
    
    NSString *requestString = [NSString stringWithFormat:@"%@%@&mode=json&units=metric&cnt=14&appid=%@", BASE_URL, cityName, API_KEY];
    [self getRequestDataWithURL:requestString andRequestName:GET_INFO_WITHCITYNAME];
}

#pragma mark - API Call Back

- (void)successWithRequest:(NSURLSessionTask *)task withRespose:(id)responseObject withRequestName:(NSString *)requestName {

    
    NSMutableDictionary *responseDictionary = (NSMutableDictionary*)responseObject;
    
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
    NSMutableArray *dataArray = [[NSMutableArray alloc]init];
    if ([responseDictionary valueForKey:@"city"] ) {
        
        [dataDict setObject:[[responseDictionary valueForKey:@"city"] valueForKey:@"name"] forKey:CITY_NAME];

    }
    for (NSMutableDictionary *dict in [responseDictionary objectForKey:@"list"]) {
        
        CityWeatherModel *cityWeatherModel = [[CityWeatherModel alloc]init];
        cityWeatherModel.dateString = [dict valueForKey:@"dt"];
        cityWeatherModel.dayTemperature = [[dict valueForKey:@"temp"] valueForKey:@"day"];
        cityWeatherModel.maxTemperature = [[dict valueForKey:@"temp"] valueForKey:@"max"];
        cityWeatherModel.minTemperature = [[dict valueForKey:@"temp"] valueForKey:@"min"];
        cityWeatherModel.weatherDescription = [[[dict valueForKey:@"weather"]objectAtIndex:0] valueForKey:@"description"];
        cityWeatherModel.weatherIconName = [[[dict valueForKey:@"weather"]objectAtIndex:0] valueForKey:@"icon"];
        [dataArray addObject:cityWeatherModel];
    }
    [dataDict setObject:dataArray forKey:WEATHER_DATA_LIST];
    
    if ([responseDictionary valueForKey:@"message"]) {
        
        
    }
    
    if (self.getWeatherInformationProxyDelegate && [self.getWeatherInformationProxyDelegate respondsToSelector:@selector(getWeatherInformationSuccessful:)]) {
        
        [self.getWeatherInformationProxyDelegate getWeatherInformationSuccessful:dataDict];
    }
    
}

- (void)failedWithRequest:(NSURLSessionTask *)task witherror:(NSError *)error withRequestName:(NSString *)requestName {
    
    
}

@end
