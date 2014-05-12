//
//  ViewController.m
//  TB_ProgrammaticallyAutolayout
//
//  Created by Yari D'areglia on 02/05/14.
//  Copyright (c) 2014 Yari D'areglia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *yellowView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupViews];
    
    
    /* Remove comment from the example that you want to launch */
    
    // Example 1: Simple constraints with visual format language
    [self example_1];
    
    // Example 2: Simple constraints with visual format and multiple views
    //[self example_2];
    
    // Example 3: Simple constraints with visual format and options
    //[self example_3];
    
    // Example 4: Simple constraints with visual format using metrics
    //[self example_4];
    
    // Example 5: Dynamic size
    //[self example_5];
    
    // Example 6: Defining constraints through relations
    //[self example_6];
    
}


/* Initial views setup */

- (void)setupViews
{
    self.redView = [UIView new];
    self.redView.translatesAutoresizingMaskIntoConstraints = NO;
    self.redView.backgroundColor = [UIColor colorWithRed:0.95 green:0.47 blue:0.48 alpha:1.0];
    
    self.yellowView = [UIView new];
    self.yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    self.yellowView.backgroundColor = [UIColor colorWithRed:1.00 green:0.83 blue:0.58 alpha:1.0];
    
    [self.view addSubview:self.redView];
    [self.view addSubview:self.yellowView];
    
}

/* 
 Hey Devs... the code in the next functions has to be intended for tutorial purposes only. 
 I have created work-alone examples that contain a lot of code duplication... not a good practice but way easier to explain :P
*/




/* EXAMPLE 1 */

- (void)example_1
{
    
    // 1. Create a dictionary of views
    NSDictionary *viewsDictionary = @{@"redView":self.redView};
    
    // 2. Define the redView Size
    NSArray *constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView(100)]"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:viewsDictionary];
    
    NSArray *constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[redView(100)]"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:viewsDictionary];
    [self.redView addConstraints:constraint_H];
    [self.redView addConstraints:constraint_V];
    
    // 3. Define the redView Position
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[redView]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    // 3.B ...and try to change the visual format string
    //NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView]-30-|" options:0 metrics:nil views:viewsDictionary];
    //NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[redView]" options:0 metrics:nil views:viewsDictionary];
    
    [self.view addConstraints:constraint_POS_H];
    [self.view addConstraints:constraint_POS_V];
}



/* EXAMPLE 2 */

- (void)example_2
{
    
    // 1. Create a dictionary of views
    NSDictionary *viewsDictionary = @{@"redView":self.redView, @"yellowView":self.yellowView};
    
    // 2. Define the views Sizes
    NSArray *red_constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView(100)]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    NSArray *red_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[redView(100)]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    [self.redView addConstraints:red_constraint_H];
    [self.redView addConstraints:red_constraint_V];
    
    NSArray *yellow_constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[yellowView(200)]"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:viewsDictionary];
    
    NSArray *yellow_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[yellowView(100)]"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:viewsDictionary];
    [self.yellowView addConstraints:yellow_constraint_H];
    [self.yellowView addConstraints:yellow_constraint_V];
    
    // 3. Define the views Positions
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[redView]-40-[yellowView]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]-10-[yellowView]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    [self.view addConstraints:constraint_POS_V];
    [self.view addConstraints:constraint_POS_H];
    
}



/* EXAMPLE 3 */

- (void)example_3
{
    
    // 1. Create a dictionary of views
    NSDictionary *viewsDictionary = @{@"redView":self.redView, @"yellowView":self.yellowView};
    
    // 2. Define the views Sizes
    NSArray *red_constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView(100)]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    NSArray *red_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[redView(100)]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    [self.redView addConstraints:red_constraint_H];
    [self.redView addConstraints:red_constraint_V];
    
    NSArray *yellow_constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[yellowView(150)]"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:viewsDictionary];
    
    NSArray *yellow_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[yellowView(100)]"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:viewsDictionary];
    [self.yellowView addConstraints:yellow_constraint_H];
    [self.yellowView addConstraints:yellow_constraint_V];
    
    // 3. Define the views Positions using options
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-120-[redView]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    NSArray *constraint_POS = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]-10-[yellowView]"
                                                                      options:NSLayoutFormatAlignAllTop
                                                                      metrics:nil views:viewsDictionary];
    
    [self.view addConstraints:constraint_POS_V];
    [self.view addConstraints:constraint_POS];
    
}



/* EXAMPLE 4 */

- (void)example_4
{
    // 1. Create a dictionary of views and metrics
    NSDictionary *viewsDictionary = @{@"redView":self.redView, @"yellowView":self.yellowView};
    NSDictionary *metrics = @{@"redWidth": @100,
                              @"redHeight": @100,
                              @"yellowWidth": @100,
                              @"yellowHeight": @150,
                              @"topMargin": @120,
                              @"leftMargin": @20,
                              @"viewSpacing":@10
                              };
    
    // 2. Define the views Sizes
    NSArray *red_constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView(redHeight)]"
                                                                        options:0
                                                                        metrics:metrics
                                                                          views:viewsDictionary];
    
    NSArray *red_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[redView(redWidth)]"
                                                                        options:0
                                                                        metrics:metrics
                                                                          views:viewsDictionary];
    [self.redView addConstraints:red_constraint_H];
    [self.redView addConstraints:red_constraint_V];
    
    NSArray *yellow_constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[yellowView(yellowHeight)]"
                                                                           options:0
                                                                           metrics:metrics
                                                                             views:viewsDictionary];
    
    NSArray *yellow_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[yellowView(yellowWidth)]"
                                                                           options:0
                                                                           metrics:metrics
                                                                             views:viewsDictionary];
    
    [self.yellowView addConstraints:yellow_constraint_H];
    [self.yellowView addConstraints:yellow_constraint_V];
    
    // 3. Define the views Positions
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[redView]"
                                                                        options:0
                                                                        metrics:metrics
                                                                          views:viewsDictionary];
    
    NSArray *constraint_POS = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftMargin-[redView]-viewSpacing-[yellowView]"
                                                                      options:NSLayoutFormatAlignAllTop
                                                                      metrics:metrics
                                                                        views:viewsDictionary];
    
    [self.view addConstraints:constraint_POS_V];
    [self.view addConstraints:constraint_POS];
}



/* EXAMPLE 5 */

- (void)example_5
{
    // 1. Create a dictionary of views and metrics
    NSDictionary *viewsDictionary = @{@"redView":self.redView};
    NSDictionary *metrics = @{@"vSpacing":@30, @"hSpacing":@10};
    
    // 2. Define the view Position and automatically the Size
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpacing-[redView]-vSpacing-|"
                                                                        options:0
                                                                        metrics:metrics
                                                                          views:viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[redView]-hSpacing-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:viewsDictionary];
    
    [self.view addConstraints:constraint_POS_V];
    [self.view addConstraints:constraint_POS_H];
}



/* EXAMPLE 6 */

- (void)example_6
{
    // 1. Create a dictionary of views
    NSDictionary *viewsDictionary = @{@"redView": self.redView, @"yellowView": self.yellowView};
    NSDictionary *metrics = @{@"vSpacing":@30, @"hSpacing":@10};

    
    // 2. Define the view Position and automatically the Size (for the redView)
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpacing-[redView]-vSpacing-|"
                                                                        options:0
                                                                        metrics:metrics
                                                                          views:viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[redView]-hSpacing-|"
                                                                        options:0
                                                                        metrics:metrics
                                                                          views:viewsDictionary];
    
    [self.view addConstraints:constraint_POS_V];
    [self.view addConstraints:constraint_POS_H];
    
    
    
    // 3. Define sizes thanks to relations with another view (yellowView in relation with redView)
    [self.view addConstraint:[NSLayoutConstraint
                                 constraintWithItem:self.yellowView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:self.redView
                                 attribute:NSLayoutAttributeWidth
                                 multiplier:0.5
                                 constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                                 constraintWithItem:self.yellowView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:self.redView
                                 attribute:NSLayoutAttributeHeight
                                 multiplier:0.5
                                 constant:0.0]];
    
    // 4. Define position thanks to relations with another view (yellowView in relation with redView)
    [self.view addConstraint:[NSLayoutConstraint
                                    constraintWithItem:self.yellowView
                                    attribute:NSLayoutAttributeCenterX
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.redView
                                    attribute:NSLayoutAttributeCenterX
                                    multiplier:1.0
                                    constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                                    constraintWithItem:self.yellowView
                                    attribute:NSLayoutAttributeCenterY
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.redView
                                    attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0
                                    constant:0.0]];
    
}

@end
