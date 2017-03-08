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

+ (NSString *)deobfuscateKey:(const char *)key
                   withSeeds:(NSArray<NSString *> *)seeds {
    size_t nullTerminatedKeySize = strlen(key);

    char *deobfuscatedKey = malloc(nullTerminatedKeySize);
    strcpy(deobfuscatedKey, key);
    
    char *deobfuscationTempResult = NULL;
    
    for (NSString *seed in seeds) {
        deobfuscationTempResult = [Obfuscator mixKey:(const char *)deobfuscatedKey
                                            withSeed:seed];
        strcpy(deobfuscatedKey, deobfuscationTempResult);
        
        free(deobfuscationTempResult);
    }

    NSString *result = [[NSString alloc] initWithBytes:deobfuscatedKey
                                                length:nullTerminatedKeySize
                                              encoding:NSUTF8StringEncoding];
    
    free(deobfuscatedKey);
    
    return result;
}

@end
