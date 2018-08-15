//
//  ViewController.m
//  ScrollViewGallery
//
//  Created by Wiljay Flores on 2018-08-13.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "ViewController.h"
#import "detailViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UIPageControl *pageControl;
@property (nonatomic) NSMutableArray <UIImage*> *imageViews;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *sv = [[UIScrollView alloc] init];
    sv.delegate = self;
    [self.view addSubview:sv];
    self.scrollView = sv;
    self.scrollView.pagingEnabled = YES;
    
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active =YES;
    [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active =YES;
    [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active =YES;
    [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active =YES;
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse.jpg"]];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night.jpg"]];
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
    
    _imageViews = [@[[UIImage imageNamed:@"Lighthouse.jpg"],[UIImage imageNamed:@"Lighthouse-night.jpg"],[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]] mutableCopy];
    
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
    
    UIPageControl *pageView = [[UIPageControl alloc] initWithFrame:CGRectZero];
    pageView.currentPage =0;
    pageView.numberOfPages = 3;
    [self.view addSubview:pageView];
    pageView.layer.zPosition = 100;
    pageView.currentPageIndicatorTintColor = [UIColor redColor];
    pageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.pageControl = pageView;
    
    [NSLayoutConstraint constraintWithItem:pageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50].active = YES;
    [NSLayoutConstraint constraintWithItem:pageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50].active = YES;
    [NSLayoutConstraint constraintWithItem:pageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:pageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0].active = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(screenTapped)];
    [self.scrollView addGestureRecognizer:tapGesture];
    
}

-(void)screenTapped{
    int index = self.scrollView.contentOffset.x / self.scrollView.frame.size.width ;
    UIImage *imageView = self.imageViews[index];
    [self performSegueWithIdentifier:@"detailView" sender:imageView];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIImage*)image{
    if([segue.identifier isEqualToString:@"detailView"]){
        detailViewController *vc = [segue destinationViewController];
        UIImage *sendImage = image;
        vc.image = sendImage;
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int index = self.scrollView.contentOffset.x / self.scrollView.frame.size.width ;
    self.pageControl.currentPage = index;
}



@end
