//
//  ViewController.m
//  TouchMoveEx01
//
//  Created by yg on 14. 1. 9..
//  Copyright (c) 2014년 yg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    BOOL holding;
}
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    if(CGRectContainsPoint(self.image.frame, point)) {
        holding = YES;
        self.image.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"moved cound:%d",[[event allTouches] count]);
    
    if(holding) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        self.image.center = point;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if(holding) {
        self.image.transform = CGAffineTransformIdentity;
        holding = NO;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
