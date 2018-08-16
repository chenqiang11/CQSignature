//
//  YYView.m
//  new
//
//  Created by 陈强 on 16/8/15.
//  Copyright © 2016年 陈强. All rights reserved.
//

#import "YYView.h"
 @interface YYView ()
 /**
   *  用来存储所有的路径信息
   */
 @property(nonatomic,strong)NSMutableArray *paths;
 @property(nonatomic)CGPoint start;
@property(nonatomic)CGPoint end;

@property(nonatomic) UIBezierPath *current;
//存储当前点内容信息

 @end
@implementation YYView
-(UIView *) initWithFrame:(CGRect)rect{
      self = [super initWithFrame:rect];

    if (self) {
   
        _color =[UIColor blackColor];
        _font = @"5";
       
        
       
           }
    return self;
}
- (void)eraseLine
{
    UIGraphicsBeginImageContext(self.bounds.size);
    //  [self.viewImage drawInRect:self.bounds];
    
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeClear);
    
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 10);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeClear);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _start.x, _start.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), _end.x, _end.y);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    // self.viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //  previousPoint = currentPoint;
    
    [self setNeedsDisplay];
}


//开始手指触摸事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
 //1 获取手指对应的uitoch对象
    UITouch * touch = [touches anyObject];
    //2通过UIToch对象获取手指触摸的位置
    
    CGPoint starPoint=[touch locationInView:touch.view];
    _start = starPoint;
    //3.当用户手指按下的时候创建一条路径
        UIBezierPath *path=[UIBezierPath bezierPath];
    
    //设置路径的相关属性
    
   // UIColor * color =[UIColor redColor];
  // [color set];
       //  [path setLineWidth:5];
        [path setLineJoinStyle:kCGLineJoinRound];
         [path setLineCapStyle:kCGLineCapRound];
    
  //  [path stroke];
    
   
    
    //4.设置当前路径的起点
         [path moveToPoint:starPoint];
    //5.将路径添加到数组中去
    NSMutableDictionary * dicPointInformation = [[NSMutableDictionary alloc] init];
    [dicPointInformation setObject:path forKey:@"path"];
    [dicPointInformation setObject:_color forKey:@"color"];
    [dicPointInformation setObject:_font forKey:@"font"];
         [self.paths addObject:dicPointInformation];
    
}

//手指移动事件
 -(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
 {
         //1.获取手指对应的UIToch对象
         UITouch *touch=[touches anyObject];
         //2.通过UIToch对象获取手指触摸的位置
         CGPoint movePoint=[touch locationInView:touch.view];
     _end = movePoint;
         //3.取出当前的path
        // UIBezierPath *currentPath=[self.paths lastObject];
     NSMutableDictionary * dic =[self.paths lastObject];
     UIBezierPath * currentPath = [dic objectForKey:@"path"];
     
    
         //4.设置当前路径的终点
         [currentPath addLineToPoint:movePoint];
     _current = currentPath;
     
    
         //5.调用drawRect方法重绘视图
        [self setNeedsDisplay];
     }

 ////抬起手指
 -(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
 {
     //[self touchesMoved:touches withEvent:event];
 }
//划线
- (void)drawRect:(CGRect)rect
 {
     for (NSDictionary * dic  in self.paths) {
         UIBezierPath *path = [dic objectForKey:@"path"];
         UIColor * color =[dic objectForKey:@"color"];
         [color setStroke];
         [path setLineWidth:[[dic objectForKey:@"font"] intValue]];
         [path stroke];
     }
    
     
     }

-(NSMutableArray *)paths
 {
        if (_paths==nil) {
        _paths=[NSMutableArray array];
             }
         return _paths;
     }
//清除试图
-(void)clearView
 {
         //清空所有的路径
        [self.paths removeAllObjects];
         //调用方法重新绘图
         [self setNeedsDisplay];
     }
//返回上一层
 -(void)backView
 {
         //移除路径数组中的最后一个元素（最后一条路径）
         [self.paths removeLastObject];
         //重新绘图
          [self setNeedsDisplay];
     }
@end
