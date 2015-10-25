#import "IFrameLinks.h"

@implementation IFrameLinks

- (BOOL)shouldOverrideLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = [request URL];
    //NSLog(@"IFrameLinks URL: %@", url);

    //if ([[url scheme] isEqualToString:@"maps"] || [hostTest evaluateWithObject: [url host]]) {
    if((navigationType == UIWebViewNavigationTypeLinkClicked) && ([[NSString stringWithFormat:@"%@",url] rangeOfString:@"ligatus"].location != NSNotFound)) {
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
            return YES;
        }
    }
    
    if((navigationType == UIWebViewNavigationTypeLinkClicked) && ([[NSString stringWithFormat:@"%@",url] rangeOfString:@"taboola"].location != NSNotFound)) {
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
            return YES;
        }
    }

    return NO;
}

@end
