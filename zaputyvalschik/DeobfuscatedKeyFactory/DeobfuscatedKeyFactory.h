//
//  DeobfuscatedKeyFactory.h
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 05/03/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @author Konstantin Mordan
 
 Factory provides deobfuscated key
 */
@interface DeobfuscatedKeyFactory : NSObject

/**
 @author Konstantin Mordan
 
 Method returns deobfuscated key

 @param key   Obfuscated key
 @param seeds Array of seeds with which original key was obfuscated
 @return      Deobfuscated key
 */
+ (NSString *)deobfuscateKey:(const char *)key
                   withSeeds:(NSArray<NSString *> *)seeds;

@end
