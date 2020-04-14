//
//  TaskLableCollectionViewCell.m
//  tomato
//
//  Created by 刘子祺 on 2020/4/8.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import "TaskLableCollectionViewCell.h"
#import "TaskAdd.h"

@interface TaskLableCollectionViewCell()<TaskViewCellDelegate,deleteDelegate>

@end

@implementation TaskLableCollectionViewCell

//初始化方法
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.delegate = self;
    UITapGestureRecognizer *holdon = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taskEdit)];
    [self addGestureRecognizer:holdon];
    if(self){
        [self.contentView addSubview:({
            self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 50)];
            //self.titleLable.backgroundColor = [UIColor greenColor];
            self.titleLable.font = [UIFont systemFontOfSize:16];
            self.titleLable.textColor = [UIColor blackColor];
            self.titleLable;
        })];
        
        [self.contentView addSubview:({
            self.timeLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 75, 50, 20)];
            //self.timeLable.backgroundColor = [UIColor yellowColor];
            self.timeLable.font = [UIFont systemFontOfSize:12];
            self.timeLable.textColor = [UIColor grayColor];
            self.timeLable;
        })];
        
//        [self.contentView addSubview:({
//            self.tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 70, 70)];
//            self.tempImageView.backgroundColor = [UIColor redColor];
//                   //self.timeLable.backgroundColor = [UIColor yellowColor];
//            self.tempImageView;
//        })];
        
        [self.contentView addSubview:({
            self.startButton = [[UIButton alloc] initWithFrame:CGRectMake(320, 25, 40, 40)];
//            self.startButton.backgroundColor = [UIColor redColor];
            [self.startButton setTitle:@"开始" forState:UIControlStateNormal];
            [self.startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            //self.timeLable.backgroundColor = [UIColor yellowColor];
            self.startButton;
        })];
    }
    return self;
}

- (void)addwithArray:(NSArray<Tasks *> *)list withID:(int) cellID{
    self.cellID = cellID;
    self.list = list;
}

- (void) layoutcTableViewCell:(NSString *) name withLength:(NSString *) length{
    self.titleLable.text = name;
    int temp = [length intValue] * 1;
    NSString *s = [NSString stringWithFormat:@"%d 分钟",temp];
    self.timeLable.text = s;
    [self.timeLable sizeToFit];
}

- (void)taskEdit{
    if(self.delegate && [self.delegate respondsToSelector:@selector(collectionViewCell:clickEditButton:)]){
        [self.delegate collectionViewCell:self clickEditButton:self];
    }
}

- (void)collectionViewCell:(UICollectionViewCell *)collectionViewCell clickEditButton:(UICollectionViewCell *)editButton {
    TaskAdd *aview = [[TaskAdd alloc] initWithFrame:[[[UIApplication sharedApplication] windows] objectAtIndex:0].bounds withArray:_list withID:_cellID];
    aview.delegate = self;
    [aview show];
}
-(void) ref{
    [_delegate1 refreshIt];
}
-(void) reloadView{
    [self ref];
}


@end
