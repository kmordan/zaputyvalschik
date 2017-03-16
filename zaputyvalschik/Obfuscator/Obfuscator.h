//
//  Obfuscator.h
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 05/03/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @author Konstantin Mordan
 
 Class encapsulates obfuscation logic
 */
@interface Obfuscator : NSObject

/**
 @author Konstantin Mordan
 
 Method returns smoothie from key and seed
 */
+ (unsigned char *)mixKey:(const unsigned char *)key
                   ofSize:(size_t)size
                 withSeed:(NSString *)seed;

@end
