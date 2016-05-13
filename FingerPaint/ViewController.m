//
//  ViewController.m
//  FingerPaint
//
//  Created by Taylor Benna on 2016-05-13.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "ViewController.h"
#import "PaintView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PaintView *painterView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGest;
@property (nonatomic) UIBezierPath *path;
@property (nonatomic) NSArray *colours;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colourSelector;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.painterView.pathList = [[NSMutableArray alloc] init];
    self.painterView.colourList = [[NSMutableArray alloc] init];
    self.colours = @[
                     [UIColor redColor],
                     [UIColor orangeColor],
                     [UIColor yellowColor],
                     [UIColor greenColor],
                     [UIColor blueColor],
                     [UIColor purpleColor]
                     ];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)touchedPainter:(UIPanGestureRecognizer *)sender {
    
    CGPoint currentPoint = [self.panGest locationInView:self.view];
    
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.path = [UIBezierPath new];
        [self.painterView.colourList addObject:self.colours[self.colourSelector.selectedSegmentIndex]];
        [self.path moveToPoint:currentPoint];
        [self.painterView.pathList addObject:self.path];
    } else {
        [self.path addLineToPoint:currentPoint];
    }
    [self.painterView setNeedsDisplay];
}

- (IBAction)colourChanged:(UISegmentedControl *)sender {
    sender.tintColor = self.colours[sender.selectedSegmentIndex];
}

@end
