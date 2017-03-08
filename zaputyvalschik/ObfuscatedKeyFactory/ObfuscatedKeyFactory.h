//
//  ObfuscatedKeyFactory.h
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 26/02/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObfuscatedKeyFactory : NSObject

+ (const char *)obfuscateKey:(NSString *)key
                   withSeeds:(NSArray<NSString *> *)seeds;

@end
