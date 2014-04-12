//
//  MyScene.m
//  letterByLetter
//
//  Created by Maxim Frisk on 2014-04-12.
//  Copyright (c) 2014 Maxim Frisk. All rights reserved.
//

#import "MyScene.h"
@interface MyScene(){
    


}

@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0 green:0 blue:0 alpha:1.0];
        
        
        //This is how you call the method.
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            [self animateSKLabelNodeText:@"Hello world!! this is animated letter by letter!" delay:0.05];
        });
        
    }
    return self;
}

-(void)animateSKLabelNodeText:(NSString*)textToAnimate delay:(NSTimeInterval)delayTime{
    
    
    //create a label to hold the text
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"helvetica"];
    //set font size
    myLabel.fontSize = 15;
    //set position on screen
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
    //ad the label to screen
    [self addChild:myLabel];
    
    for (int i = 0; i<textToAnimate.length; i++) {
        dispatch_async(dispatch_get_main_queue(),^{
            myLabel.text = [NSString stringWithFormat:@"%@%C",myLabel.text,[textToAnimate characterAtIndex:i]];
        });
        [NSThread sleepForTimeInterval:delayTime];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
