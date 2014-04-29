//
//  DMViewController.m
//  InjectJS
//
//  Created by Hamdy on 4/29/14.
//  Copyright (c) 2014 Ahmed Hamdy. All rights reserved.
//

#import "DMViewController.h"

@interface DMViewController ()

@end

@implementation DMViewController
@synthesize userScript;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)injectCode:(id)sender {
    // Dispose of any resources that can be recreated.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"pdf-javascript" ofType:@"pdf"];
    NSError*error;
    NSString * id_From_File = [[NSString alloc]
                               initWithContentsOfFile:filePath
                               encoding:NSUTF8StringEncoding
                               error:&error];
    
   
    
    
    NSString *obj = [NSString stringWithFormat:@"/Catalog \n "
    "/Names <<\n"
    "/JavaScript << \n"
    "/Names [ \n"
    " (EmbeddedJS) \n"
    " <<"
    " /S /JavaScript \n"
    " /JS ( \n"
    " %@ \n"
    "\n )"
    "\n >>"
    "\n  ]"
    "\n >>"
    " >> \n" ,userScript.text];
    
    
    id_From_File = [id_From_File stringByReplacingOccurrencesOfString:@"/Catalog"
                                                           withString:obj];
    
    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
    [fileHandler writeData:[id_From_File dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandler closeFile];
    

}
@end
