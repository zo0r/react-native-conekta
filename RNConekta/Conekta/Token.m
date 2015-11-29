//
//  Token.m
//  Conekta
//
//  Created by Julian Ceballos on 10/16/15.
//
//

#include "Token.h"

@implementation Token

- (id) init
{
    [self setResourceURI:@"/tokens"];
    return self;
}

- (id) initWithCard: (Card*) card
{
    self = [super init];
    if (!self) return nil;
    
    [self setCard: card];
    
    return self;
}

- (void) createWithSuccess: (void(^)(NSDictionary *))successHandler andError: (void(^)(NSError*))errorHandler
{
    NSString *url = [NSString stringWithFormat:@"%@%@", [self baseURI], [self resourceURI]];
    NSURL *resource_url = [NSURL URLWithString: url];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:resource_url];
    
    [urlRequest setHTTPMethod:@"POST"];
    
    [urlRequest addValue:[NSString stringWithFormat:@"Basic %@", [self apiKeyBase64:[self publicKey]]] forHTTPHeaderField:@"Authorization"];
    [urlRequest addValue:@"application/json" forHTTPHeaderField: @"Content-type"];
    [urlRequest addValue:@"application/vnd.conekta-v0.3.0+json" forHTTPHeaderField: @"Accept"];
    [urlRequest addValue:@"{\"agent\":\"Conekta iOS SDK\"}" forHTTPHeaderField: @"Conekta-Client-User-Agent"];
    
    [urlRequest setHTTPBody:[[self card] asJSONData]];
    
    Connection *connection = [[Connection alloc] initWithRequest:urlRequest];
    [connection requestWithSuccess: successHandler andError: errorHandler];
}

- (NSString *) apiKeyBase64: (NSString *)api_key
{
    NSData *plainData = [api_key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *apiKeyBase64Data = [plainData base64EncodedDataWithOptions: NSDataBase64Encoding64CharacterLineLength];
    NSString *returnValue = [[NSString alloc] initWithData:apiKeyBase64Data encoding:NSUTF8StringEncoding];
    return returnValue;
}

@end
