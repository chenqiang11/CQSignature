//
//  DrawViewController.h
//  ElectronicContract
//
//  Created by 陈强 on 16/10/18.
//  Copyright © 2016年 陈强. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SignatureDelegate <NSObject>
- (void)submitCompleted:(UIImage *)image; //声明协议方法
@end
@interface DrawViewController : UIViewController
@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, weak)id<SignatureDelegate> delegate; //声明协议变量
@end
