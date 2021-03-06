//
//  HexToTextViewController.m
//  Encodeings
//
//  Created by wgdadmin on 13-7-19.
//  Copyright (c) 2013年 wgdadmin. All rights reserved.
//

#import "HexToTextViewController.h"

@interface HexToTextViewController ()
@property (nonatomic,strong) IBOutlet UITextView *inputTextView;
@property (nonatomic,strong) IBOutlet UITextView *gbkTextView;
@end

@implementation HexToTextViewController

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
    
    
    UILabel *inputLbl =  [[UILabel alloc] initWithFrame:CGRectMake(0, 15, 76, 40)];
    inputLbl.textAlignment = NSTextAlignmentCenter;
    inputLbl.text = NSLocalizedString(@"Input:", nil);
    [self.view addSubview:inputLbl];
    
    self.inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(76, 20, 235, 30)];
    self.inputTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.inputTextField.clearButtonMode = UITextFieldViewModeAlways;
    self.inputTextField.delegate = self;
    [self.view addSubview:self.inputTextField];
    


//    self.inputLbl = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 230, 30)];
//    self.inputLbl.layer.backgroundColor = [[UIColor grayColor] CGColor];
//    self.inputLbl.layer.borderWidth = 1;
//    [self.view addSubview:self.inputLbl];
    
    
    UILabel *gbkLbl =  [[UILabel alloc] initWithFrame:CGRectMake(0, 78,76,43)];
    gbkLbl.textAlignment = NSTextAlignmentCenter;    
    gbkLbl.text = NSLocalizedString(@"GBK:", nil);
    [self.view addSubview:gbkLbl];
    
    self.gbkTextView = [[UITextView alloc] initWithFrame:CGRectMake(76,68,235, 53)];
    self.gbkTextView.backgroundColor = [UIColor grayColor];
    self.gbkTextView.editable = NO;
    [self.view addSubview:self.gbkTextView];
    
    UILabel *unicodeLbl =  [[UILabel alloc] initWithFrame:CGRectMake(0,147,76,42)];
    unicodeLbl.textAlignment = NSTextAlignmentCenter;     
    unicodeLbl.text = NSLocalizedString(@"Unicode:", nil);
    [self.view addSubview:unicodeLbl];
    
    self.unicodeTextView = [[UITextView alloc] initWithFrame:CGRectMake(76,141,234,53)];
    self.unicodeTextView.backgroundColor = [UIColor grayColor];
    self.unicodeTextView.editable = NO;    
    [self.view addSubview:self.unicodeTextView];
    
    UILabel *utf8Lbl =  [[UILabel alloc] initWithFrame:CGRectMake(0,219,76,47)];
    utf8Lbl.textAlignment = NSTextAlignmentCenter;       
    utf8Lbl.text = NSLocalizedString(@"UTF-8:", nil);
    [self.view addSubview:utf8Lbl];
    
    self.utf8TextView = [[UITextView alloc] initWithFrame:CGRectMake(76,213,235,53)];
    self.utf8TextView.backgroundColor = [UIColor grayColor];
    self.utf8TextView.editable = NO;        
    [self.view addSubview:self.utf8TextView];
    
    self.inputTextField.text = @"616263313233";
    [self translate:self.inputTextField.text];
    
//    UIButton *number1Btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 190, 30, 30)];
//    number1Btn.tag = 1;
//    number1Btn.backgroundColor = [UIColor redColor];
//    [number1Btn setTitle:@"1" forState:UIControlStateNormal];
//    [number1Btn addTarget:self action:@selector(clickNumber:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:number1Btn];

	// Do any additional setup after loading the view.
}

-(void)clickNumber:(UIButton *)sender
{
    NSLog(@"sender");
    if(!self.inputLbl.text)
    {
        if(sender.tag <10)
        {
            NSString *inputStr = [NSString stringWithFormat:@"%d",sender.tag];
            self.inputLbl.text = inputStr;
        }
        else
        {
            char temp = 'A';
            temp = temp + sender.tag -10;
            NSString *inputStr = [NSString stringWithFormat:@"%@%c",self.inputLbl.text,temp];
            self.inputLbl.text = inputStr;
        }
    }
    else
    {
        if(sender.tag <10)
        {
            NSString *inputStr = [NSString stringWithFormat:@"%@%d",self.inputLbl.text,sender.tag];
            self.inputLbl.text = inputStr;
        }
        else
        {
            char temp = 'A';
            temp = temp + sender.tag -10;
            NSString *inputStr = [NSString stringWithFormat:@"%@%c",self.inputLbl.text,temp];
            self.inputLbl.text = inputStr;
        }
    }
    [self translate:self.inputLbl.text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)translate:(NSString *)text
{
    if(nil != text)
    {
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        self.gbkTextView.text = hexStrToText(text,enc);
        self.utf8TextView.text = hexStrToText(text,NSUTF8StringEncoding);
        self.unicodeTextView.text = hexStrToText(text,NSUnicodeStringEncoding);
    }
    else
    {
        self.gbkTextView.text = nil;
        self.utf8TextView.text = nil;
        self.unicodeTextView.text = nil;
    }
}

#pragma mark--UITextFieldDelegate
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField; 
//{
//    return NO;
//}

//-(void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    [self.inputTextField resignFirstResponder];
//}
//
//-(void)textFieldDidEndEditing:(UITextField *)textField
//{
//    NSLog(@"test");
//}

//-(void)viewWillLayoutSubviews
//{
//    int row = 0,line = 0;
//    for(int i =0;i<16;i++)
//    {
//        row = i/4;
//        line = i%4;
//        UIButton *number1Btn = [[UIButton alloc] initWithFrame:CGRectMake(32 +70*line , 190 + 50*row, 40, 40)];
//        number1Btn.tag = i;
//        number1Btn.backgroundColor = [UIColor redColor];
//        if(i<=9)
//        {
//
//            [number1Btn setTitle:[NSString stringWithFormat:@"%d",number1Btn.tag] forState:UIControlStateNormal];
//        }
//        else
//        {
//            char temp = 'A';
//            temp = temp + i -10;
//            [number1Btn setTitle:[NSString stringWithFormat:@"%c",temp] forState:UIControlStateNormal];
//        }
//
//        [number1Btn addTarget:self action:@selector(clickNumber:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:number1Btn];
//    }
//    
//}



@end
