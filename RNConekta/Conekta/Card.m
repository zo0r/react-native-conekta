//
//  Card.m
//  Conekta
//
//  Created by Julian Ceballos on 10/16/15.
//
//

#include "Card.h"

@implementation Card

- (id) init
{
    [self setResourceURI:@"/cards"];
    return self;
}

- (id) initWithNumber: (NSString *)number name: (NSString *)name cvc: (NSString *)cvc expMonth: (NSString *)expMonth expYear: (NSString *)expYear
{
    self = [super init];
    if (!self) return nil;
    
    [self setNumber: number];
    [self setName: name];
    [self setCvc: cvc];
    [self setExpMonth: expMonth];
    [self setExpYear: expYear];
    
    return self;
}

- (void) setNumber: (NSString *)number name: (NSString *)name cvc: (NSString *)cvc expMonth: (NSString *)expMonth expYear: (NSString *)expYear
{
    [self setNumber: number];
    [self setName: name];
    [self setCvc: cvc];
    [self setExpMonth: expMonth];
    [self setExpYear: expYear];
}

- (NSData *) asJSONData
{
    NSString *_json = [NSString stringWithFormat:@"{\"card\":{\"name\": \"\%@\", \"number\":  \"%@\", \"cvc\": \"%@\", \"exp_month\":  \"%@\", \"exp_year\": \"%@\", \"device_fingerprint\": \"%@\" } }", self.name, self.number, self.cvc, self.expMonth, self.expYear, self.deviceFingerprint];
    return [_json dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
}

@end
