//
//  BaseViewController.m
//  Encodeings
//
//  Created by wgdadmin on 13-7-19.
//  Copyright (c) 2013年 wgdadmin. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.inputTextField.delegate = self;
    self.tapGuestRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDown:)];
    self.tapGuestRecognizer.delegate = self;
    [self.view addGestureRecognizer:self.tapGuestRecognizer];
    
    self.gbkTextView.editable = NO;
    self.unicodeTextView.editable = NO;
    self.utf8TextView.editable = NO;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tapDown:(UITapGestureRecognizer *)guest
{
    [self.inputTextField resignFirstResponder];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UIControl class]]) {
        // we touched a button, slider, or other UIControl
        return NO; // ignore the touch
    }
    return YES; // handle the touch
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

-(void)translate:(NSString *)text
{

}

@end
