//
//  ExampleViewData.m
//  LYEngineExampleModule
//
//  Created by lly on 2017/5/26.
//  Copyright © 2017年 franklin. All rights reserved.
//

#import "ExampleViewData.h"

@implementation ExampleViewData
+ (instancetype)instanceWithName:(NSString *)name nick:(NSString *)nick{
    ExampleViewData *data = [[self alloc]init];
    data.VD_name = name;
    data.VD_nick = nick;
    return data;
}

+ (NSMutableArray<ExampleViewData *> *)test:(NSInteger) count{
    NSMutableArray *a = [NSMutableArray array];
    for(int i=0;i<count;i++){
        [a addObject:[self instanceWithName:[NSString stringWithFormat:@"name%d",i] nick:[NSString stringWithFormat:@"nick%d",i]]];
    }
    
    return a;
}
@end
