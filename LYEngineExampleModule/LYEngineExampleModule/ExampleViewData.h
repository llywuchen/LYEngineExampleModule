//
//  ExampleViewData.h
//  LYEngineExampleModule
//
//  Created by lly on 2017/5/26.
//  Copyright © 2017年 franklin. All rights reserved.
//

#import <LYEngine/LYEngine.h>

@interface ExampleViewData : LYViewData
VDPropretyCopy(NSString *, name);
VDPropretyCopy(NSString *, nick);
+ (instancetype)instanceWithName:(NSString *)name nick:(NSString *)nick;
+ (NSMutableArray<ExampleViewData *> *)test:(NSInteger) count;
@end


@protocol ExampleViewModelProtocol <NSObject>

VDPropretyStrong(NSMutableArray<ExampleViewData *> *, list);

@end
