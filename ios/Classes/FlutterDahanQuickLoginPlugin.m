#import "FlutterDahanQuickLoginPlugin.h"

@implementation FlutterDahanQuickLoginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel
                                     methodChannelWithName:@"flutter_dahan_quick_login"
                                           binaryMessenger:[registrar messenger]];
    FlutterDahanQuickLoginPlugin *instance = [[FlutterDahanQuickLoginPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

static NSString *const _METHOD_REGISTERAPP = @"registerApp";
static NSString *const _METHOD_GETPHONE = @"getPhone";

static NSString *const _ARGUMENT_KEY_APPID = @"appId";
static NSString *const _ARGUMENT_KEY_APPKEY = @"appKey";

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else if ([_METHOD_REGISTERAPP isEqualToString:call.method]) {
        NSString *appId = call.arguments[_ARGUMENT_KEY_APPID];
        NSString *appKey = call.arguments[_ARGUMENT_KEY_APPKEY];
        [self registerApp:appId appKey:appKey];
        result(nil);
    } else if ([_METHOD_GETPHONE isEqualToString:call.method]) {
        result([self getPhone]);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)registerApp:(NSString *)appId appKey:(NSString *)appKey {
    NSLog(@"appId: %@, appKey: %@", appId, appKey);
}

- (NSString *)getPhone {
    return @"test";
}

@end
