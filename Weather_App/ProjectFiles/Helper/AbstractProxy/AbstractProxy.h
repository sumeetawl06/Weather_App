//
//  AbstractProxy.h
//  Weather_App
//
//  Created by reliancegames on 8/2/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>



@interface AbstractProxy : NSObject

- (void)getRequestDataWithURL:(NSString *)url andRequestName:(NSString *)requestName;

- (void)successWithRequest:(NSURLSessionTask *)task
               withRespose:(id)responseObject
           withRequestName:(NSString *)requestName;

- (void)failedWithRequest:(NSURLSessionTask *)task
                witherror:(NSError *)error
          withRequestName:(NSString *)requestName;

@end
