#ifndef AirAirplay_AirAirplay_h
#define AirAirplay_AirAirplay_h
#endif

#import "FlashRuntimeExtensions.h"
#import <UIKit/UIKit.h>

#define DEFINE_ANE_FUNCTION(fun) FREObject fun(FREContext context, void* functionData, uint32_t argc, FREObject argv[])

@interface  AirExtension : NSObject

+ (id)sharedInstance;

- (void)asyncyToActionScriptWithString:(NSString *)str event:(NSString *)evt;

@end

DEFINE_ANE_FUNCTION(init);
DEFINE_ANE_FUNCTION(videoStreamingStartup);
DEFINE_ANE_FUNCTION(isSupported);
DEFINE_ANE_FUNCTION(openUrl);
DEFINE_ANE_FUNCTION(systemExit);

void AirContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);
void AirContextFinalizer(FREContext ctx);

/** 必須和extension XML檔案名稱一致 **/
void AirExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet );
void AirExtFinalizer(void *extData);



/** ObjC to Flash **/
FREObject BoolToFREObject(BOOL boolean);

/** Flash to ObjC **/
NSString* FREObjectToNSString(FREObject arg);