//
//  BaseViewController.h
//  Encodeings
//
//  Created by wgdadmin on 13-7-19.
//  Copyright (c) 2013年 wgdadmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController <UITextFieldDelegate,UIGestureRecognizerDelegate>
@property (nonatomic,strong) IBOutlet  UITextField *inputTextField;
@property (nonatomic,strong) UIGestureRecognizer *tapGuestRecognizer;
@property (nonatomic,strong) IBOutlet  UITextView *gbkTextView;

@property (nonatomic,strong) IBOutlet  UITextView *utf8TextView;

@property (nonatomic,strong) IBOutlet  UITextView *unicodeTextView;
@end
