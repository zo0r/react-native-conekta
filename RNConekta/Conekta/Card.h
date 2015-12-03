//
//  Card.h
//  Conekta
//
//  Created by Julian Ceballos on 10/16/15.
//
//

#ifndef Card_h
#define Card_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, retain) NSString *baseURI;
@property (nonatomic, retain) NSString* publicKey;
@property (nonatomic, retain) NSString *resourceURI;

@property (nonatomic, retain) NSString *number;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *cvc;
@property (nonatomic, retain) NSString *expMonth;
@property (nonatomic, retain) NSString *expYear;
@property (nonatomic, retain) NSString *deviceFingerprint;

- (id) initWithNumber:(NSString *)number name:(NSString *)name cvc: (NSString *)cvc expMonth: (NSString *)expMonth expYear:(NSString *)expYear;

- (void) setNumber: (NSString *)number name: (NSString *)name cvc: (NSString *)cvc expMonth: (NSString *)expMonth expYear: (NSString *)expYear;

- (NSData *) asJSONData;

@end

#endif /* Card_h */
