//
//  TextToHexViewController.h
//  Encodeings
//
//  Created by wgdadmin on 13-7-20.
//  Copyright (c) 2013年 wgdadmin. All rights reserved.
//

#import "BaseViewController.h"

@interface TextToHexViewController : BaseViewController <UITextFieldDelegate,UIGestureRecognizerDelegate>

@property (nonatomic,strong) IBOutlet  UITextField *inputTextField;

@property (nonatomic,strong) IBOutlet  UITextView *gbkTextView;

@property (nonatomic,strong) IBOutlet  UITextView *utf8TextView;

@property (nonatomic,strong) IBOutlet  UITextView *unicodeTextView;

@property (nonatomic,strong) UIGestureRecognizer *tapGuestRecognizer;

@end
