//
//  RNConekta.m

#import <UIKit/UIKit.h>
#import "Conekta.h"
#import "RNConekta.h"
#import <React/RCTConvert.h>
#import <React/RCTEventDispatcher.h>
#import <React/RCTView.h>
#import <React/UIView+React.h>
#import <React/RCTRootView.h>


@implementation RNConekta
    Conekta *conekta;
    BOOL isCollected = NO;

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

- (id)init
{
    UIViewController *controller = [[UIViewController alloc] init];

    conekta = [[Conekta alloc] init];
    [conekta setDelegate: controller];

    return self;
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(createToken:(NSDictionary *)info
                  callback:(RCTResponseSenderBlock)successCallback
                  errorCallback:(RCTResponseSenderBlock)failureCallback)
{

    NSString *publicKey = [RCTConvert NSString:info[@"publicKey"]];
    [conekta setPublicKey:publicKey];

    if ( isCollected == NO ) {
        isCollected = YES;
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
