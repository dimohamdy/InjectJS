//
//  DMViewController.h
//  InjectJS
//
//  Created by Hamdy on 4/29/14.
//  Copyright (c) 2014 Ahmed Hamdy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *userScript;
@property (strong, nonatomic) IBOutlet UIButton *inject;
- (IBAction)injectCode:(id)sender;

@end
