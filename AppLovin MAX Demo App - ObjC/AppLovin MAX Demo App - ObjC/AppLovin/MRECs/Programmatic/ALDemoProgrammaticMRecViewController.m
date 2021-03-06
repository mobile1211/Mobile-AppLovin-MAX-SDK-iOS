//
//  ALDemoProgrammaticMRecViewController.m
//  AppLovin MAX Demo App - ObjC
//
//  Created by Nana Amoah on 11/18/21.
//  Copyright © 2021 AppLovin Corporation. All rights reserved.
//

#import "ALDemoProgrammaticMRecViewController.h"
#import <AppLovinSDK/AppLovinSDK.h>

@interface ALDemoProgrammaticMRecViewController()<ALAdLoadDelegate, ALAdDisplayDelegate, ALAdViewEventDelegate>
@property (nonatomic, strong) ALAdView *adView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *loadButton;
@end

@implementation ALDemoProgrammaticMRecViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create the MRec view
    self.adView = [[ALAdView alloc] initWithSize: ALAdSize.mrec];
    
    // Optional: Implement the ad delegates to receive ad events.
    self.adView.adLoadDelegate = self;
    self.adView.adDisplayDelegate = self;
    self.adView.adEventDelegate = self;
    self.adView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Call loadNextAd() to start showing ads
    [self.adView loadNextAd];
    
    // Center the MRec and anchor it to the top of the screen.
    [self.view addSubview: self.adView];
    
    [[self.adView.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor] setActive: YES];
    [[self.adView.topAnchor constraintEqualToAnchor: self.view.topAnchor] setActive: YES];
    
    [[self.adView.widthAnchor constraintEqualToConstant: 300] setActive: YES];
    [[self.adView.heightAnchor constraintEqualToConstant: 250] setActive: YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear: animated];
    
    self.adView.adLoadDelegate = nil;
    self.adView.adDisplayDelegate = nil;
    self.adView.adEventDelegate = nil;
}

#pragma mark - IB Action

- (IBAction)loadNextAd
{
    [self.adView loadNextAd];
    
    self.loadButton.enabled = NO;
}

#pragma mark - Ad Load Delegate

- (void)adService:(ALAdService *)adService didLoadAd:(ALAd *)ad
{
    [self logCallback: __PRETTY_FUNCTION__];
}

- (void)adService:(ALAdService *)adService didFailToLoadAdWithError:(int)code
{
    // Look at ALErrorCodes.h for list of error codes
    [self logCallback: __PRETTY_FUNCTION__];
    
    self.loadButton.enabled = YES;
}

#pragma mark - Ad Display Delegate

- (void)ad:(ALAd *)ad wasDisplayedIn:(UIView *)view
{
    [self logCallback: __PRETTY_FUNCTION__];
    
    self.loadButton.enabled = YES;
}

- (void)ad:(ALAd *)ad wasHiddenIn:(UIView *)view
{
    [self logCallback: __PRETTY_FUNCTION__];
}

- (void)ad:(ALAd *)ad wasClickedIn:(UIView *)view
{
    [self logCallback: __PRETTY_FUNCTION__];
}

#pragma mark - Ad View Event Delegate

- (void)ad:(ALAd *)ad didPresentFullscreenForAdView:(ALAdView *)adView
{
    [self logCallback: __PRETTY_FUNCTION__];
}

- (void)ad:(ALAd *)ad willDismissFullscreenForAdView:(ALAdView *)adView
{
    [self logCallback: __PRETTY_FUNCTION__];
}

- (void)ad:(ALAd *)ad didDismissFullscreenForAdView:(ALAdView *)adView
{
    [self logCallback: __PRETTY_FUNCTION__];
}

- (void)ad:(ALAd *)ad willLeaveApplicationForAdView:(ALAdView *)adView
{
    [self logCallback: __PRETTY_FUNCTION__];
}

- (void)ad:(ALAd *)ad didFailToDisplayInAdView:(ALAdView *)adView withError:(ALAdViewDisplayErrorCode)code
{
    [self logCallback: __PRETTY_FUNCTION__];
}

@end
