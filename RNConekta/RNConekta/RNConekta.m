//
//  RNConekta.m

#import <UIKit/UIKit.h>
#import "Conekta.h"
#import "RNConekta.h"
#import "RCTConvert.h"
#import "RCTEventDispatcher.h"
#import "RCTView.h"
#import "UIView+React.h"
#import "RCTRootView.h"


@implementation RNConekta
    Conekta *conekta;
    BOOL isCollected = NO;

- (id)init
{
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    
    conekta = [[Conekta alloc] init];
    [conekta setDelegate: rootViewController];

    return self;
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(createToken:(NSDictionary *)info
                  callback:(RCTResponseSenderBlock)successCallback
                  errorCallback:(RCTResponseSenderBlock)failureCallback)
{
    if ( isCollected == NO ) {
        NSString *publicKey = [RCTConvert NSString:info[@"publicKey"]];
        isCollected = YES;
        [conekta setPublicKey:publicKey];
        [conekta collectDevice];
    }

    NSString *cardNumber = [RCTConvert NSString:info[@"cardNumber"]];
    NSString *cardHolder = [RCTConvert NSString:info[@"name"]];
    NSString *cvc = [RCTConvert NSString:info[@"cvc"]];
    NSString *expMonth = [RCTConvert NSString:info[@"expMonth"]];
    NSString *expYear = [RCTConvert NSString:info[@"expYear"]];
    
    Card *card = [conekta.Card initWithNumber: cardNumber name: cardHolder cvc: cvc expMonth: expMonth expYear: expYear];
    
    Token *token = [conekta.Token initWithCard:card];
    
    [token createWithSuccess: ^(NSDictionary *data) {
        successCallback(@[data]);
    } andError: ^(NSError *error) {
        failureCallback(@[[NSNull null]]);
    }];
}

@end
