//
//  ViewController.m
//  ceshi627
//
//  Created by 崭新科技 on 16/6/28.
//  Copyright © 2016年 崭新科技. All rights reserved.
//

#import "ViewController.h"
#import "AnimtiomViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
//  CAKeyFrameAnimation动画
//    [self CAKeyFrameAnimation];
//  CABasicAnimation动画
//    [self CABasicAnimation];
    
//  CATransition动画
//    [self CAtransition];
//  CAAnimationGroup动画
//    [self CAAnimationGroup];
//  CASpringAnimation动画
//    [self springAni];
}
- (IBAction)CAKeyFrameAnimation:(id)sender {
    AnimtiomViewController *anima=[[AnimtiomViewController alloc]init];
    anima.Type=@"CAKeyFrameAnimation";
    [self.navigationController pushViewController:anima animated:YES];
}
- (IBAction)CABasicAnimation:(id)sender {
    AnimtiomViewController *anima=[[AnimtiomViewController alloc]init];
    anima.Type=@"CABasicAnimation";
    [self.navigationController pushViewController:anima animated:YES];
}
- (IBAction)CATransition:(id)sender {
    AnimtiomViewController *anima=[[AnimtiomViewController alloc]init];
    anima.Type=@"CATransition";
    [self.navigationController pushViewController:anima animated:YES];
}
- (IBAction)CAAnimationGroup:(id)sender {
    AnimtiomViewController *anima=[[AnimtiomViewController alloc]init];
    anima.Type=@"CAAnimationGroup";
    [self.navigationController pushViewController:anima animated:YES];
}
- (IBAction)CASpringAnimation:(id)sender {
    AnimtiomViewController *anima=[[AnimtiomViewController alloc]init];
    anima.Type=@"CASpringAnimation";
    [self.navigationController pushViewController:anima animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
