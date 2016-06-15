//
//  String.m
//  Created by Devin on 7/18/12.
//
/*
 
 tapku.com || https://github.com/devinross/tapkulibrary
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "NSStringTests.h"

@implementation NSStringTests


- (void) testEmail{
        
    XCTAssertTrue([@"bob@sanders.com" isEmail], @"Expected to be a valid email");
    XCTAssertTrue([@"ao123sda.b2132Ob@sAND123123dsadrs.c" isEmail], @"Expected to be a valid email");
    
    XCTAssertFalse([@"ao,sda.bOb@sANDdsadrs.c" isEmail], @"Expected to be an invalid email");
    XCTAssertFalse([@"" isEmail], @"Expected to be an invalid email");
    XCTAssertFalse([@"@b.d" isEmail], @"Expected to be an invalid email");
    
}

- (void) testMD5Sum{
	XCTAssertEqualObjects([@"password" md5sum], @"5f4dcc3b5aa765d61d8327deb882cf99");
	XCTAssertEqualObjects([@"devin" md5sum], @"11ef1590a74e1ab26c31a4e13f52d71b");
}


- (void) testURLEncode{
	XCTAssertEqualObjects([@"Bob Sanders" URLEncode], @"Bob%20Sanders");
	XCTAssertEqualObjects([@"\"Aardvarks lurk, OK?\"" URLEncode], @"%22Aardvarks%20lurk%2C%20OK%3F%22");
}


- (void) testHasString{
	
	XCTAssertTrue([@"Bob Sanders" hasString:@"Sanders"]);
	
	XCTAssertFalse([@"Bob Sanders" hasString:@"SANDERS"]);
	XCTAssertFalse([@"Bob Sanders" hasString:@"Cooper"]);
	
}


@end