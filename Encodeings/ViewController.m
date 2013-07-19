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
    char a = 'd';
    char *p = &a;
    
    
    char e = *p;
    
    char f = p++;
    
    memset(p, 9, 1);
    
    memset(p+1,5 , 1);
    
    int d = (int)(*++p);
    
    

//    const NSStringEncoding *encodings = [NSString availableStringEncodings];
//    NSMutableString *str = [[NSMutableString alloc] init];
//    NSStringEncoding encoding;
//    
//    while ((encoding = *encodings++) != 0)
//    {
//        [str appendFormat: @"%@ === %i\n", [NSString localizedNameOfStringEncoding:encoding], encoding];
//        NSLog(@"%@",str);
//    }
//    
    NSString *rs = convertNString2UnicodeHex(@"网知道");
    NSLog(@"rs:%@",rs);
    
    rs = convertNString2UTF8Hex(@"网知道");
    NSLog(@"rs:%@",rs);
    
    rs = convertNString2GB2000Hex(@"网知道");
    NSLog(@"rs:%@",rs);
    

    
//    const char *hex = "\xe7\xbd\x91\xe7\x9f\xa5\x00\x00\x00";
//    NSString *result = [NSString stringWithCString:hex encoding:NSUTF8StringEncoding];

    
    char *t = [@"e7bd91" UTF8String];
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
   rs = hexStrToText(@"cdf8",enc);
    NSLog(@"rs:%@",rs);
    
    rs = hexStrToText(@"5   17fE 577",NSUnicodeStringEncoding);
    NSLog(@"rs:%@",rs);

     rs = hexStrToText(@"\\xe7bd91e79fa5",NSUTF8StringEncoding);
        NSLog(@"rs:%@",rs);
    //NSLog(@"result:%@",result);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
