//
//  YYView.h
//  new
//
//  Created by 陈强 on 16/8/15.
//  Copyright © 2016年 陈强. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, DrawingMode) {
    DrawingModeNone = 0,
    DrawingModePaint,
    DrawingModeErase,
};
@interface YYView : UIView
@property (nonatomic, readwrite) DrawingMode drawingMode;
//清除
-(void)clearView;
//返回上一层
-(void)backView;
//设置涂鸦颜色
@property(nonatomic,strong) UIColor * color;
//设置字体大小
@property(nonatomic,assign) NSString * font;
@end
