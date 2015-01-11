//
//  RGButton.h
//  RGButton
//
//  Created by ROBERA GELETA on 1/10/15.
//  Copyright (c) 2015 ROBERA GELETA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGButton : UIView
- (void)setSize:(CGSize )buttonSize;
- (void)setRadius:(CGFloat )radiusSet;
//--> allows you to set the images of the buttons. the 0th index is left most button
- (void)setImagesForButtons:(NSArray *)imageArray;
- (void)setCenterButtonImage:(UIImage *)image;
@property id delegate;
@end


@protocol RGButtonDelegate <NSObject>
- (void)tappedButtonWithIndex:(NSInteger )index;
@end