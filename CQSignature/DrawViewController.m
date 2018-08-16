//
//  DrawViewController.m
//  ElectronicContract
//
//  Created by 陈强 on 16/10/18.
//  Copyright © 2016年 陈强. All rights reserved.
//

#import "DrawViewController.h"
#import "YYView.h"
#import "UIImage+YYcaptureView.h"


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface DrawViewController (){
    //涂鸦试图
    YYView * customView;
    //颜色数组
    NSArray * colorArray;
    //涂鸦粗细数组
    NSArray * fontArray;
}
@property(nonatomic,strong)NSString * userIDInfo;
@end

@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    colorArray =[NSArray arrayWithObjects:@"penBlack",@"penBlue",@"penRed", nil];
    fontArray =[NSArray arrayWithObjects:@"penThin",@"penMiddle",@"penThick", nil];
    
    //添加导航
    [self addNavView];
    //添加涂鸦
    customView = [[YYView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_HEIGHT, SCREEN_WIDTH-110)];
    
    customView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:customView];
    //添加底部功能按钮
    [self addBottom];

}
//添加导航
-(void)addNavView{
    UIView * backView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT, 50)];
    NSLog(@"高：%f  宽：%f",SCREEN_WIDTH,SCREEN_HEIGHT);
    backView.backgroundColor = [UIColor colorWithRed:53.f/255.f green:69.f/255.f blue:93.f/255.f alpha:1.0f];
    [self.view addSubview:backView];
    self.titleLabel =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT, 50)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.text = @"请书写清晰可辨的签名";
   self.titleLabel.textColor = [UIColor whiteColor];
    [backView addSubview:self.titleLabel];
    UIButton * backBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(15, 0, 50, 50);
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:backBtn];
    
}
//添加底部功能按钮
-(void)addBottom{
    //
    UIView * bottomView =[[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_WIDTH-60,SCREEN_HEIGHT , 60)];
//    bottomView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bottomView];
    UIView * lineView =[[UIView alloc ] initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT , 1)];
    lineView.backgroundColor =[UIColor colorWithRed:190.f/255.f green:190.f/255.f blue:190.f/255.f alpha:1.0f];
    
    [bottomView addSubview:lineView];
    //创建字体粗细
    for(int i = 0;i<fontArray.count;i++){
        UIButton * fontBtn =[UIButton buttonWithType:UIButtonTypeCustom ];
        if (i==0) {
            [fontBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@Select",[fontArray objectAtIndex:i]]] forState:UIControlStateNormal];
        }
        else{
        [fontBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[fontArray objectAtIndex:i]]] forState:UIControlStateNormal];
        }
        [fontBtn addTarget:self action:@selector(chooseFont:) forControlEvents:UIControlEventTouchUpInside];
        fontBtn.tag = i+1;
        fontBtn.frame = CGRectMake(30+i*40+i*25, 10, 40, 40);
        [bottomView addSubview:fontBtn];
        
    }
    //创建颜色按钮
    for(int j = 0;j<colorArray.count;j++){
        UIButton * colorBtn =[UIButton buttonWithType:UIButtonTypeCustom ];
        if (j==0) {
            [colorBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@Select",[colorArray objectAtIndex:j]]] forState:UIControlStateNormal];
        }
        else{
            [colorBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[colorArray objectAtIndex:j]]] forState:UIControlStateNormal];
        }
        [colorBtn addTarget:self action:@selector(colorFont:) forControlEvents:UIControlEventTouchUpInside];
        colorBtn.tag = j+101;
        colorBtn.frame = CGRectMake(SCREEN_HEIGHT-(40*3+3*25)+j*40+j*25, 10, 40, 40);
        [bottomView addSubview:colorBtn];
    }
    //清除按钮
    UIButton * clearBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    clearBtn.frame = CGRectMake(SCREEN_HEIGHT/2-60-11, 10, 60, 40);
    clearBtn.backgroundColor =[UIColor colorWithRed:55.f/255.f green:127.f/255.f blue:203.f/255.f alpha:1.0f];
    [clearBtn setTitle:@"清除" forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(clear:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:clearBtn];
    
    //提交
    UIButton * submitBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame= CGRectMake(SCREEN_HEIGHT/2+11, 10, 60, 40);
    submitBtn.backgroundColor =[UIColor colorWithRed:55.f/255.f green:127.f/255.f blue:203.f/255.f alpha:1.0f];
    [ submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [ submitBtn addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview: submitBtn];
    
    
    
}
//返回
-(void)back{
//    NSLog(@"高：%f  宽：%f",SCREEN_WIDTH,SCREEN_HEIGHT);
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
//提交
-(void)submit:(UIButton *)btn{
   
      UIImage *newImage =    [UIImage YYcaptureImageWithView:customView];
  
    [self.delegate submitCompleted:newImage];
     [self dismissViewControllerAnimated:YES completion:nil];
    
//    将图片保存到手机的相册中去
//    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}


//清除
-(void)clear:(UIButton *)btn{
  
    [customView clearView];
    
}
//选择颜色事件
-(void)colorFont:(UIButton *)btn{
    NSLog(@"%ld",(long)btn.tag);
    UIButton * btn1 =(UIButton *)[self.view viewWithTag:101];
    UIButton * btn2 =(UIButton *)[self.view viewWithTag:102];
    UIButton * btn3 =(UIButton *)[self.view viewWithTag:103];
       switch ((int)btn.tag) {
        case 101:
            customView.color =[UIColor blackColor];
            [btn1 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@Select",[colorArray objectAtIndex:0]]] forState:UIControlStateNormal];
            [btn2 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[colorArray objectAtIndex:1]]] forState:UIControlStateNormal];
            [btn3 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[colorArray objectAtIndex:2]]] forState:UIControlStateNormal];
            break;
        case 102:
            customView.color =[UIColor blueColor];
            [btn1 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[colorArray objectAtIndex:0]]] forState:UIControlStateNormal];
            [btn2 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@Select",[colorArray objectAtIndex:1]]] forState:UIControlStateNormal];
            [btn3 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[colorArray objectAtIndex:2]]] forState:UIControlStateNormal];
      
            break;
        case 103:
            customView.color =[UIColor redColor];
            [btn1 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[colorArray objectAtIndex:0]]] forState:UIControlStateNormal];
            [btn2 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[colorArray objectAtIndex:1]]] forState:UIControlStateNormal];
            [btn3 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@Select",[colorArray objectAtIndex:2]]] forState:UIControlStateNormal];
      
            break;
        default:
            break;
    }
    
}
//选择字体事件
-(void)chooseFont:(UIButton *)btn{
    NSLog(@"%ld",(long)btn.tag);
    UIButton * btn1 =(UIButton *)[self.view viewWithTag:1];
    UIButton * btn2 =(UIButton *)[self.view viewWithTag:2];
    UIButton * btn3 =(UIButton *)[self.view viewWithTag:3];
    switch ((int)btn.tag) {
        case 1:
            customView.font = @"5";
            [btn1 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@Select",[fontArray objectAtIndex:0]]] forState:UIControlStateNormal];
            [btn2 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[fontArray objectAtIndex:1]]] forState:UIControlStateNormal];
            [btn3 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[fontArray objectAtIndex:2]]] forState:UIControlStateNormal];

            break;
        case 2:
            customView.font = @"10";
            [btn1 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[fontArray objectAtIndex:0]]] forState:UIControlStateNormal];
            [btn2 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@Select",[fontArray objectAtIndex:1]]] forState:UIControlStateNormal];
            [btn3 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[fontArray objectAtIndex:2]]] forState:UIControlStateNormal];

            break;
        case 3:
            customView.font = @"20";
            [btn1 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[fontArray objectAtIndex:0]]] forState:UIControlStateNormal];
            [btn2 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[fontArray objectAtIndex:1]]] forState:UIControlStateNormal];
            [btn3 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@Select",[fontArray objectAtIndex:2]]] forState:UIControlStateNormal];

            break;
        default:
            break;
    }
    
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if(error){
        NSLog(@"保存失败");
    }
    else{
        NSLog(@"保存成功");
    }
    
}


- (BOOL)shouldAutorotate

{
    
    return NO;
    
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations

{
    
    return UIInterfaceOrientationMaskLandscape;
    
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation

{
    
    return UIInterfaceOrientationLandscapeRight;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
 
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
