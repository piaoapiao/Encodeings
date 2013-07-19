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
    NSString *rs = convertNString2UnicodeHex(@"网国栋");
    NSLog(@"rs:%@",rs);
    
    rs = convertNString2UTF8Hex(@"网国栋");
    NSLog(@"rs:%@",rs);
    
    rs = convertNString2GB2000Hex(@"网国栋");
    NSLog(@"rs:%@",rs);
    
    NSLog(@"rs:%@",rs);
    
    const char *hex = "\xe7\xbd\x91\xe5\x9b\xbd";
    NSString *result = [NSString stringWithCString:hex encoding:NSUTF8StringEncoding];
    
    
    const char *cstring = [@"网国栋" cStringUsingEncoding:NSUTF8StringEncoding];
    rs = [NSString stringWithCString:cstring encoding:NSUTF8StringEncoding];
    NSLog(@"rs:%@",rs);
    
    
    rs = hexStrToText(@"dd",NSUTF8StringEncoding);
    NSLog(@"rs:%@",rs);
    
    
   rs = hexStrToText(@"e7bd91 e59bbd e6a08b",NSUTF8StringEncoding);
    NSLog(@"rs:%@",rs);
    
    rs = hexStrToText(@"517ffd56",NSUnicodeStringEncoding);
    NSLog(@"rs:%@",rs);

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
