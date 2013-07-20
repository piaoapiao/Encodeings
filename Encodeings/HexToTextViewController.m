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
    UILabel *inputLbl =  [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
    inputLbl.text = NSLocalizedString(@"输入:", nil);
    [self.view addSubview:inputLbl];
    
    self.inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 10, 150, 60)];
//    self.inputTextView.layer.borderWidth = 2;
//    self.inputTextView.layer.borderColor = [[UIColor grayColor] CGColor];
    [self.view addSubview:self.inputTextView];
    
    
    
    UILabel *gbkLbl =  [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 60, 60)];
    gbkLbl.text = NSLocalizedString(@"GBK:", nil);
    [self.view addSubview:gbkLbl];
    
    self.gbkTextView = [[UITextView alloc] initWithFrame:CGRectMake(80, 80, 150, 60)];
    self.gbkTextView.layer.borderWidth = 2;
    self.gbkTextView.layer.borderColor = [[UIColor grayColor] CGColor];
    [self.view addSubview:self.gbkTextView];
    
//    UILabel *gbkLbl =  [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 60, 60)];
//    gbkLbl.text = NSLocalizedString(@"GBK:", nil);
//    [self.view addSubview:gbkLbl];
//    
//    self.gbkTextView = [[UITextView alloc] initWithFrame:CGRectMake(80, 80, 150, 60)];
//    self.gbkTextView.layer.borderWidth = 2;
//    self.gbkTextView.layer.borderColor = [[UIColor grayColor] CGColor];
//    [self.view addSubview:self.gbkTextView];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
