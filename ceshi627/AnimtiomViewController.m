//
//  AnimtiomViewController.m
//  ceshi627
//
//  Created by 崭新科技 on 17/3/28.
//  Copyright © 2017年 崭新科技. All rights reserved.
//

#import "AnimtiomViewController.h"

@interface AnimtiomViewController ()
@property (nonatomic,strong) UIImageView *imageViewimg;

@end

@implementation AnimtiomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    _imageViewimg=[[UIImageView alloc]initWithFrame:CGRectMake(100, 50, 150, 100)];
    _imageViewimg.image=[UIImage imageNamed:@"love"];
    [self.view addSubview:_imageViewimg];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([_Type isEqualToString:@"CAKeyFrameAnimation"]) {
            //    CAKeyFrameAnimation动画
            [self CAKeyFrameAnimation];
        }else if ([_Type isEqualToString:@"CABasicAnimation"]){
            //    CABasicAnimation动画
            [self CABasicAnimation];
        }else if ([_Type isEqualToString:@"CATransition"]){
            //    CATransition动画
            [self CAtransition];
        }else if ([_Type isEqualToString:@"CAAnimationGroup"]){
            //    CAAnimationGroup动画
            [self CAAnimationGroup];
        }else{
            //    CASpringAnimation动画
            [self springAni];
            
        };

    });
    

    

}

- (void)CAKeyFrameAnimation{
    //图片正方形移动
    //    CAKeyframeAnimation * ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //    ani.duration = 4.0;
    //    ani.removedOnCompletion = NO;
    //    ani.fillMode = kCAFillModeForwards;
    //    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //    NSValue * value1 = [NSValue valueWithCGPoint:CGPointMake(150, 200)];
    //    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(250, 200)];
    //    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(250, 300)];
    //    NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(150, 300)];
    //    NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(150, 200)];
    //    ani.values = @[value1, value2, value3, value4, value5];
    //    [self.ImageViewimg.layer addAnimation:ani forKey:@"PostionKeyframeValueAni"];
    //图片按照path指定路线移动
    CAKeyframeAnimation * ani2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(130, 200, 100, 100));
    ani2.path = path;
    CGPathRelease(path);
    ani2.duration = 4.0;
    ani2.removedOnCompletion = NO;
    ani2.fillMode = kCAFillModeForwards;
    [self.imageViewimg.layer addAnimation:ani2 forKey:@"PostionKeyframePathAni"];
}


- (void)CABasicAnimation{
    
    //创建一个动画
    CABasicAnimation *caAnimation=[CABasicAnimation animationWithKeyPath:@"position"];
    //    caAnimation.keyPath=
    caAnimation.toValue=[NSValue valueWithCGPoint:self.view.center];
    caAnimation.removedOnCompletion=NO;
    caAnimation.duration=3.0;
    caAnimation.fillMode=kCAFillModeForwards;
    caAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.imageViewimg.layer addAnimation:caAnimation forKey:@"CABasicAnimation"];
}

- (void)CAtransition{
    //    type的enum值如下：
    //    kCATransitionFade 渐变
    //    kCATransitionMoveIn 覆盖
    //    kCATransitionPush 推出
    //    kCATransitionReveal 揭开
    
    //    subtype的enum值如下：
    //    kCATransitionFromRight 从右边
    //    kCATransitionFromLeft 从左边
    //    kCATransitionFromTop 从顶部
    //    kCATransitionFromBottom 从底部
    CATransition *tan=[CATransition animation];
    tan.type=kCATransitionFade;
    tan.subtype=kCATransitionFromLeft;
    tan.duration=2.0;
    self.imageViewimg.image=[UIImage imageNamed:@"go"];
    [self.imageViewimg.layer addAnimation:tan forKey:@"transitionAni"];
}

- (void)CAAnimationGroup{
    //动画1
    CAKeyframeAnimation *widthAnim=[CAKeyframeAnimation animationWithKeyPath:@"borderWidth"];
    NSArray *widthValues=[NSArray arrayWithObjects:@1.0,@10.0,@5.0,@30.0,@0.5,@15.0,@2.0,@50.0,@0.0, nil];
    widthAnim.values=widthValues;
    widthAnim.calculationMode=kCAAnimationPaced;
    
    //动画2
    CAKeyframeAnimation *colorAnim=[CAKeyframeAnimation animationWithKeyPath:@"borderColor"];
    NSArray *colorArray=[NSArray arrayWithObjects:(id)[UIColor greenColor] .CGColor, (id)[UIColor redColor] .CGColor,(id)[UIColor blueColor] .CGColor,nil];
    colorAnim.values=colorArray;
    colorAnim.calculationMode=kCAAnimationPaced;
    //动画组
    CAAnimationGroup *group=[CAAnimationGroup animation];
    group.animations=[NSArray arrayWithObjects:colorAnim,widthAnim, nil];
    group.duration=5.0;
    [self.view.layer addAnimation:group forKey:@"BorderChanges"];
}

- (void)springAni {
    CASpringAnimation * ani = [CASpringAnimation animationWithKeyPath:@"bounds"];
    ani.mass = 10.0; //质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
    ani.stiffness = 5000; //刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
    ani.damping = 100.0;//阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
    ani.initialVelocity = 5.f;//初始速率，动画视图的初始速度大小;速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
    ani.duration =2.0;
    ani.toValue = [NSValue valueWithCGRect:CGRectMake(50, 200, 300, 200)];
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.imageViewimg.layer addAnimation:ani forKey:@"boundsAni"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
