//
//  ViewController.h
//  ReSlide_su
//
//  Created by 苏展慧 on 2019/7/15.
//  Copyright © 2019 苏展慧. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UITextField *_slideTextField ; //定义文本输入区域
    UITextField *_userTextField ; //定义文本输入区域
    
    UIImageView *_imageV ;
}

//定义属性
@property (retain, nonatomic) UITextField *slideTextField ;
@property (retain, nonatomic) UITextField *userTextField ;

@property (retain, nonatomic) UIImageView *imageV ;


- (IBAction) clearAction ;

@end

