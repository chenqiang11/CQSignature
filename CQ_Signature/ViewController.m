//
//  ViewController.m
//  CQ_Signature
//
//  Created by abc123 on 2018/8/16.
//  Copyright © 2018年 abc123. All rights reserved.
//

#import "ViewController.h"
#import "DrawViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//进入签名面板
- (IBAction)signature:(id)sender {
    
    DrawViewController * draw =[[DrawViewController alloc] init];
    draw.delegate = (id<SignatureDelegate>)self;
    [self presentViewController:draw animated:YES completion:nil];
}
- (void)submitCompleted:(UIImage *)image{
    self.signatureImageView.image = image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
