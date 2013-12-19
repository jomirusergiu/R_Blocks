//
//  ViewController.m
//  R_Blocks
//
//  Created by RocKK on 12/19/13.
//  Copyright (c) 2013 RocKK.
//  All rights reserved.
//
//  Redistribution and use in source and binary forms are permitted
//  provided that the above copyright notice and this paragraph are
//  duplicated in all such forms and that any documentation,
//  advertising materials, and other materials related to such
//  distribution and use acknowledge that the software was developed
//  by the RocKK.  The name of the
//  RocKK may not be used to endorse or promote products derived
//  from this software without specific prior written permission.
//  THIS SOFTWARE IS PROVIDED ''AS IS'' AND WITHOUT ANY EXPRESS OR
//  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self applyNSArrayBlocks];
    [self applyNSDictionaryBlocks];
}

- (void)applyNSArrayBlocks{
    NSLog(@"//==============NSArray Blocks==============//");
    
    // Create Arrays
    NSMutableArray *firstArray = [[NSMutableArray alloc] initWithObjects:@"FirstObject1",@"FirstObject2", nil];
    NSMutableArray *secondArray = [[NSMutableArray alloc] initWithObjects:@"SecondObject1",@"SecondObject2", @"SecondObject3", nil];
    NSArray *thirdArray = [NSArray new];
    
    
    // Enumerate each object in the first array.
    NSLog(@"Enumerating first array");
    [firstArray enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop){
        NSLog(@"Object: %@, Index: %d", object, index);
    }];
    
    
    // Apply the block to each object in the first array and return an array of resulting objects from second array
    NSLog(@"Getting an array with objects mapped with block");
    thirdArray = [firstArray getArrayWithObjectsMappedWithBlock:^id(NSString *object){
        NSLog(@"For Object: %@ Add array%@", object, secondArray);
        return  secondArray;
    }];
    NSLog(@"Third Array: %@", thirdArray);
    NSLog(@"\n");
}

- (void)applyNSDictionaryBlocks{
    NSLog(@"//==============NSDictionary Blocks==============//");
    
    // Create Dictionary
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithObjects:@[@"object1" , @"object2" , @"object3"] forKeys:@[@"key1" , @"key2" , @"key3"]];
    
    // Enumerate each object an key in the dictionary.
    NSLog(@"Enumerating each object an key in the dictionary");
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop){
        NSLog(@"Object: %@, Key: %@", object, key);
    }];
    
    // Enumerate each sorted object and key in the dictionary.
    NSLog(@"Enumerating each sorted object an key in the dictionary");
    [dict enumerateEachSortedKeyAndObjectUsingBlock:^(id key, id object, NSUInteger index){
        NSLog(@"Object: %@, Key: %@ Index %d", object, key, index);
    }];
    NSLog(@"\n");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
