#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

@interface IFrameLinks: CDVPlugin

- (BOOL)shouldOverrideLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType;

@end
