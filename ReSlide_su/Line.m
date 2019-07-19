//
//  Line.m
//  ReSlide_su
//
//  Created by 苏展慧 on 2019/7/15.
//  Copyright © 2019 苏展慧. All rights reserved.
//

#import "Line.h"

@interface Line ()

@end

@implementation Line

- (instancetype) init
{
    if (self = [super init])
    {
        self.linePoints = [[NSMutableArray alloc] initWithCapacity:10] ;
        _color = [UIColor blackColor] ;
    }
    
    return self ;
}

@end
