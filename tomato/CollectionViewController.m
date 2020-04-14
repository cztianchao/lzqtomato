//
//  CollectionViewController.m
//  tomato
//
//  Created by 刘子祺 on 2020/4/8.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import "CollectionViewController.h"
#import "TaskLableCollectionViewCell.h"
#import "TimeViewController.h"
#import "AppDelegate.h"
#import "Tasks.h"

@interface CollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,reloadDelegate>
@property (nonatomic, strong, readwrite) NSArray <Tasks *> *tasklist;

@end

@implementation CollectionViewController

-(instancetype) init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"待办";
//        _tasklist = [[NSArray alloc] initWithObjects:[[Tasks alloc] init:@"task1" withLength:@"2"],[[Tasks alloc] init:@"task2" withLength:@"1"], nil];
        NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
        NSString *tasksPath = [paths firstObject];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //document
        NSString *dataPath = [tasksPath stringByAppendingPathComponent:@"data"];
        NSString *tasksData = [dataPath stringByAppendingPathComponent:@"list"];

        NSData *readData = [fileManager contentsAtPath:tasksData];
        id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[Tasks class], nil] fromData:readData error:nil];
        
        if([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0){
            _tasklist = (NSArray<Tasks *>*)unarchiveObj;

        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];//设置一个layout,多种布局 flowlayout 系统提供的流式布局
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.itemSize = CGSizeMake(self.view.frame.size.width - 20 , 100);
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    

    [collectionView registerClass:[TaskLableCollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell"];//注册layout
    
    [self.view addSubview:collectionView];
    [self _getSandBoxPath:_tasklist];
    // Do any additional setup after loading the view.
    
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *tasksPath = [paths firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //document
    NSString *dataPath = [tasksPath stringByAppendingPathComponent:@"data"];
    NSString *tasksData = [dataPath stringByAppendingPathComponent:@"list"];

    NSData *readData = [fileManager contentsAtPath:tasksData];
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[Tasks class], nil] fromData:readData error:nil];
    
    if([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0){
        _tasklist = (NSArray<Tasks *>*)unarchiveObj;

    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _tasklist.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    TaskLableCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    // NSLog(@"a");
    [cell layoutcTableViewCell:[_tasklist objectAtIndex:indexPath.row].taskName withLength:[_tasklist objectAtIndex:indexPath.row].length];
    
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.delegate1 = self;
    [cell addwithArray:_tasklist withID:indexPath.row];
    
//    cell.contentView.layer.cornerRadius = 0.2f;
//    cell.contentView.layer.borderWidth = 1.0f;
//    cell.contentView.layer.borderColor = [UIColor clearColor].CGColor;
//    cell.contentView.layer.masksToBounds = YES;
    
    cell.layer.shadowOffset = CGSizeMake(0, 2);

    cell.layer.shadowColor = [UIColor blackColor].CGColor;

    cell.layer.shadowOpacity = 0.9;
    
    //cell.titleLable.text = @"test";

    cell.layer.shadowRadius = 4;
    cell.layer.masksToBounds = NO;
    cell.startButton.tag = indexPath.row;
    [cell.startButton addTarget:self action:@selector(taskStart:)  forControlEvents:UIControlEventTouchUpInside];
//      cell.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds cornerRadius:cell.contentView.layer.cornerRadius].CGPath;
    
    
    return cell;
}

- (void) viewClick{
    NSLog(@"edit");
}

- (void)taskStart:(UIButton *)button{
    //table view被选中
    TimeViewController *viewcon = [[TimeViewController alloc]init: [_tasklist objectAtIndex:button.tag].length];
    viewcon.title = [_tasklist objectAtIndex:button.tag].taskName;
    [self.navigationController pushViewController:viewcon animated:YES];
}

- (void) _getSandBoxPath:(NSArray<Tasks *> *)array{
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *tasksPath = [paths firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //document
    NSString *dataPath = [tasksPath stringByAppendingPathComponent:@"data"];

    NSError *creatError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];
    
    //file
    //NSString *tasksData = [dataPath stringByAppendingPathComponent:@"list"];
    //NSData *listdata = [@"Abc" dataUsingEncoding:NSUTF8StringEncoding];

    
   // NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    
    
    
    
//    //search
//    BOOL filesearch = [fileManager fileExistsAtPath:tasksData];
    
//    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:tasksData];
    
//    [fileHandler seekToEndOfFile];
//    [fileHandler writeData:[@"Abc" dataUsingEncoding:NSUTF8StringEncoding]];
    
//    [fileHandler synchronizeFile];
//    [fileHandler closeFile];
    
    NSLog(@"end");
}


-(void) refreshIt{
    [_delegate rel];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
