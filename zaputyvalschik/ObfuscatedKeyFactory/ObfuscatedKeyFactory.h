//
//  ObfuscatedKeyFactory.h
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 26/02/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @author Konstantin Mordan
 
 Factory provides obfuscated key
 */
@interface ObfuscatedKeyFactory : NSObject

/**
 @author Konstantin Mordan
 
 Method returns obfuscated key
 
 @param key   Original key
 @param seeds Array of seeds with which original key will be obfuscated
 @return      Obfuscated key
 */
+ (const unsigned char *)obfuscateKey:(NSString *)key
                            withSeeds:(NSArray<NSString *> *)seeds;

@end
