//
//  main.m
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 24/02/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Printer.h"
#import "ObfuscatedKeyFactory.h"
#import "DeobfuscatedKeyFactory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *key = @"sensitive_key";
        NSArray<NSString *> *seeds = @[@"firstKey", @"secondKey"];
        
        unsigned long obfuscatedKeySize = key.length + 1u;
        
        unsigned char *obfuscatedKey = [ObfuscatedKeyFactory obfuscateKey:key
                                                                withSeeds:seeds];
        [Printer printObfuscatedKey:obfuscatedKey
                             ofSize:obfuscatedKeySize
                     usingSeparator:@", "];
        
        NSString *deobfuscatedKey = [DeobfuscatedKeyFactory deobfuscateKey:obfuscatedKey
                                                                    ofSize:obfuscatedKeySize
                                                                 withSeeds:[[seeds reverseObjectEnumerator] allObjects]];
        NSLog(@"Your deobfuscated key: %@", deobfuscatedKey);
        
    }
    return 0;
}
