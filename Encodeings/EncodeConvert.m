//
//  EncodeConvert.m
//  Encodeings
//
//  Created by zyun2 on 13-7-18.
//  Copyright (c) 2013年 wgdadmin. All rights reserved.
//

#import "EncodeConvert.h"

const char* convertBytes2Hex(const char *bytes,int len)
{
    NSString *resultStr = @"";
    for(int i =0;i<len;i++)
    {
        int number = 0;
        memcpy(&number , bytes +i , 1);
        int high = number/16;
        int low = number%16;
        resultStr =[resultStr stringByAppendingFormat:@"%x%x ",high,low];
       // resultStr =[resultStr stringByAppendingFormat:@"\\x%x%x",high,low];
    }
    const char *result = [resultStr cStringUsingEncoding:NSASCIIStringEncoding];
    return result;
}


NSString * convertNString2hex(NSString *inputText,NSStringEncoding encoding)
{
    const char *textStr = NULL;
    int len = 0;
    if([inputText canBeConvertedToEncoding:encoding])
    {
         textStr = [inputText cStringUsingEncoding:encoding];
        len = [inputText lengthOfBytesUsingEncoding:encoding];
        NSLog(@"textStr len:%d",[inputText lengthOfBytesUsingEncoding:encoding]);
    }
    else
    {
        NSLog(@"convert failed!");
    }

    
    if(encoding == NSUnicodeStringEncoding)
    {
        unicodeSwitchOrder((char *)textStr,len);
    }
    
    const char *result = convertBytes2Hex(textStr,len);

    return [NSString stringWithFormat:@"%s",result];
}

NSString * convertNString2UnicodeHex(NSString *inputText)
{
    return convertNString2hex(inputText,NSUnicodeStringEncoding);
}

NSString * convertNString2UTF8Hex(NSString *inputText)
{
    return convertNString2hex(inputText,NSUTF8StringEncoding);
}

NSString * convertNString2GB2000Hex(NSString *inputText)
{
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    return convertNString2hex(inputText,enc);
}


char * convertHexStrToBytes(const char *str)
{
    char *dest = malloc(strlen(str)/2 +1);
    memset(dest, 0, strlen(str)/2 +1);
    int j = 0,temp = 0;
    for(int i=0;i<strlen(str);i++)
    {
        
        char c = *(str + i);
        
        j++;
        
        if(j == 1)
        {
            if ('0' <= c && c <= '9') temp = (c - '0')*16;
            else if (c >= 'A' && c <= 'F') temp = 16* ( c - 'A' + 10);
            else if (c >= 'a' && c <= 'f') temp = 16*( c - 'a' + 10);
        }
        else
        {
            if ('0' <= c && c <= '9') temp  += (c - '0');
            else if (c >= 'A' && c <= 'F') temp +=  (c - 'A' + 10);
            else if (c >= 'a' && c <= 'f') temp +=  (c - 'a' + 10);
            memset(dest+i/2, temp, 1);
            j = 0;
        }
        
    }
    return dest;
}

NSString * hexStrToText(NSString *str,NSStringEncoding encoding)
{
    char  *bytes ;
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"//" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"x" withString:@""];    
    str = [str lowercaseString];
    
    bytes  = convertHexStrToBytes([str UTF8String]);

    NSString *result = [[NSString alloc] initWithCString:bytes encoding:encoding]; //可以打印unicode,

    NSLog(@"result");

    return result;
}

void unicodeSwitchOrder(char *str,int len)
{
    char temp;
    for(int i=0;i<len;i++)
    {
        if(i%2==0)
        {
            memcpy(&temp, str +i, 1);

        }
        else
        {
            memcpy(str + i - 1, str + i, 1);
            memcpy(str + i, &temp, 1);
        }
    }
}





