//
//  ViewController.h
//  BeeKeyboardExample
//
//  Created by Seung-ho Kim on 12. 6. 4..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel* lblStatus;
    IBOutlet UILabel* lblKey;
}

@property (nonatomic, strong) IBOutlet UILabel* lblStatus;
@property (nonatomic, strong) IBOutlet UILabel* lblKey;
@end
