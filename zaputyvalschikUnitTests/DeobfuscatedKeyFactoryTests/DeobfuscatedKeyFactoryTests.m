//
//  DeobfuscatedKeyFactoryTests.m
//  zaputyvalschik
//
//  Created by Konstantin Mordan on 05/03/2017.
//  Copyright © 2017 Konstantin Mordan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DeobfuscatedKeyFactory.h"

@interface DeobfuscatedKeyFactoryTests : XCTestCase

@end

@implementation DeobfuscatedKeyFactoryTests

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

- (void)testDeobfuscateKeyOfSizeWithSeeds_returnsCorrectDeobfuscatedKey {
    // given
    const unsigned char obfuscatedKey[] = {0xf0, 0x39, 0xae, 0x87, 0xd8, 0x17, 0x86,
                                           0x56, 0xa3, 0x0e, 0xfd, 0xd4, 0xba};
    NSArray<NSString *> *seeds = @[@"firstKey", @"secondKey"];
    
    NSString *expectedDeobfuscateKey = @"sensitive_key";

    // when
    NSString *deobfuscateKey = [DeobfuscatedKeyFactory deobfuscateKey:obfuscatedKey
                                                               ofSize:sizeof(obfuscatedKey)
                                                            withSeeds:seeds];
    
    // then
    XCTAssertEqualObjects(expectedDeobfuscateKey, deobfuscateKey);
}

- (void)testDeobfuscateKeyOfSizeWithSeeds_returnsCorrectDeobfuscatedKeyWithOneSeed {
    // given
    const unsigned char obfuscatedKey[] = {0x1c, 0x98, 0x5d, 0x82, 0x30, 0x04, 0x7f, 0x8b,
                                           0x74, 0x2a, 0xad, 0x08, 0xd4, 0x86, 0xe4, 0xb4,
                                           0x52, 0x46, 0x1a, 0xe0, 0x41, 0xc9, 0x4d, 0xde,
                                           0x72, 0x06, 0x7c, 0xd9, 0x74};
    NSArray<NSString *> *seeds = @[@"первое зерно для ключика"];
    
    NSString *expectedDeobfuscateKey = @"74bmp13b083hdro4nf9wjer123000";
    
    // when
    NSString *deobfuscateKey = [DeobfuscatedKeyFactory deobfuscateKey:obfuscatedKey
                                                               ofSize:sizeof(obfuscatedKey)
                                                            withSeeds:seeds];
    
    // then
    XCTAssertEqualObjects(expectedDeobfuscateKey, deobfuscateKey);
}

- (void)testDeobfuscateKeyOfSizeWithSeeds_doesnotDeobfuscateKeyWithIncorrectSeeds {
    // given
    const unsigned char obfuscatedKey[] = {0x4d, 0x26, 0x8d, 0x0b, 0xec, 0xbc, 0xb2, 0x34, 0xf9,
                                           0x54, 0x15, 0x3c, 0xd4, 0xda, 0x96, 0xb2, 0xaf, 0x28,
                                           0x73, 0x7d, 0x7a, 0x2e, 0x97, 0x0d, 0xde, 0xe4, 0xff,
                                           0x6b, 0x9d};
    NSArray<NSString *> *seeds = @[@"NSASCIIStringEncoding", @"cStringUsingEncoding", @"new"];
    
    NSString *expectedDeobfuscateKey = @"dateWithTimeIntervalSince1970";
    
    // when
    NSString *deobfuscateKey = [DeobfuscatedKeyFactory deobfuscateKey:obfuscatedKey
                                                               ofSize:sizeof(obfuscatedKey)
                                                            withSeeds:seeds];
    
    // then
    XCTAssertNotEqualObjects(expectedDeobfuscateKey, deobfuscateKey);
}

@end
