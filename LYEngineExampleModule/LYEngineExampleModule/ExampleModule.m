//
//  ExampleModule.m
//  LYEngineExampleModule
//
//  Created by lly on 2017/5/26.
//  Copyright © 2017年 franklin. All rights reserved.
//

#import "ExampleModule.h"
#import "ExampleViewController.h"
#import "ExampleUserCase.h"

@implementation ExampleModule

- (void)onModuleInstlled{
    [super onModuleInstlled];
}

- (void)onModuleUninstalled{
    [super onModuleUninstalled];
}

- (void)initRouter{
    [super initRouter];
    [self.class registerURLPattern:ExampleModuleMainVC toObjectHandler:^id(NSDictionary *routerParameters) {
        ExampleViewController *v = [[ExampleViewController alloc]init];
        return v;
    }];
}

- (void)unInitRouter{
    [super unInitRouter];
}

- (void)registerUserCase{
    [self registerUserCase:[ExampleUserCase class]];
}

- (void)initEnvironment{
    [super initEnvironment];
    self.APIHost = @"http://www.hoolyshine.com/llywuchen";
}

@end
