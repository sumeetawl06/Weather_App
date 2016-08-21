//
//  AbstractProxy.m
//  Weather_App
//
//  Created by reliancegames on 8/2/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import "AbstractProxy.h"

@implementation AbstractProxy

- (void)getRequestDataWithURL:(NSString *)url andRequestName:(NSString *)requestName {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:[url stringByReplacingOccurrencesOfString:@" " withString:@""] parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
    
        [self successWithRequest:task withRespose:responseObject withRequestName:requestName];
        
    } failure:^(NSURLSessionTask *task, NSError *error) {
        
        [self failedWithRequest:task witherror:error withRequestName:requestName];
        
    }];
    
}

#pragma mark - Server request callback methods

- (void)successWithRequest:(NSURLSessionTask *)task
               withRespose:(id)responseObject
           withRequestName:(NSString *)requestName {
    
    
}

- (void)failedWithRequest:(NSURLSessionTask *)task
                witherror:(NSError *)error
          withRequestName:(NSString *)requestName {
    
    
}

@end
