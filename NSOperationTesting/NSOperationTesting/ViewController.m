//
//  ViewController.m
//  NSOperationTesting
//
//  Created by chance_old on 3/27/19.
//  Copyright © 2019 chance. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self sampleCodeTwo];
}
/*
 Seems like you need an NSOperationQueue then you can add NSBlockOperationWithBlock for each task. You can also specify that a given block is dependent on another block. You don't have to call start. It just happens.  So, again, construct your NSOperationBlocks with the tasks you wish to run. Then, add then to an NSOperationQueue. If you want specify dependendencies.

 NSOperationQueue *operationQueue = [NSOperationQueue new];
 NSBlockOperation *blockCompletionOperation = [NSBlockOperation blockOperationWithBlock:^{
 */

-(void)sampleCodeTwo
{
    NSOperationQueue *operationQueue = [NSOperationQueue new];
    NSBlockOperation *blockCompletionOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"The block operation ended, Do something such as show a successmessage etc");
        //This the completion block operation
    }];
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        //This is the worker block operation
        [self methodOne];
    }];
    [blockCompletionOperation addDependency:blockOperation];
    [operationQueue addOperation:blockCompletionOperation];
    [operationQueue addOperation:blockOperation];
    
    
}

-(void)methodOne
{
    NSLog(@"is testMethodOne running on main thread? ANS - %@",[NSThread isMainThread]? @"YES":@"NO");
    for (int i = 0; i<5; i++)
    {
        NSLog(@"sleeps for 1 sec and i is %d",i);
        sleep(1);
    }
}



@end
