//
//  Obfuscator.h
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 05/03/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Obfuscator : NSObject

+ (unsigned char *)mixKey:(unsigned char *)key
                   ofSize:(unsigned long)size
                 withSeed:(NSString *)seed;

@end
