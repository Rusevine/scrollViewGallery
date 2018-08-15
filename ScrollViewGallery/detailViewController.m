//
//  SecondViewController.m
//  ScrollViewGallery
//
//  Created by Wiljay Flores on 2018-08-13.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "detailViewController.h"

@interface detailViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UIImageView *imageView;


@end

@implementation detailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    [self.scrollView addSubview:self.imageView];
    
   
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.imageView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.imageView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.imageView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
    [self.imageView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
    [self.imageView.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor].active = YES;
    [self.imageView.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;
    
    self.scrollView.minimumZoomScale = 1.0;
    self.scrollView.maximumZoomScale = 30.0;
    [self.scrollView setZoomScale:1.0];
}



-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}


@end
