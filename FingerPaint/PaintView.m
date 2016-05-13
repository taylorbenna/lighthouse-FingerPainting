//
//  PaintView.m
//  FingerPaint
//
//  Created by Taylor Benna on 2016-05-13.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "PaintView.h"

@implementation PaintView


- (void)drawRect:(CGRect)rect {
    
    for (int i = 0; i < [self.pathList count]; i++) {
        [self.colourList[i] setStroke];
        [self.pathList[i] stroke];
    }
}


@end
