//
//  ExampleUserCaseProtocol.h
//  LYEngineExampleModule
//
//  Created by lly on 2017/5/26.
//  Copyright © 2017年 franklin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Example.h"
@class Example;

@protocol ExampleUserCaseAPI <LYWebService>

@GET("/post")
- (NSURLSessionDataTask*)getListWithCount:(NSInteger)count suceessBlock:LY_SUCCESS_BLOCK(NSArray<Example *>*)callback failBlock:LY_FAIL_BLOCK(NSString*)errorMessage;

@end
