//
//  AppDelegate.m
//  BeeKeyboardExample
//
//  Created by Seung-ho Kim on 12. 6. 4..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    keyDelegate = nil;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)setKeyDelegate:(id)_keyDelegate;
{
    keyDelegate = _keyDelegate;
}

-(BOOL)processKeyEvent:(int)keyCode modStat:(int)modStat Down:(BOOL)keyDown
{
    if ([keyDelegate respondsToSelector:@selector(processKeyEvent:modStat:Down:)])
    {
        [keyDelegate processKeyEvent:keyCode modStat:modStat Down:keyDown];
        return  YES;
    }
    
    return  NO;
}

@end
