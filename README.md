R_Blocks
=================

R_Blocks is a Project which tens to illustrate usage of blocks and their advantages.

At the moment project contains blocks on:
- NSArray
- NSDictionary

At it's curent state it's not finished yet, there's a lot more to come like, blocks for sorting arrays by different algorythms, NSOperationQueue, GCD and a lot of other objects from Foundation, UIKit, AppKit, StoreKit and more.
Thank you for your patience.

Usage ViewController.h
-------------
```Objective-C
    #import "R_NSArrayBlocks.h"
    #import "R_NSDictionaryBlocks.h"
```

Usage ViewController.m
-------------
```Objective-C
    - (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self applyNSArrayBlocks];
    [self applyNSDictionaryBlocks];
}

- (void)applyNSArrayBlocks{
    // Create Arrays
    NSMutableArray *firstArray = [[NSMutableArray alloc] initWithObjects:@"FirstObject1",@"FirstObject2", nil];
    NSMutableArray *secondArray = [[NSMutableArray alloc] initWithObjects:@"SecondObject1",@"SecondObject2", @"SecondObject3", nil];
    NSArray *thirdArray = [NSArray new];
    
    
    // Enumerate each object in the first array.
    [firstArray enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop){
        NSLog(@"Object: %@, Index: %d", object, index);
    }];
    
    
    // Apply the block to each object in the first array and return an array of resulting objects from second array
    thirdArray = [firstArray getArrayWithObjectsMappedWithBlock:^id(NSString *object){
        NSLog(@"For Object: %@ Add array%@", object, secondArray);
        return  secondArray;
    }];
    NSLog(@"Third Array: %@", thirdArray);
}

- (void)applyNSDictionaryBlocks{
    
    // Create Dictionary
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithObjects:@[@"object1" , @"object2" , @"object3"] forKeys:@[@"key1" , @"key2" , @"key3"]];
    
    // Enumerate each object an key in the dictionary.
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop){
        NSLog(@"Object: %@, Key: %@", object, key);
    }];
    
    // Enumerate each sorted object and key in the dictionary.
    [dict enumerateEachSortedKeyAndObjectUsingBlock:^(id key, id object, NSUInteger index){
        NSLog(@"Object: %@, Key: %@ Index %d", object, key, index);
    }];
}
```

Description
-------------
Blocks are a nonstandard extension added by Apple Inc. to the, C++, and Objective-C programming languages that uses a lambda expression-like syntax to create closures within these languages. Blocks are supported for programs developed for Mac OS X 10.6+ and iOS 4.0+. Apple designed blocks with the explicit goal of making it easier to write programs for the Grand Central Dispatch threading architecture, although it is independent of that architecture and can be used in much the same way as closures in other languages. Apple has implemented blocks both in their own branch of the GNU Compiler Collection and in the Clang LLVM compiler front end. Language runtime library support for blocks is also available as part of the LLVM project. Like function definitions, blocks can take arguments, and declare their own variables internally. Unlike ordinary C function definitions, their value can capture state from their surrounding context. A block definition produces an opaque value which contains both a reference to the code within the block and a snapshot of the current state of local stack variables at the time of its definition. The block may be later invoked in the same manner as a function pointer. The block may be assigned to variables, passed to functions, and otherwise treated like a normal function pointer, although the application programmer (or the API) must mark the block with a special operator (Block_copy) if it's to be used outside the scope in which it was defined. Given a block value, the code within the block can be executed at any later time by calling it, using the same syntax that would be used for calling a function. Why Use Blocks? Blocks are objects that encapsulate a unit of work—or, in less abstract terms, a segment of code—that can be executed at any time. They are essentially portable and anonymous functions that one can pass in as arguments of methods and functions or that can be returned from methods and functions. Blocks themselves have a typed argument list and may have inferred or declared returned type. You may also assign a block to a variable and then call it just as you would a function. The caret symbol (^) is used as a syntactic marker for blocks.The sample demonstrates different usage of Blocks in objective-c.

Conceptual Overview
-------------

Block objects provide a way for you to create an ad hoc function body as an expression in C, and C-derived languages such as Objective-C and C++. In other languages and environments, a block object is sometimes also called a “closure”. Here, they are typically referred to colloquially as “blocks”, unless there is scope for confusion with the standard C term for a block of code.

Block Functionality
-------------

A block is an anonymous inline collection of code that:

Has a typed argument list just like a function
Has an inferred or declared return type
Can capture state from the lexical scope within which it is defined
Can optionally modify the state of the lexical scope
Can share the potential for modification with other blocks defined within the same lexical scope
Can continue to share and modify state defined within the lexical scope (the stack frame) after the lexical scope (the stack frame) has been destroyed
You can copy a block and even pass it to other threads for deferred execution (or, within its own thread, to a runloop). The compiler and runtime arrange that all variables referenced from the block are preserved for the life of all copies of the block. Although blocks are available to pure C and C++, a block is also always an Objective-C object.

Blocks represent typically small, self-contained pieces of code. As such, they’re particularly useful as a means of encapsulating units of work that may be executed concurrently, or over items in a collection, or as a callback when another operation has finished.
Blocks are a useful alternative to traditional callback functions for two main reasons:
They allow you to write code at the point of invocation that is executed later in the context of the method implementation.
Blocks are thus often parameters of framework methods.
They allow access to local variables.
Rather than using callbacks requiring a data structure that embodies all the contextual information you need to perform an operation, you simply access local variables directly


License
--------

This code is under the BSD license.
