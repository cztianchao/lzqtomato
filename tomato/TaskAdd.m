//
//  TaskAdd.m
//  tomato
//
//  Created by 刘子祺 on 2020/4/9.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import "TaskAdd.h"

@interface TaskAdd ()

@property(nonatomic, strong, readwrite) UIView *backgroundView;
@property(nonatomic, strong, readwrite) UIView *blankBackground;
@property(nonatomic, strong, readwrite) UIButton *confrimButton;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;
@property(nonatomic, strong, readwrite) UILabel *editTitle;
@property(nonatomic, strong, readwrite) UITextField *taskName;
@property(nonatomic, strong, readwrite) UITextField *length;
@property(nonatomic, strong, readwrite) NSArray<Tasks *> *list;
@property(nonatomic, readwrite) int cellid;

@end

@implementation TaskAdd

-(instancetype)initWithFrame:(CGRect)frame withArray:(NSArray<Tasks *> *)list withID:(int)cellid{
    self = [super initWithFrame:frame];
    if(self){
        self.list = list;
        self.cellid = cellid;
        [self addSubview:({
            _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            [_backgroundView addGestureRecognizer:({
                UIGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
                tapGesture;
            })];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.5;
            _backgroundView;
        })];
        
        [self addSubview:({
            _blankBackground = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
            
            _blankBackground.backgroundColor = [UIColor whiteColor];
            _blankBackground;
        })];
        
        [self addSubview:({
            _editTitle = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
            _editTitle.alpha = 0;
            _editTitle.text = @"编辑";
            [_editTitle setFont:[UIFont systemFontOfSize:25]];
            [_editTitle sizeToFit];
//            _editTitle.backgroundColor = [UIColor redColor];
            _editTitle;
        })];
        
        [self addSubview:({
            _confrimButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0,0,0)];
            _confrimButton.alpha = 0;
            [_confrimButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
//            _confrimButton.backgroundColor = [UIColor blackColor];
            [_confrimButton setTitle:@"确认" forState:UIControlStateNormal];
            [_confrimButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            _confrimButton;
        })];
        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0,0,0)];
            _deleteButton.alpha = 0;
            [_deleteButton addTarget:self action:@selector(_deleteBut) forControlEvents:UIControlEventTouchUpInside];
                   //_deleteButton.backgroundColor = [UIColor redColor];
            [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
            [_deleteButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            _deleteButton;
        })];
        [self addSubview:({
            _taskName = [[UITextField alloc]initWithFrame:CGRectMake(0,0,0,0)];
            _taskName.borderStyle = UITextBorderStyleRoundedRect;
            _taskName.alpha = 0;
            _taskName.backgroundColor = [UIColor whiteColor];
            _taskName.text = [list objectAtIndex:cellid].taskName;
            _taskName;
        })];
        
        [self addSubview:({
            _length = [[UITextField alloc]initWithFrame:CGRectMake(0,0,0,0)];
            _length.borderStyle = UITextBorderStyleRoundedRect;
            _length.alpha = 0;
            _length.backgroundColor = [UIColor whiteColor];
            _length.text = [list objectAtIndex:cellid].length;
            _length;
        })];
    }
    return self;
}

- (void)show{
    [[[[UIApplication sharedApplication] windows] objectAtIndex:0] addSubview:self];
    
    [UIView animateWithDuration:1.5f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.blankBackground.frame = CGRectMake(20,300, self.frame.size.width - 40,300);
        self.blankBackground.center = self.center;
    }completion:^(BOOL finished){
        NSLog(@"s");
    }];
    
    [UIView animateWithDuration:1.5f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
           self.editTitle.frame = CGRectMake(40, 320, self.frame.size.width - 40,30);
        self.editTitle.alpha = 1;
       }completion:^(BOOL finished){
           NSLog(@"s");
       }];
    
    [UIView animateWithDuration:1.5f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
           self.confrimButton.frame = CGRectMake(self.blankBackground.frame.origin.x + self.frame.size.width / 2 + 20, 510, 100, 30);
        self.confrimButton.alpha = 1;
       }completion:^(BOOL finished){
           NSLog(@"s");
       }];
    
    [UIView animateWithDuration:1.5f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.deleteButton.frame = CGRectMake(self.blankBackground.frame.origin.x + self.frame.size.width / 2 - 170, 510, 100, 30);
     self.deleteButton.alpha = 1;
    }completion:^(BOOL finished){
        NSLog(@"s");
    }];
    
    [UIView animateWithDuration:1.5f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.taskName.frame = CGRectMake(self.blankBackground.frame.origin.x + self.frame.size.width / 2 - 90,380, 140, 30);
         self.taskName.alpha = 1;
        }completion:^(BOOL finished){
    //        NSLog(@"s");
        }];
        
        [UIView animateWithDuration:1.5f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.length.frame = CGRectMake(self.blankBackground.frame.origin.x + self.frame.size.width / 2 - 90,440, 140, 30);
         self.length.alpha = 1;
        }completion:^(BOOL finished){
    //        NSLog(@"s");
        }];
}

- (void)dismiss{
    [self removeFromSuperview];
}

- (void)_clickButton{
    NSArray<Tasks *> * temp;
    int i = 0;
    for(i = 0;i < _list.count;i++){
        if(i != _cellid && temp){
            temp = [temp arrayByAddingObject:[_list objectAtIndex:i]];
        }
        else if(i != _cellid && !temp){
            temp = [[NSArray alloc]initWithObjects:[_list objectAtIndex:i] , nil];
        }
        else if(i == _cellid && !temp){
            temp = [[NSArray alloc]initWithObjects:[[Tasks alloc]init:_taskName.text withLength:_length.text] , nil];
        }
        else{
            temp = [temp arrayByAddingObject:[[Tasks alloc]init:_taskName.text withLength:_length.text]];
        }
    }
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *tasksPath = [paths firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //document
    NSString *dataPath = [tasksPath stringByAppendingPathComponent:@"data"];
    NSString *tasksData = [dataPath stringByAppendingPathComponent:@"list"];

    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:temp requiringSecureCoding:YES error:nil];
    [fileManager createFileAtPath:tasksData contents:listData attributes:nil];
    [self removeFromSuperview];
    [self reload];
}

- (void)_deleteBut{
    NSArray<Tasks *> * temp;
    int i = 0;
    for(i = 0;i < _list.count;i++){
        if(i != _cellid && temp){
            temp = [temp arrayByAddingObject:[_list objectAtIndex:i]];
        }
        else if(i != _cellid && !temp){
            temp = [[NSArray alloc]initWithObjects:[_list objectAtIndex:i] , nil];
        }
    }
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *tasksPath = [paths firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //document
    NSString *dataPath = [tasksPath stringByAppendingPathComponent:@"data"];
    NSString *tasksData = [dataPath stringByAppendingPathComponent:@"list"];

    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:temp requiringSecureCoding:YES error:nil];
    [fileManager createFileAtPath:tasksData contents:listData attributes:nil];
    [self removeFromSuperview];
    [self reload];
}

-(void) reload{
    [_delegate reloadView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
