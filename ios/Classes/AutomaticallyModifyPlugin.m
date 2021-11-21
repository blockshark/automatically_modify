#import "AutomaticallyModifyPlugin.h"
#if __has_include(<automatically_modify/automatically_modify-Swift.h>)
#import <automatically_modify/automatically_modify-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "automatically_modify-Swift.h"
#endif

@implementation AutomaticallyModifyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAutomaticallyModifyPlugin registerWithRegistrar:registrar];
}
@end
