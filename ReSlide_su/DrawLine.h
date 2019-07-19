//
//  DrawLine.h
//  ReSlide_su
//
//  Created by 苏展慧 on 2019/7/15.
//  Copyright © 2019 苏展慧. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Line.h"

//NS_ASSUME_NONNULL_BEGIN

@interface DrawLine : UIView

//- (void) clearAction ;  //撤销上一条线条

//所有的线条信息，包含了颜色，坐标和粗细信息
@property (nonatomic, strong) NSMutableArray *lineInfos ;
//从外部传递的笔刷长度和宽度，在包含画板的VC中，要是颜色、粗细有所改变，都应该将对应的值传进来
@property (nonatomic, strong) UIColor *lineColor ;
@property (nonatomic, assign) CGFloat brushWidth ;

- (void) clear ;  //撤销上一条线条

@end


//NS_ASSUME_NONNULL_END
