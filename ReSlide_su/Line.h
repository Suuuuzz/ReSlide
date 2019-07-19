//
//  Line.h
//  ReSlide_su
//
//  Created by 苏展慧 on 2019/7/15.
//  Copyright © 2019 苏展慧. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Line : NSObject

@property (nonatomic, strong) NSMutableArray <__kindof NSValue *>*linePoints ;  //线条所包含的所有点
@property (nonatomic, strong) UIColor *color ;  //线条的颜色
@property (nonatomic) CGFloat lineWidth ;

@end

NS_ASSUME_NONNULL_END
