//
//  ObfuscatedKeyFactoryTests.m
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 26/02/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ObfuscatedKeyFactory.h"

@interface ObfuscatedKeyFactoryTests : XCTestCase

@end

@implementation ObfuscatedKeyFactoryTests

#pragma mark - Lifecycle

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Tests

- (void)testObfuscateKeyWithSeeds_returnsCorrectObfuscatedKey {
    // given
    NSString *key = @"sensitive_key";
    NSArray<NSString *> *seeds = @[@"firstKey", @"secondKey"];
    
    const unsigned char expectedObfuscatedKey[] = {0xf0, 0x39, 0xae, 0x87, 0xd8, 0x17, 0x86,
                                                   0x56, 0xa3, 0x0e, 0xfd, 0xd4, 0xba};
    
    // when
    const unsigned char *obfuscatedKey = [ObfuscatedKeyFactory obfuscateKey:key
                                                                  withSeeds:seeds];
    
    // then
    int cmpResult = memcmp(expectedObfuscatedKey, obfuscatedKey, sizeof(expectedObfuscatedKey));
    
    free((unsigned char *)obfuscatedKey);
    
    XCTAssertTrue(cmpResult == 0);
}

- (void)testObfuscateKeyWithSeeds_returnsCorrectObfuscatedKeyWithOneSeed {
    // given
    NSString *key = @"74bmp13b083hdro4nf9wjer123000";
    NSArray<NSString *> *seeds = @[@"первое зерно для ключика"];
    
    const unsigned char expectedObfuscatedKey[] = {0x1c, 0x98, 0x5d, 0x82, 0x30, 0x04, 0x7f, 0x8b,
                                                   0x74, 0x2a, 0xad, 0x08, 0xd4, 0x86, 0xe4, 0xb4,
                                                   0x52, 0x46, 0x1a, 0xe0, 0x41, 0xc9, 0x4d, 0xde,
                                                   0x72, 0x06, 0x7c, 0xd9, 0x74};
    
    // when
    const unsigned char *obfuscatedKey = [ObfuscatedKeyFactory obfuscateKey:key
                                                                  withSeeds:seeds];
    
    // then
    int cmpResult = memcmp(expectedObfuscatedKey, obfuscatedKey, sizeof(expectedObfuscatedKey));
    
    free((unsigned char *)obfuscatedKey);
    
    XCTAssertTrue(cmpResult == 0);
}

@end
