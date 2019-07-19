//
//  DrawLine.m
//  ReSlide_su
//
//  Created by 苏展慧 on 2019/7/15.
//  Copyright © 2019 苏展慧. All rights reserved.
//

#import "DrawLine.h"
#import "Line.h"

@interface DrawLine ()


@end


@implementation DrawLine

//撤销上一条线条
- (void) clear
{
    NSLog(@"111111") ;
    if ([self.lineInfos count] > 0)
    {
        NSLog(@"12345") ;
        [self.lineInfos removeLastObject] ;
    }
    [self setNeedsDisplay] ;
    
}

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame] ;
    if (self) {
        _lineInfos = [[NSMutableArray alloc] initWithCapacity:10] ;
        self.lineColor = [UIColor blackColor] ;
        //设置透明背景
        self.backgroundColor = [UIColor clearColor] ;
        self.brushWidth = 10.f ;
    }
    return self ;
}


//根据现有的线条，绘制相应的图画
- (void) drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext() ;
    CGContextSetLineCap(context, kCGLineCapRound) ;
    CGContextSetLineJoin(context, kCGLineJoinRound) ;
    
//    //设置橡皮擦
//    if (_lineColor == [UIColor clearColor]) {
//        CGContextSetBlendMode(context, kCGBlendModeClear) ;
//    }
//    else {
//        CGContextSetBlendMode(context, kCGBlendModeNormal) ;
//    }
    
    
    if (_lineInfos.count > 0 )
    {
        for (int i = 0 ; i < [self.lineInfos count] ; i++)
        {
            Line *info = self.lineInfos[i] ;
            
            CGContextBeginPath(context) ;
            CGPoint startPoint = [[info.linePoints objectAtIndex:0] CGPointValue] ;
            CGContextMoveToPoint(context, startPoint.x, startPoint.y) ;
            
            if (info.linePoints.count > 1)
            {
                for (int j = 0 ; j < [info.linePoints count]-1 ; j++)
                {
                    CGPoint endPoint = [[info.linePoints objectAtIndex:j+1] CGPointValue] ;
                    CGContextAddLineToPoint(context, endPoint.x, endPoint.y) ;
                }
            }else{
                CGContextAddLineToPoint(context, startPoint.x, startPoint.y) ;
            }
            CGContextSetStrokeColorWithColor(context, info.color.CGColor) ;
            CGContextSetLineWidth(context, info.lineWidth+1) ;
            CGContextStrokePath(context) ;
        }
    }
    
    [super drawRect:rect] ;
    
//    NSURL *url = [NSURL URLWithString:@""];
//    NSURLRequest *request = [[NSURLRequest alloc] init] ;
//    request.HTTPMethod = @"GET" ;
//    request.URL = url ;
    
}


//触摸开始
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject] ;
//    _content = [Line new] ;
//    _content.color = _lineColor ;
    [self drawPaletteTouchesBeganWithWidth:self.brushWidth andColor:self.lineColor andBeginPoint:[touch locationInView:self]] ;
    [self setNeedsDisplay] ;
}

//触摸移动
-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSArray *movePointArray = [touches allObjects] ;
    [self drawPaletteTouchesMovedWithPoint:[[movePointArray objectAtIndex:0] locationInView:self]] ;
    [self setNeedsDisplay] ;
}


-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}


//在触摸开始的时候，添加一条新的线条 并初始化
- (void) drawPaletteTouchesBeganWithWidth:(float)width andColor:(UIColor *)color andBeginPoint:(CGPoint)bPoint
{
    Line *info = [Line new] ;
    info.color = color ;
    info.lineWidth = width ;
    
    [info.linePoints addObject:[NSValue valueWithCGPoint:bPoint]] ;
    
    [self.lineInfos addObject:info] ;
}

//在触摸移动的时候，将现有线条的最后一条的point增加相应触摸过的坐标
- (void) drawPaletteTouchesMovedWithPoint:(CGPoint)mPoint
{
    Line *lastInfo = [self.lineInfos lastObject] ;
    [lastInfo.linePoints addObject:[NSValue valueWithCGPoint:mPoint]] ;
}


- (NSMutableArray *) lineInfos
{
    if (_lineInfos == nil)
    {
        _lineInfos = [NSMutableArray array] ;
    }
    return _lineInfos ;
}



@end
