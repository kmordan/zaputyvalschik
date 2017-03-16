//
//  main.m
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 24/02/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Converter.h"
#import "ObfuscatedKeyFactory.h"
#import "DeobfuscatedKeyFactory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *key = @"sensitive_key";
        NSArray<NSString *> *seeds = @[@"firstKey", @"secondKey"];
        
        size_t size = strlen([key cStringUsingEncoding:NSUTF8StringEncoding]);
        
        const unsigned char *obfuscatedKey = [ObfuscatedKeyFactory obfuscateKey:key
                                                                      withSeeds:seeds];
        
        NSString *convertedToStringObfuscatedKey = [Converter convertCharArray:obfuscatedKey
                                                                        ofSize:size
                                                     toHexStringUsingSeparator:@", "];
        
        NSString *deobfuscatedKey = [DeobfuscatedKeyFactory deobfuscateKey:obfuscatedKey
                                                                    ofSize:size
                                                                 withSeeds:seeds];

        NSLog(@"\n\nYour obfuscated key is: \n\n%@"
              @"\n\nYour deobfuscated key was: \n\n%@"
              @"\n\n👊", convertedToStringObfuscatedKey, deobfuscatedKey);
        
        free((char *)obfuscatedKey);
    }

    return 0;
}
