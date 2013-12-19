//
//  R_NSDictionaryBlocks.m
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

#import "R_NSDictionaryBlocks.h"

@implementation NSDictionary(R_Block)

// Enumerate each object an key in the dictionary.
- (void)enumerateEachKeyAndObjectUsingBlock:(void(^)(id key, id object))block{
    NSParameterAssert(block != nil);
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop){
        block(key, object);
    }];
}

// Enumerate each sorted object and key in the dictionary.
- (void)enumerateEachSortedKeyAndObjectUsingBlock:(void(^)(id key, id object, NSUInteger index))block{
    NSParameterAssert(block != nil);
    NSArray *keys = [[self allKeys] sortedArrayUsingSelector:@selector(compare:)];
    [keys enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        block(object, [self objectForKey:object], index);
    }];
}

@end