//
//  ExampleUserCase.m
//  LYEngineExampleModule
//
//  Created by lly on 2017/5/26.
//  Copyright © 2017年 franklin. All rights reserved.
//

#import "ExampleUserCase.h"

@interface ExampleUserCase ()

@property (nonatomic,strong) id<ExampleUserCaseAPI> requestManager;

@end

@implementation ExampleUserCase

- (id<ExampleUserCaseAPI>)requestManager{
    if(!_requestManager){
        _requestManager = LYWebRequest(ExampleUserCaseAPI);
    }
    return _requestManager;
}

- (NSURLSessionDataTask *)getListWithCount:(NSInteger)count suceessBlock:(void (^)(NSArray<Example *> *, NSURLResponse *))callback failBlock:(void (^)(NSString *, NSURLResponse *, NSError *))errorMessage{
    
    return [self.requestManager getListWithCount:count suceessBlock:^(NSArray<Example *> *result, NSURLResponse *response) {
        if(callback){
            callback(result,response);
        }
    } failBlock:^(NSString *errorMessage, NSURLResponse *response, NSError *error) {
        NSLog(@"getListWithCount requaet fail");
    }];
}

@end
