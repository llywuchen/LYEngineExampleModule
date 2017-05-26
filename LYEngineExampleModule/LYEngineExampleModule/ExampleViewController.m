//
//  ExampleViewController.m
//  LYEngineExampleModule
//
//  Created by lly on 2017/5/26.
//  Copyright © 2017年 franklin. All rights reserved.
//

#import "ExampleViewController.h"

#import "ExampleViewData.h"

#define ViewControllerReadly

#ifdef ViewControllerReadly
#import "ExampleViewModel.h"
#endif

@interface ExampleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSObject<ExampleViewModelProtocol> * viewModel;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [self bindViewData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ViewModel
#ifdef ViewControllerReadly
//LYSynthesizeViewModelReadly(ExampleViewModelProtocol,ExampleViewModel);
LYSynthesizeSubViewModelRegisterAndReadly(self.tableView,viewModel,ExampleViewModelProtocol,ExampleViewModel);
- (void)bindViewData{
    [RACObserve(self.viewModel,VD_list) subscribeNext:^(id  _Nullable x) {
        [self.tableView reloadData];
    }];
}
#else
LYSynthesizeViewModelUnReadly(ViewModel);
LYSynthesizeSubViewModelRegisterAndUnReadly(self.tableView, listViewModel, ListVMProtocol);
- (void)bindViewData{
    MKTStubProperty(self.listViewModel,VD_list,[LYTViewData test:20]);
    MKTStubProperty(self.viewModel,VD_userName,@"VD_userName");
    MKTStubProperty(self.viewModel,VD_userPwd,@"VD_userPwd");
    self.userNameField.text = self.viewModel.VD_userName;
    self.userPwdField.text = self.viewModel.VD_userPwd;
}
#endif


#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.VD_list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    ExampleViewData *obj = self.viewModel.VD_list[indexPath.row];
    cell.textLabel.text = obj.VD_name;
    cell.detailTextLabel.text = obj.VD_nick;
    return cell;
}


@end
