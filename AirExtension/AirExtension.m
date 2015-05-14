//
//  AirAirplay.m
//  AirAirplay
//
//  Created by mobile on 2015/3/9.
// adt -package -target ane /Users/mobile/Documents/build/output.ane /Users/mobile/Documents/build/extension.xml -swc /Users/mobile/Documents/build/iOSExtension.swc -platform iPhone-ARM -C /Users/mobile/Documents/build/ libAirAirplay.a library.swf -platformoptions /Users/mobile/Documents/build/platformRTMP.xml

//
#import "FlashRuntimeExtensions.h"
#import <UIKit/UIApplication.h>
#import <UIKit/UIAlertView.h>
#import "AirExtension.h"
#import <objc/runtime.h>
#import <objc/message.h>

FREContext myCtx = nil;
@implementation AirExtension

static AirExtension *sharedInstance = nil;

+ (AirExtension *)sharedInstance
{
    if (sharedInstance == nil)
    {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return self;
}

/* Remote Response Event ActionScript */
- (void)asyncyToActionScriptWithString:(NSString *)str event:(NSString *)evt
{
    FREDispatchStatusEventAsync(myCtx, (const uint8_t *)[evt UTF8String], (const uint8_t *)[str UTF8String]);
}
/* Remote Response Event ActionScript */
- (void)asyncyToActionScriptWithEvent:(NSString *)evt onString:(NSString *)str
{
    FREDispatchStatusEventAsync(myCtx, (const uint8_t *)[evt UTF8String], (const uint8_t *)[str UTF8String]);
}
@end





/** 初始化物件 **/
DEFINE_ANE_FUNCTION(init)
{
    FREDispatchStatusEventAsync(myCtx, (const uint8_t *)[@"SCREEN_CHANGE" UTF8String], (const uint8_t *)[@"init" UTF8String]);
    return NULL;
}
/****/
DEFINE_ANE_FUNCTION(videoStreamingStartup)
{
    NSString *url = FREObjectToNSString(argv[0]);
    FREDispatchStatusEventAsync(myCtx, (const uint8_t *)[@"stremStartup" UTF8String], (const uint8_t *)[url UTF8String]);
    return BoolToFREObject(true);
}

DEFINE_ANE_FUNCTION(isSupported)
{
    NSLog(@"Entering IsSupported()");
    
    FREObject fo;
    
    FREResult aResult = FRENewObjectFromBool(YES, &fo);
    if (aResult == FRE_OK)
    {
        NSLog(@"Result = %d", aResult);
    }
    else
    {
        NSLog(@"Result = %d", aResult);
    }
    
    NSLog(@"Exiting IsSupported()");
    return fo;
}

// Return FREObject
FREObject BoolToFREObject(BOOL boolean)
{
    FREObject result;
    uint32_t value = boolean;
    FRENewObjectFromBool(value, &result);
    return result;
}
NSString* FREObjectToNSString(FREObject arg)
{
    uint32_t strSize;
    const uint8_t *strCr;
    FREGetObjectAsUTF8(arg, &strSize, &strCr);
    NSString *str = [NSString stringWithUTF8String:(char *)strCr];
    return str;
}

/** AirContextInitializer() **/
// The context initializer is called when the runtime creates the extension context instance.
void AirContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx,
                               uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    
    // Register the links btwn AS3 and ObjC. (dont forget to modify the nbFuntionsToLink integer if you are adding/removing functions)
    NSInteger nbFuntionsToLink = 1;
    *numFunctionsToTest = (int)nbFuntionsToLink;
    
    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * nbFuntionsToLink);
    
    func[0].name = (const uint8_t*) "isSupported";
    func[0].functionData = NULL;
    func[0].function = &isSupported;
    
    *functionsToSet = func;
    
    myCtx = ctx;
}

// Set when the context extension is created.
void AirContextFinalizer(FREContext ctx)
{
    NSLog(@"Entering ContextFinalizer()");
    
    NSLog(@"Exiting ContextFinalizer()");
}

// The extension initializer is called the first time the ActionScript side of the extension
// calls ExtensionContext.createExtensionContext() for any context.
void AirExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet )
{
    
    NSLog(@"Entering ExtInitializer()");
    
    *extDataToSet = NULL;
    *ctxInitializerToSet = &AirContextInitializer;
    *ctxFinalizerToSet = &AirContextFinalizer;
    
    NSLog(@"Exiting ExtInitializer()");
}

void AirExtFinalizer(void *extData) { }

