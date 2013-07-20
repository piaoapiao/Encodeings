//
//  TextToHexViewController.m
//  Encodeings
//
//  Created by wgdadmin on 13-7-20.
//  Copyright (c) 2013年 wgdadmin. All rights reserved.
//

#import "TextToHexViewController.h"


@interface TextToHexViewController ()
@property (nonatomic,strong) NSString *name;
@end

@implementation TextToHexViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.inputTextField.text = @"王露";
    [self translate:self.inputTextField.text];
    // Do any additional setup after loading the view from its nib.
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)translate:(NSString *)text
{
    self.gbkTextView.text = convertNString2GB2000Hex(text);
    self.utf8TextView.text = convertNString2UTF8Hex(text);
    self.unicodeTextView.text = convertNString2UnicodeHex(text);
}









@end
