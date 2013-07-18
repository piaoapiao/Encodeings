//
//  ViewController.m
//  Encodeings
//
//  Created by wgdadmin on 13-7-17.
//  Copyright (c) 2013年 wgdadmin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *inputText = @"王邓露111";
    
    
    
  // const char *textStr = [inputText UTF8String];
    
    const char *textStr = [inputText cStringUsingEncoding:NSUTF8StringEncoding];
    
    
    NSString *result = @"";
    
    for(int i =0;i<strlen(textStr);i++)
    {
        int number = 0;
        memcpy(&number , textStr +i , 1);
        int high = number/16;
        int low = number%16;
        result =[result stringByAppendingFormat:@"\\x%x%x ",high,low];;
    }
    NSLog(@"result:%@",result);

    NSLog(@"result:%@",result);    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
