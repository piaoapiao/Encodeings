//
//  ViewController.m
//  Encodeings
//
//  Created by wgdadmin on 13-7-17.
//  Copyright (c) 2013年 wgdadmin. All rights reserved.
//

#import "ViewController.h"
#import "EncodeConvert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 //   UITextView *inputText = ;
    
    NSString *rs = convertNString2UnicodeHex(@"网知道");
//    NSLog(@"rs:%@",rs);
//    
//    rs = convertNString2UTF8Hex(@"网知道");
//    NSLog(@"rs:%@",rs);
//    
//    rs = convertNString2GB2000Hex(@"网知道");
//    NSLog(@"rs:%@",rs);
    

    
//    const char *hex = "\xe7\xbd\x91\xe7\x9f\xa5\x00\x00\x00";
//    NSString *result = [NSString stringWithCString:hex encoding:NSUTF8StringEncoding];

    
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    rs = hexStrToText(@"cdf8",enc);
        NSLog(@"rs:%@",rs);
    
    
    rs = hexStrToText(@"5   17fE 577",NSUnicodeStringEncoding);
    NSLog(@"rs:%@",rs);

     rs = hexStrToText(@"\\xe7bd91e79fa5",NSUTF8StringEncoding);
        NSLog(@"rs:%@",rs);
    
    
    //NSLog(@"result:%@",result);
    
    char *Cstring = "\xe7\xbd\x91\xe7\x9f\xa5";
    
   NSString *astring = [[NSString alloc] initWithCString:Cstring encoding:NSUTF8StringEncoding];
    
    Cstring = "\xe5\x77\x53\x90 ";
    astring = [[NSString alloc] initWithCString:Cstring encoding:NSUnicodeStringEncoding];
    NSLog(@"astring:%@",astring);
    
    Cstring = "\xcd\xf8";
    enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    astring = [[NSString alloc] initWithCString:Cstring encoding:enc];
    NSLog(@"astring:%@",astring);
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
