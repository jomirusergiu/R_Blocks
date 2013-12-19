//
//  R_NSArrayBlocks.m
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

#import "R_NSArrayBlocks.h"

@implementation NSArray(R_Block)

// Enumerate each object in the array.
- (void)enumerateEachObjectUsingBlock:(void(^)(id object))block{
    NSParameterAssert(block != nil);
    [self enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop){
        block(object);
    }];
}

// Apply the block to each object in the array and return an array of resulting objects
- (NSArray *)getArrayWithObjectsMappedWithBlock:(id(^)(id obj))block{
    NSParameterAssert(block != nil);
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    [self enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop){
        [array addObject:block(object)];
    }];
    return [NSArray arrayWithArray:array];
}



@end
