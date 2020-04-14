//
//  AppDelegate.m
//  tomato
//
//  Created by 刘子祺 on 2020/4/7.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "CollectionViewController.h"
#import "AddTask.h"
#import "Tasks.h"

@interface AppDelegate ()<UITabBarControllerDelegate,reloadViewDelegate>
- (void) addaTask;
@property (nonatomic, strong, readwrite) NSArray <Tasks *> *tasklist;
@property (nonatomic, strong, readwrite) UIBarButtonItem *right;
@property (nonatomic, strong, readwrite) CollectionViewController *collectionViewController;
@property (nonatomic, strong, readwrite) UITabBarController *tabBarController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [NSThread sleepForTimeInterval:1.0];

    
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.rootViewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    
    _tabBarController = [[UITabBarController alloc] init];
    
    MainViewController *mainViewController = [[MainViewController alloc] init];
    _collectionViewController = [[CollectionViewController alloc]init];
    _collectionViewController.delegate = self;
    
    
    
//    UIViewController *controller1 = [[UIViewController alloc]init];
//    navigationController.view.backgroundColor = [UIColor whiteColor];
    
//    controller1.tabBarItem.image = [UIImage imageNamed:@"pics/1.png"];
    
//    UIViewController *controller2 = [[UIViewController alloc]init];
//    controller2.view.backgroundColor = [UIColor whiteColor];
    
//    controller2.tabBarItem.image = [UIImage imageNamed:@"pics/2.png"];
    
    UIViewController *controller3 = [[UIViewController alloc]init];
    controller3.view.backgroundColor = [UIColor whiteColor];
    controller3.tabBarItem.title = @"数据统计";
//    controller3.tabBarItem.image = [UIImage imageNamed:@"pics/3.png"];
    
    
    UIViewController *controller4 = [[UIViewController alloc]init];
    controller4.view.backgroundColor = [UIColor whiteColor];
    controller4.tabBarItem.title = @"我的";
//    controller4.tabBarItem.image = [UIImage imageNamed:@"pics/4.png"];

    _right = [[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(addaTask)];
    [_right setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:35], NSFontAttributeName,nil] forState:(UIControlStateNormal)];
    [_tabBarController setViewControllers:@[_collectionViewController,mainViewController,controller3,controller4]];
    _tabBarController.navigationItem.rightBarButtonItem = _right;
    _tabBarController.navigationItem.title = @"lzq番茄时钟";
//    [tabBarController setViewControllers:@[collectionViewController,controller3,controller4]];
    _tabBarController.delegate = self;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:_tabBarController];
    


    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void) addaTask{
    AddTask *a = [[AddTask alloc]initWithFrame:[[[UIApplication sharedApplication] windows] objectAtIndex:0].bounds];
    objc_setAssociatedObject(a.confrimButton, "first", a, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(a.confrimButton, "second", @"1", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [a.confrimButton addTarget:self action:@selector(add:)  forControlEvents:UIControlEventTouchUpInside];
    [a show];
}

-(void) add:(UIButton *)btn{
    AddTask *temp = objc_getAssociatedObject(btn, "first");
    
    NSString *name = temp.taskName.text;
    NSString *length = temp.length.text;
    Tasks *tempTask = [[Tasks alloc]init:name withLength:length];
//    NSArray <Tasks *> *templist = [[NSArray alloc]initWithObjects:tempTask, nil];
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
    if(_tasklist){
        _tasklist = [_tasklist arrayByAddingObject:tempTask];
    }
    else{
        _tasklist = [[NSArray alloc]initWithObjects:tempTask, nil];
    }
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:_tasklist requiringSecureCoding:YES error:nil];
    [fileManager createFileAtPath:tasksData contents:listData attributes:nil];
    [_collectionViewController viewDidLoad];
    
    
    //file

//    //NSData *listdata = [@"Abc" dataUsingEncoding:NSUTF8StringEncoding];
//    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:tasksData];
//
//
//
//    [fileHandler seekToEndOfFile];
//    [fileHandler writeData:listData];
//
//    [fileHandler synchronizeFile];
//    [fileHandler closeFile];
    NSLog(@"%@", name);
}

-(void) rel{
    [_collectionViewController viewDidLoad];
}


@end
