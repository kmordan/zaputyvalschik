//
//  DeobfuscatedKeyFactory.h
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 05/03/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeobfuscatedKeyFactory : NSObject

+ (NSString *)deobfuscateKey:(unsigned char *)key
                      ofSize:(unsigned long)size
                   withSeeds:(NSArray<NSString *> *)seeds;

@end
