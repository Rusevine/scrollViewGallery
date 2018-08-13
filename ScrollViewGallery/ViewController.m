//
//  ViewController.m
//  ScrollViewGallery
//
//  Created by Wiljay Flores on 2018-08-13.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active =YES;
    [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active =YES;
    [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active =YES;
    [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active =YES;
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse.jpg"]];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night.jpg"]];
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
    
    imageView1.contentMode = UIViewContentModeScaleAspectFill;
    imageView1.clipsToBounds = YES;
    imageView2.contentMode = UIViewContentModeScaleAspectFill;
    imageView2.clipsToBounds = YES;
    imageView3.contentMode = UIViewContentModeScaleAspectFill;
    imageView3.clipsToBounds = YES;
    
    [self.scrollView addSubview:imageView1];
    [self.scrollView addSubview:imageView2];
    [self.scrollView addSubview:imageView3];
    imageView1.translatesAutoresizingMaskIntoConstraints = NO;
    imageView2.translatesAutoresizingMaskIntoConstraints = NO;
    imageView3.translatesAutoresizingMaskIntoConstraints = NO;
  
    [imageView1.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [imageView1.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [imageView1.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
    [imageView1.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
    [imageView1.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    
    [imageView2.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [imageView2.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [imageView2.leadingAnchor constraintEqualToAnchor:imageView1.trailingAnchor].active = YES;
    [imageView2.trailingAnchor constraintEqualToAnchor:imageView3.leadingAnchor].active = YES;
    [imageView2.heightAnchor constraintEqualToAnchor:imageView1.heightAnchor].active = YES;
    [imageView2.widthAnchor constraintEqualToAnchor:imageView1.widthAnchor].active = YES;
    
    [imageView3.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [imageView3.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [imageView3.leadingAnchor constraintEqualToAnchor:imageView2.trailingAnchor].active = YES;
    [imageView3.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
    [imageView3.heightAnchor constraintEqualToAnchor:imageView2.heightAnchor].active = YES;
    [imageView3.widthAnchor constraintEqualToAnchor:imageView2.widthAnchor].active = YES;
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
