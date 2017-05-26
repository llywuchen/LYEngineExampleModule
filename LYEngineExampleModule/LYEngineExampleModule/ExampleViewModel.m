//
//  ExampleViewModel.m
//  LYEngineExampleModule
//
//  Created by lly on 2017/5/26.
//  Copyright © 2017年 franklin. All rights reserved.
//

#import "ExampleViewModel.h"
#import "ExampleUserCaseProtocol.h"

@implementation ExampleViewModel

LYSynthesizeProprety(NSMutableArray<ExampleViewData *> *, VD_list, VM_list);

- (void)onViewDidAppear:(BOOL)animated{
    [super onViewDidAppear:animated];
    NSLog(@"onViewDidAppear");
    
    [self refrsh];
}

- (void)refrsh{
    LYUserCase<ExampleUserCaseAPI> *listUserCase = (LYUserCase<ExampleUserCaseAPI> *)[LYUserCase instanceWithProtoco:@protocol(ExampleUserCaseAPI)];
    [listUserCase getListWithCount:10 suceessBlock:^(NSArray<Example *> *result, NSURLResponse *response) {
        self.VM_list = [self transformAction:result];
    } failBlock:^(NSString *errorMessage, NSURLResponse *response, NSError *error) {
        
    }];
    
}

- (NSMutableArray<ExampleViewData *> *)transformAction:(NSArray<Example *> *)modelList{
    NSMutableArray *a = [NSMutableArray array];
    for(Example *model in modelList){
        [a addObject:[self transform:model]];
    }
    return a;
}

- (ExampleViewData *)transform:(Example *)model{
    return [ExampleViewData instanceWithName:model.name nick:model.site];
}


@end
