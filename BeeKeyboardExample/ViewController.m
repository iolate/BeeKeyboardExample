//
//  ViewController.m
//  BeeKeyboardExample
//
//  Created by Seung-ho Kim on 12. 6. 4..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface UIApplication (BeeKeyboard)
-(BOOL)isBeeKeyboardWorking;
@end

@implementation ViewController
@synthesize lblStatus, lblKey;

-(void)processKeyEvent:(int)keyCode modStat:(int)modStat Down:(BOOL)keyDown
{
    if (keyDown) {
        NSString* keyString = nil;
        NSDictionary* keyDic = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"KeyData" ofType:@"plist"]];
        
        NSString* mod = @"";
        for (int i = 1; i <= 8; i=i*2) {
            if ((modStat & i) != 0) {
                mod = [mod stringByAppendingString:[[keyDic objectForKey:@"mod"] objectForKey:[NSString stringWithFormat:@"%d", i]] ?: @""];
            }
        }
        
        NSString* key = [[keyDic objectForKey:@"7"] objectForKey:[NSString stringWithFormat:@"%d", keyCode]];

        keyString = [mod stringByAppendingString:key];
        
        lblKey.text = keyString;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BOOL beeWorking = FALSE;
    if ([[UIApplication sharedApplication]  respondsToSelector:@selector(isBeeKeyboardWorking)]) {
        beeWorking = [[UIApplication sharedApplication] isBeeKeyboardWorking];
        //YES: beeKeyboard is installed and enabled.
        //NO: beeKeyboard is installed but not enabled.
    }//else: beeKeyboard isn't installed
    
    if (beeWorking) {
        lblStatus.text = @"On";
        
        AppDelegate* app = [[UIApplication sharedApplication] delegate];
        [app setKeyDelegate:self];
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:@"You can use shortcuts!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        //[alert release]; this project is ARC
    }
}

- (void)viewDidUnload
{
    AppDelegate* app = [[UIApplication sharedApplication] delegate];
    [app setKeyDelegate:nil];
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
