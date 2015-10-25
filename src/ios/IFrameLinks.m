#import "IFrameLinks.h"

@implementation IFrameLinks

- (BOOL)shouldOverrideLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = [request URL];
    NSDictionary *settings = [(CDVViewController *)self.viewController settings];
    
    NSLog(@"IFrameLinks URL: %@", url);

    NSPredicate *hostTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", [settings objectForKey:@"launchexternalforhost"]];

    if ([[url scheme] isEqualToString:@"maps"] || [hostTest evaluateWithObject: [url host]]) {
        NSLog(@"IFrameLinks Test OK: %@", url);
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
            NSLog(@"IFrameLinks openURL: %@", url);
            return YES;
        }
    }

    return NO;
}

@end
