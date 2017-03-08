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
    unsigned char obfuscatedKey[] = {0xf0, 0x39, 0xae, 0x87, 0xd8, 0x17, 0x86,
                                     0x56, 0xa3, 0x0e, 0xfd, 0xd4, 0xba};
    unsigned long size = sizeof(obfuscatedKey);
    NSArray<NSString *> *seeds = @[@"secondKey", @"firstKey"];
    
    NSString *expectedDeobfuscateKey = @"sensitive_key";

    // when
    NSString *deobfuscateKey = [DeobfuscatedKeyFactory deobfuscateKey:obfuscatedKey
                                                               ofSize:size
                                                            withSeeds:seeds];
    // then
    XCTAssertEqualObjects(expectedDeobfuscateKey, deobfuscateKey);
}

@end
