//
//  ViewController.m
//  RGButton
//
//  Created by ROBERA GELETA on 1/10/15.
//  Copyright (c) 2015 ROBERA GELETA. All rights reserved.
//
#import "RGButton.h"
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet RGButton *customButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *i1 = [UIImage imageNamed:@"dropbox_copyrighted-50"];
    UIImage *i2 = [UIImage imageNamed:@"facebook-50"];
    UIImage *i3 = [UIImage imageNamed:@"foursquare-50"];
    UIImage *i4 = [UIImage imageNamed:@"google_plus-50"];
    UIImage *i5 = [UIImage imageNamed:@"twitter-50"];
    NSArray *listOfImages = @[i1,i2,i3,i4,i5];
    [self.customButton setImagesForButtons:listOfImages];
    [self.customButton setCenterButtonImage:[UIImage imageNamed:@"collapse-50"] backgroundColor:[UIColor greenColor]];
    [self.customButton setRadius:130 ];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
