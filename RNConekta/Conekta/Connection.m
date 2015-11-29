//
//  Connection.m
//  Conekta
//
//  Created by Julian Ceballos on 10/16/15.
//
//

#include "Connection.h"

@implementation Connection

- (id) initWithRequest: (NSMutableURLRequest *)request
{
    self = [super init];
    if (!self) return nil;
    
    [self setRequestor: request];
    
    return self;
}

- (void) requestWithSuccess: (void(^)(NSDictionary *))successHandler andError: (void(^)(NSError*))errorHandler
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:[self requestor]
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                           if(error == nil) {
                                                               NSError *e = nil;
                                                               NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
                                                               successHandler(json);
                                                           } else {
                                                               errorHandler(error);
                                                           }
                                                       }];
    [dataTask resume];
}

@end
