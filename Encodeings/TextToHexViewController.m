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
    self.gbkTextView.editable = NO;
    self.unicodeTextView.editable = NO;
    self.utf8TextView.editable = NO;
    
    self.inputTextField.delegate = self;
    self.tapGuestRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDown:)];
    self.tapGuestRecognizer.delegate = self;
    [self.view addGestureRecognizer:self.tapGuestRecognizer];
    // Do any additional setup after loading the view from its nib.
}

-(void)tapDown:(UITapGestureRecognizer *)guest
{
    [self.inputTextField resignFirstResponder];
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

#pragma mark -- UITextViewDelegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
     
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    [self translate:text];
    return YES;
}

-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"clear");
    [self translate:nil];
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UIControl class]]) {
        // we touched a button, slider, or other UIControl
        return NO; // ignore the touch
    }
    return YES; // handle the touch
}





@end
