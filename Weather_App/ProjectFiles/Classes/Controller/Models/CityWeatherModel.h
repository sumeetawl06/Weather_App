//
//  CityWeatherModel.h
//  Weather_App
//
//  Created by reliancegames on 8/2/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityWeatherModel : NSObject

@property (nonatomic, strong) NSString *dateString;
@property (nonatomic, strong) NSString *dayTemperature;
@property (nonatomic, strong) NSString *maxTemperature;
@property (nonatomic, strong) NSString *minTemperature;
@property (nonatomic, strong) NSString *weatherDescription;
@property (nonatomic, strong) NSString *weatherIconName;

/*
    base = stations;
    clouds =     {
        all = 92;
    };
    cod = 200;
    coord =     {
        lat = "18.62";
        lon = "73.78";
    };
    dt = 1470120393;
    id = 1274165;
    main =     {
        "grnd_level" = "941.61";
        humidity = 99;
        pressure = "941.61";
        "sea_level" = "1016.02";
        temp = "295.437";
        "temp_max" = "295.437";
        "temp_min" = "295.437";
    };
    name = Chinchvad;
    rain =     {
        3h = "2.38";
    };
    sys =     {
        country = IN;
        message = "0.0273";
        sunrise = 1470098570;
        sunset = 1470145149;
    };
    weather =     (
                   {
                       description = "light rain";
                       icon = 10d;
                       id = 500;
                       main = Rain;
                   }
                   );
    wind =     {
        deg = "253.003";
        speed = "7.67";
    };
*/
@end
