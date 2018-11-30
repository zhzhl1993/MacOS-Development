//
//  ViewController1.m
//  ChangeWindowAnimation
//
//  Created by zhuzhanlong on 11/30/18.
//  Copyright © 2018 Digiarty. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (instancetype)init {
    return [self initWithDelegate:nil];
}

- (instancetype)initWithDelegate:(id)delegate {
    if (self = [super initWithNibName:@"ViewController1" bundle:nil]){
        _delegate = delegate;
        self.view.wantsLayer = YES;
        [self.view.layer setBackgroundColor:[[NSColor cyanColor] CGColor]];
    }
    return self;
}



- (IBAction)backAction:(id)sender {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(viewController1WillClose:)]) {
        [self.delegate viewController1WillClose:self];
    }
}

@end
