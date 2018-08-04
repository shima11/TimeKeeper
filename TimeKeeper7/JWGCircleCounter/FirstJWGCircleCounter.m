//
//  JWGCircleCounter.m
//  Version 0.1.1
//
//  https://github.com/johngraham262/JWGCircleCounter
//

#import "FirstJWGCircleCounter.h"

#define JWG_SECONDS_ADJUSTMENT 1000
#define JWG_TIMER_INTERVAL .01 // 1/100 FPS

@interface FirstJWGCircleCounter() {
    
    float numAdjustedSecondsCompleted;
    float numAdjustedSecondsCompletedIncrementor;
    float numAdjustedSecondsTotal;
    float numSeconds;
    
}
@end

@implementation FirstJWGCircleCounter

#pragma mark - Public methods

- (void)baseInit {
    self.backgroundColor = [UIColor clearColor];
    
    self.circleColor = JWG_CIRCLE_COLOR_DEFAULT;
    self.circleBackgroundColor = JWG_CIRCLE_BACKGROUND_COLOR_DEFAULT;
    self.circleTimerWidth = JWG_CIRCLE_TIMER_WIDTH;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self baseInit];
    }
    
    return self;
}

//- (void)firstStartWithSeconds:(NSInteger)seconds {
- (void)firstStartWithSeconds:(NSInteger)seconds {
    
    if (self.didStart && !self.didFinish) {
        return;
    }
    
    float second = 0.2;
    numSeconds = second;
    numAdjustedSecondsCompleted = 0;
    numAdjustedSecondsCompletedIncrementor = second;
    numAdjustedSecondsTotal = second * JWG_SECONDS_ADJUSTMENT;
    
    _didStart = YES;
    _didFinish = NO;
    [self resume];
}


- (void)resume {
    if (!self.didStart || self.isRunning) {
        return;
    }
    
    _isRunning = YES;
    [self update];
}

- (void)stop {
    _isRunning = NO;
}

- (void)reset {
    [self stop];
    numAdjustedSecondsCompleted = 0;
    _didFinish = NO;
    _didStart = NO;
    [self setNeedsDisplay];
}

#pragma mark - Private methods

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //float radius = CGRectGetWidth(rect)/2.0f - self.circleTimerWidth/2.0f;
    float radius = CGRectGetHeight(rect)/2.0f - self.circleTimerWidth*2.5f;
    
    // Draw the background of the circle.
    CGContextSetLineWidth(context, self.circleTimerWidth);
    CGContextBeginPath(context);
    CGContextAddArc(context,
                    CGRectGetMidX(rect), CGRectGetMidY(rect),
                    radius,
                    0,
                    2*M_PI,
                    0);
    CGContextSetStrokeColorWithColor(context, [self.circleBackgroundColor CGColor]);
    CGContextStrokePath(context);
    
    // Draw the remaining amount of timer circle.
    CGContextSetLineWidth(context, self.circleTimerWidth);
    CGContextBeginPath(context);
    CGFloat startAngle1 = M_PI + M_PI/2;
    CGFloat endAngle1 = (M_PI*3/2-((CGFloat)numAdjustedSecondsCompleted + 1.0f) /
                         ((CGFloat)numAdjustedSecondsTotal)*M_PI*2 );
    
    CGContextAddArc(context,
                    CGRectGetMidX(rect), CGRectGetMidY(rect),
                    radius,
                    startAngle1,
                    endAngle1,
                    YES);
    CGContextSetStrokeColorWithColor(context, [self.circleColor CGColor]);
    CGContextStrokePath(context);
    
}

- (void)update {
    if (self.isRunning) {
        numAdjustedSecondsCompleted += numAdjustedSecondsTotal / (numSeconds / JWG_TIMER_INTERVAL);
        if (numAdjustedSecondsCompleted >= numAdjustedSecondsTotal) {
            // finished
            numAdjustedSecondsCompleted = numAdjustedSecondsTotal - 1;
            [self stop];
            _didFinish = YES;
            
            // alert delegate method that it finished
            if ([self.delegate respondsToSelector:@selector(circleCounterTimeDidExpire:)]) {
                [self.delegate circleCounterTimeDidExpire:self];
            }
        } else {
            // in progress
            [NSTimer scheduledTimerWithTimeInterval:JWG_TIMER_INTERVAL
                                             target:self
                                           selector:@selector(update)
                                           userInfo:nil
                                            repeats:NO];
        }
        [self setNeedsDisplay];
    }
}

@end
