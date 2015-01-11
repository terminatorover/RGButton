//
//  RGButton.m
//  RGButton
//
//  Created by ROBERA GELETA on 1/10/15.
//  Copyright (c) 2015 ROBERA GELETA. All rights reserved.
//

#import "RGButton.h"

@implementation RGButton
{
    UIButton *b1;
    UIButton *b2;
    UIButton *b3;
    UIButton *b4;
    UIButton *b5;
    UIWindow *mainWindow;
    UITapGestureRecognizer *tapRecognizer ;
    UIView *darkerView;
    
    //setup for final locations of the buttons
    CGFloat radius;
    CGPoint position1;
    CGPoint position2;
    CGPoint position3;
    CGPoint position4;
    CGPoint position5;
    
    CGPoint centerPoint;
    
    BOOL tapped;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self setUpViewHierrachy];
        });

         [self setUpGestureRecognition];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self  = [super initWithFrame:frame];
    if(self)
    {
        [self setUpViewHierrachy];
        [self setUpGestureRecognition];
    }
    return self;
}

- (void)setUpViewHierrachy
{
    tapped = NO;
    CGSize buttonSize = self.bounds.size;
    //--> get the window
    mainWindow = (UIWindow *)[UIApplication sharedApplication].windows [0];
    //Point in the window

    centerPoint = [mainWindow convertPoint:self.center fromView:self.superview];
    centerPoint = CGPointMake(centerPoint.x - (self.bounds.size.width/4) , centerPoint.y - (self.bounds.size.width/2));
    NSLog(@"Center Point: %@",NSStringFromCGPoint(centerPoint));
    
    b1 = [[UIButton alloc]initWithFrame:CGRectMake(centerPoint.x, centerPoint.y, 0, 0)];
    b2 = [[UIButton alloc]initWithFrame:CGRectMake(centerPoint.x, centerPoint.y, 0, 0)];
    b3 = [[UIButton alloc]initWithFrame:CGRectMake(centerPoint.x, centerPoint.y, 0, 0)];
    b4 = [[UIButton alloc]initWithFrame:CGRectMake(centerPoint.x, centerPoint.y, 0, 0)];
    b5 = [[UIButton alloc]initWithFrame:CGRectMake(centerPoint.x, centerPoint.y, 0, 0)];
    

    
    b1.backgroundColor = [UIColor greenColor];
    b2.backgroundColor = [UIColor grayColor];
    b3.backgroundColor = [UIColor redColor];
    b4.backgroundColor = [UIColor blackColor];
    b5.backgroundColor = [UIColor blueColor];
    

    [self visibility:NO];
    [self makeTheViewsCircular];
    darkerView = [[UIView alloc]initWithFrame:mainWindow.bounds];
    darkerView.backgroundColor = [UIColor redColor];
    darkerView.alpha = .4;
    darkerView.userInteractionEnabled = NO;
    radius = 120;

    
    position1 = CGPointMake(centerPoint.x + radius * cos(M_PI/6), centerPoint.y - radius* sin(M_PI/6));
    position2 = CGPointMake(centerPoint.x + radius * cos(M_PI/3),centerPoint.y - radius* sin(M_PI/3));
    position3 = CGPointMake(centerPoint.x + radius * cos(M_PI/2), centerPoint.y - radius* sin(M_PI/2));
    position4 = CGPointMake(centerPoint.x + radius * cos(2 * M_PI/3),centerPoint.y - radius* sin(2 * M_PI/3));
    position5 = CGPointMake(centerPoint.x + radius * cos(5 * M_PI/6),centerPoint.y - radius* sin(5 * M_PI/6));
}

- (void)setUpGestureRecognition
{
    tapRecognizer  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:tapRecognizer];
}

#pragma mark - Circle
- (void)makeLayerCircular:(CALayer *)layer
{
    layer.cornerRadius = layer.bounds.size.width /2 ;
    
}

- (void)makeTheViewsCircular
{
      [self makeLayerCircular:b1.layer];
      [self makeLayerCircular:b2.layer];
      [self makeLayerCircular:b3.layer];
      [self makeLayerCircular:b4.layer];
      [self makeLayerCircular:b5.layer];
}


#pragma mark - Tap Gesture 
- (void)tapped:(UITapGestureRecognizer *)sender
{
//    [UIView animateWithDuration:2.0 animations:^{
//        [self moveView:!tapped];
//        tapped = !tapped;
//    }];
    
    [UIView animateWithDuration:2.0 animations:^{
        [self moveView:!tapped];
        tapped = !tapped;
    } completion:^(BOOL finished) {
        if(tapped)
        {
//            [b1 removeFromSuperview];
//            [b2 removeFromSuperview];
//            [b3 removeFromSuperview];
//            [b4 removeFromSuperview];
//            [b5 removeFromSuperview];

        }
    }];
}


#pragma  mark - Positions
- (void)moveView:(BOOL)move
{
    if(move)//move the views out
    {
        [mainWindow addSubview:darkerView];
        [mainWindow addSubview:b1];
        [mainWindow addSubview:b2];
        [mainWindow addSubview:b3];
        [mainWindow addSubview:b4];
        [mainWindow addSubview:b5];
        [self visibility:YES];
        
        b1.frame = CGRectMake(position1.x, position1.y, self.bounds.size.width/2, self.bounds.size.height/2);
        b2.frame = CGRectMake(position2.x, position2.y, self.bounds.size.width/2, self.bounds.size.height/2);
        b3.frame = CGRectMake(position3.x, position3.y, self.bounds.size.width/2, self.bounds.size.height/2);
        b4.frame = CGRectMake(position4.x, position4.y, self.bounds.size.width/2, self.bounds.size.height/2);
        b5.frame = CGRectMake(position5.x, position5.y, self.bounds.size.width/2, self.bounds.size.height/2);
        
   
    }
    else//move the views to the center
    {
        [UIView animateWithDuration:.5 animations:^{
            b1.frame = CGRectMake(centerPoint.x, centerPoint.y,40, 40);
            b2.frame = CGRectMake(centerPoint.x, centerPoint.y, 40, 40);
            b3.frame = CGRectMake(centerPoint.x, centerPoint.y, 40, 40);
            b4.frame = CGRectMake(centerPoint.x, centerPoint.y, 40, 40);
            b5.frame = CGRectMake(centerPoint.x, centerPoint.y, 40, 40);
            darkerView.alpha = 0.0;
            [self visibility:NO];
        } completion:^(BOOL finished) {
            [self visibility:YES];
            [darkerView removeFromSuperview];
            [b1 removeFromSuperview];
            [b2 removeFromSuperview];
            [b3 removeFromSuperview];
            [b4 removeFromSuperview];
            [b5 removeFromSuperview];
            darkerView.alpha = 0.5;

        }];
        
        
     
        NSLog(@"Center Point1: %@",NSStringFromCGPoint(centerPoint));
    }
}



#pragma mark - Inivisible 
- (void)visibility:(BOOL)visible
{
    if(!visible)
    {
        b1.alpha = 0.0;
        b2.alpha = 0.0;
        b3.alpha = 0.0;
        b4.alpha = 0.0;
        b4.alpha = 0.0;
        b5.alpha = 0.0;
    }
    else
    {
        b1.alpha = 1.0;
        b2.alpha = 1.0;
        b3.alpha = 1.0;
        b4.alpha = 1.0;
        b4.alpha = 1.0;
        b5.alpha = 1.0;

    }
}







@end
