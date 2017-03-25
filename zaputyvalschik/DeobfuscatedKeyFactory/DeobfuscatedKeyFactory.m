//
//  DeobfuscatedKeyFactory.m
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 05/03/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import "DeobfuscatedKeyFactory.h"
#import "Obfuscator.h"

@implementation DeobfuscatedKeyFactory

+ (NSString *)deobfuscateKey:(const unsigned char *)key
                      ofSize:(size_t)size
                   withSeeds:(NSArray<NSString *> *)seeds {
    unsigned char *deobfuscatedKey = malloc(size);
    memcpy(deobfuscatedKey, key, size);
    
    unsigned char *deobfuscationTempResult = NULL;
    
    for (NSString *seed in seeds) {
        deobfuscationTempResult = [Obfuscator mixKey:(const unsigned char *)deobfuscatedKey
                                              ofSize:size
                                            withSeed:seed];
        memcpy(deobfuscatedKey, deobfuscationTempResult, size);
        
        free(deobfuscationTempResult);
    }

    NSString *result = [[NSString alloc] initWithBytes:deobfuscatedKey
                                                length:size
                                              encoding:NSUTF8StringEncoding];
    
    free(deobfuscatedKey);
    
    return result;
}

@end
