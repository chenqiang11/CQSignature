//
//  UIImage+YYcaptureView.h
//  new
//
//  Created by 陈强 on 16/8/15.
//  Copyright © 2016年 陈强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YYcaptureView)
 /**
      *  该分类提供一个方法，接收一个view的参数，返回一个view的视图
      */
 +(UIImage *)YYcaptureImageWithView:(UIView *)view;
@end
