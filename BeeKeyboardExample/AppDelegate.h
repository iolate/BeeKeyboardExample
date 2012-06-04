//
//  AppDelegate.h
//  BeeKeyboardExample
//
//  Created by Seung-ho Kim on 12. 6. 4..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    id keyDelegate;
}

-(void)setKeyDelegate:(id)_keyDelegate;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@end
