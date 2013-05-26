//
//  SGridBlockQueue.h
//  ShinobiControls_Source
//
//  Created by Sam Davies on 09/04/2013.
//
//

#import <Foundation/Foundation.h>

typedef void(^VoidBlock)(void);

@interface SGridBlockQueue : NSObject

- (void)addBlock:(VoidBlock)block;
- (void)executeQueue;

@end
