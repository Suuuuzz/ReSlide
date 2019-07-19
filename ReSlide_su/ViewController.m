//
//  ViewController.m
//  ReSlide_su
//
//  Created by 苏展慧 on 2019/7/15.
//  Copyright © 2019 苏展慧. All rights reserved.
//

#import "ViewController.h"
#import "DrawLine.h"
#import "Constant.h"
#import "Masonry.h"

@interface ViewController ()

- (void) clearAction:(UIButton*) btn ;

@property (nonatomic, strong) DrawLine *touchDrawView ;

@end

@implementation ViewController


//创建previous的button
- (void) createPreBtn
{
    UIButton* prebtn = [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
    prebtn.frame = CGRectMake(50, 370, 100, 35) ;
    
    UIColor *color = [UIColor redColor] ;
    UIColor *btnColor = [color colorWithAlphaComponent:0.7] ;
    prebtn.backgroundColor = btnColor ;
    
    [prebtn setTintColor:[UIColor whiteColor]] ;
    prebtn.titleLabel.font = [UIFont systemFontOfSize:20] ;
    
    [prebtn setTitle:@"Previous" forState: UIControlStateNormal] ;
    
    //触发往前翻一页
    [prebtn addTarget:self action:@selector(pressPreButton) forControlEvents:UIControlEventTouchUpInside] ;
    
    [self.view addSubview:prebtn] ;
}

//创建next的button
- (void) createNextBtn
{
    UIButton* nextbtn = [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
    nextbtn.frame = CGRectMake(760, 370, 100, 35) ;
    
    UIColor *color = [UIColor redColor] ;
    UIColor *btnColor = [color colorWithAlphaComponent:0.7] ;
    nextbtn.backgroundColor = btnColor ;
    
    [nextbtn setTintColor:[UIColor whiteColor]] ;
    nextbtn.titleLabel.font = [UIFont systemFontOfSize:20] ;
    
    [nextbtn setTitle:@"Next" forState: UIControlStateNormal] ;
    
    //触发往后翻一页
    [nextbtn addTarget:self action:@selector(pressNextButton) forControlEvents:UIControlEventTouchUpInside] ;
    
    [self.view addSubview:nextbtn] ;
}


//当触发按下previous按钮时
- (void) pressPreButton
{
    UIImageView* slideView = [[UIImageView alloc] init] ;
    slideView.frame = CGRectMake(130, 20, 620, 340) ;
    
    UIImage* slide = [[UIImage alloc] init] ;
    
    extern int current_slide ;
    
    NSString* strName = [NSString stringWithFormat:@"%d.jpg",--current_slide] ;
    slide = [UIImage imageNamed:strName] ;
    slideView.image = slide ;
    slideView.contentMode = UIViewContentModeScaleAspectFit ;
    
    [self.view addSubview:slideView] ;
}


//当触发按下next按钮时
- (void) pressNextButton
{
    UIImageView* slideView = [[UIImageView alloc] init] ;
    slideView.frame = CGRectMake(130, 20, 620, 340) ;
    
    UIImage* slide = [[UIImage alloc] init] ;
    
    extern int current_slide ;
    
    NSString* strName = [NSString stringWithFormat:@"%d.jpg",++current_slide] ;
    slide = [UIImage imageNamed:strName] ;
    slideView.image = slide ;
    slideView.contentMode = UIViewContentModeScaleAspectFit ;
    
    [self.view addSubview:slideView] ;
}


//创建change slide的文本区域
- (void) createSlideText
{
    self.slideTextField = [[UITextField alloc] init] ;
    self.slideTextField.frame = CGRectMake(200, 370, 100, 35) ;
    self.slideTextField.borderStyle = UITextBorderStyleRoundedRect ;
    
    self.slideTextField.keyboardType = UIKeyboardTypeNumberPad ;  //设置虚拟键盘风格，纯数字
    self.slideTextField.placeholder = @"Enter No.Slide" ;
    self.slideTextField.secureTextEntry = NO ;
    
    [self.view addSubview:self.slideTextField] ;
}

//创建change slide的button
- (void) createTextBtn
{
    UIButton* textbtn = [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
    textbtn.frame = CGRectMake(320, 370, 100, 35) ;
    
    UIColor *color = [UIColor redColor] ;
    UIColor *btnColor = [color colorWithAlphaComponent:0.7] ;
    textbtn.backgroundColor = btnColor ;
    
    [textbtn setTintColor:[UIColor whiteColor]] ;
    textbtn.titleLabel.font = [UIFont systemFontOfSize:16] ;
    
    [textbtn setTitle:@"Change Slide" forState: UIControlStateNormal] ;
    
    //触发点击change slide按钮
    [textbtn addTarget:self action:@selector(pressSlideButton) forControlEvents:UIControlEventTouchUpInside] ;
    
    [self.view addSubview:textbtn] ;
}

//触发change slide按钮时
- (void) pressSlideButton
{
    UIImageView* slideView = [[UIImageView alloc] init] ;
    slideView.frame = CGRectMake(130, 20, 620, 340) ;
    
    UIImage* slide = [[UIImage alloc] init] ;
    
    //获取输入框信息
    NSString *slideName = _slideTextField.text ;
    int sn = [slideName intValue] ;
    extern int current_slide ;
    current_slide = sn ;
    
    NSString* strName = [NSString stringWithFormat:@"%d.jpg",current_slide] ;
    slide = [UIImage imageNamed:strName] ;
    slideView.image = slide ;
    slideView.contentMode = UIViewContentModeScaleAspectFit ;
    
    [self.view addSubview:slideView] ;
    
}

//创建change user的文本框
- (void) createUserText
{
    self.userTextField = [[UITextField alloc] init] ;
    self.userTextField.frame = CGRectMake(490, 370, 100, 35) ;
    self.userTextField.borderStyle = UITextBorderStyleRoundedRect ;
    
    self.userTextField.keyboardType = UIKeyboardTypeNumberPad ;  //设置虚拟键盘风格，纯数字
    self.userTextField.placeholder = @"Enter No.User" ;
    self.userTextField.secureTextEntry = NO ;
    
    [self.view addSubview:self.userTextField] ;
}

//创建change user的按钮
- (void) creaetUserBtn
{
    UIButton* userbtn = [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
    userbtn.frame = CGRectMake(610, 370, 100, 35) ;
    
    UIColor *color = [UIColor redColor] ;
    UIColor *btnColor = [color colorWithAlphaComponent:0.7] ;
    userbtn.backgroundColor = btnColor ;
    
    [userbtn setTintColor:[UIColor whiteColor]] ;
    userbtn.titleLabel.font = [UIFont systemFontOfSize:16] ;
    
    [userbtn setTitle:@"Change User" forState: UIControlStateNormal] ;
    
    //触发点击change slide按钮
    [userbtn addTarget:self action:@selector(pressUserButton) forControlEvents:UIControlEventTouchUpInside] ;
    
    [self.view addSubview:userbtn] ;
}

//当触发change user按钮时
- (void) pressUserButton
{
    //如果user是0，为老师，收到服务器传来的所有highlight信息
    //如果user不是0，就新建一个一模一样的视图？？
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    extern int current_slide ;
    current_slide = 1 ;
    
    [self createPreBtn] ;
    [self createNextBtn] ;
    //[self createSlide] ;
    
    [self createSlideText] ;
    [self createTextBtn] ;
    
    [self createUserText] ;
    [self creaetUserBtn] ;
    
    
    //__weak typeof(self) weakSelf = self ;  //防止block中循环l引用
    //创建slide区域
    //_imageV = [[UIImageView alloc] init] ;
    _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(130, 20, 620, 340)] ;
    _imageV.backgroundColor = [UIColor clearColor] ;
    
    _imageV.image = [UIImage imageNamed:@"1.jpg"] ;
    _imageV.contentMode = UIViewContentModeScaleAspectFit ;
    [self.view addSubview:_imageV] ;
//    [_imageV mas_makeConstraints:^(MASConstraintMaker *make){
//        make.center.equalTo(weakSelf.view) ;
//        make.size.mas_equalTo(CGSizeMake(750, 340)) ;
//    }] ;
    
    
    //创建highlight按钮
    UIButton* highbtn = [UIButton buttonWithType:UIButtonTypeCustom] ;
    highbtn.frame = CGRectMake(790, 120, 60, 60) ;
    UIColor *color = [UIColor redColor] ;
    UIColor *btnColor = [color colorWithAlphaComponent:0.7] ;
    highbtn.backgroundColor = btnColor ;
    //半径
    highbtn.layer.cornerRadius = 30 ;
    [highbtn setTintColor:[UIColor whiteColor]] ;
    highbtn.titleLabel.font = [UIFont systemFontOfSize:14] ;
    [highbtn setTitle:@"Highlight" forState: UIControlStateNormal] ;
    //触发点击highlight按钮
    [highbtn addTarget:self action:@selector(clearAction:) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:highbtn] ;
    
    //创建erase highlight按钮
    UIButton* erahighbtn = [UIButton buttonWithType:UIButtonTypeCustom] ;
    erahighbtn.titleLabel.numberOfLines = 2 ;
    erahighbtn.frame = CGRectMake(790, 230, 60, 60) ;
    erahighbtn.backgroundColor = btnColor ;
    //半径
    erahighbtn.layer.cornerRadius = 30 ;
    [erahighbtn setTintColor:[UIColor whiteColor]] ;
    erahighbtn.titleLabel.font = [UIFont systemFontOfSize:14] ;
    [erahighbtn setTitle:@"   Erase Highlight" forState: UIControlStateNormal] ;
    //触发点击erase highlight按钮
    [erahighbtn addTarget:self action:@selector(clearAction:) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:erahighbtn] ;
    
//    self.touchDrawView = [[DrawLine alloc] initWithFrame:_imageV.frame] ;
//    [self.view addSubview:self.touchDrawView] ;
    
    highbtn.tag = 101 ;
    erahighbtn.tag = 102 ;
    
}


- (void) clearAction:(UIButton*) btn
{
    self.touchDrawView = [[DrawLine alloc] initWithFrame:_imageV.frame] ;
    [self.view addSubview:self.touchDrawView] ;
    if (btn.tag == 101)
    {
        NSLog(@"测试！") ;
        self.touchDrawView.lineColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5] ;
        self.touchDrawView.brushWidth = 12 ;
    }
    if (btn.tag == 102)
    {
        NSLog(@"擦除！") ;
//        self.touchDrawView.lineColor = [UIColor clearColor] ;
//        self.touchDrawView.brushWidth = 20 ;
        [self.touchDrawView clear] ;
    }
}

@end
