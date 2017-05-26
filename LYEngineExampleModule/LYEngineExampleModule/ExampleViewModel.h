//
//  ExampleViewModel.h
//  LYEngineExampleModule
//
//  Created by lly on 2017/5/26.
//  Copyright © 2017年 franklin. All rights reserved.
//

#import <LYEngine/LYEngine.h>
#import "ExampleViewData.h"

@interface ExampleViewModel : LYViewModel <ExampleViewModelProtocol>

VMPropretyStrong(NSMutableArray<ExampleViewData *> *, list);

@end
