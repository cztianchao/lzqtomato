//
//  MainViewController.m
//  tomato
//
//  Created by 刘子祺 on 2020/4/7.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import "MainViewController.h"
#import "TaskLableTableViewCell.h"

//@interface Test : UIView
//
//@end
//
//@implementation Test
//
//-(instancetype)init{
//    self = [super init];
//    if(self){
//
//    }
//    return self;
//}
//
//- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
//    [super willMoveToSuperview:newSuperview];
//}
//
//- (void)didMoveToSuperview{
//    [super didMoveToSuperview];
//}
//
//- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
//    [super willMoveToWindow:newWindow];
//
//}
//- (void)didMoveToWindow{
//    [super didMoveToWindow];
//
//}
//@end

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MainViewController

- (instancetype)init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"待办集";
    }
    return self;
}
//
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//}// Called when the view is about to made visible. Default does nothing
//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//}// Called when the view has been fully transitioned onto the screen. Default does nothing
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//}// Called when the view is dismissed, covered or otherwise hidden. Default does nothing
//- (void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:animated];
//}// Called after the view was dismissed, covered or otherwise hidden. Default does nothing


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
   
    // Do any additional setup after loading the view from its nib.
//    Test *view = [[Test alloc] init];
//    view.backgroundColor = [UIColor redColor];
//    view.frame = CGRectMake(100, 100, 100, 100);
//    [self.view addSubview:view];
//
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushController)];
//    [view addGestureRecognizer:tapGesture];
}

//table view高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

//table view被选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *viewcon = [[UIViewController alloc]init];
    viewcon.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    [self.navigationController pushViewController:viewcon animated:YES];
}



//- (void)pushController{
//    UIViewController *viewController = [[UIViewController alloc] init];
//    viewController.view.backgroundColor = [UIColor whiteColor];
//    viewController.navigationItem.title = @"待办";
//
//    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:nil];
//
//    [self.navigationController pushViewController:viewController animated:YES];//向navigationcontroller里push新的页面
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//datasource 必须实现：数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

//cell的样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TaskLableTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"tasks"];
    if(!cell){
        cell = [[TaskLableTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"tasks"];
    }
    
    [cell layoutTableViewCell];
    
//    [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"tasks"];
//    cell.textLabel.text = [NSString stringWithFormat:@"main title - %@",@(indexPath.row)];
//    cell.detailTextLabel.text = @"subtitle";
    
    
    return cell;
    
}

@end
