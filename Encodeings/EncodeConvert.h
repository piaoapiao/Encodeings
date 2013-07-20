//
//  EncodeConvert.h
//  Encodeings
//
//  Created by zyun2 on 13-7-18.
//  Copyright (c) 2013年 wgdadmin. All rights reserved.
//

#import <Foundation/Foundation.h>

//@interface EncodeConvert : NSObject
//NSString * text(NSString *inputText);
//@end
//const char* convertBytes2Hex(const char *bytes);
const char* convertBytes2Hex(const char *bytes,int len);
NSString * convertNString2hex(NSString *inputText,NSStringEncoding encoding);
NSString * convertNString2UnicodeHex(NSString *inputText);
NSString * convertNString2UTF8Hex(NSString *inputText);
NSString * convertNString2GB2000Hex(NSString *inputText);
//NSString * convertNString2GB2310Hex(NSString *inputText);


char * convertCString2NString(NSString *src,NSStringEncoding encoding);

NSString * hexStrToText(NSString *str,NSStringEncoding encoding);

void unicodeSwitchOrder(char * str,int len);

char * convertHexStrToBytes(const char *str,int len);