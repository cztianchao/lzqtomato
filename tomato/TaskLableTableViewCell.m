//
//  TaskLableTableViewCell.m
//  tomato
//
//  Created by 刘子祺 on 2020/4/8.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import "TaskLableTableViewCell.h"


@interface TaskLableTableViewCell()

@property(nonatomic, strong, readwrite) UILabel *titleLable;
@property(nonatomic, strong, readwrite) UILabel *timeLable;

@property(nonatomic, strong, readwrite) UIImageView *tempImageView;
@end

@implementation TaskLableTableViewCell

//初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview:({
            self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
            //self.titleLable.backgroundColor = [UIColor greenColor];
            self.titleLable.font = [UIFont systemFontOfSize:16];
            self.titleLable.textColor = [UIColor blackColor];
            self.titleLable;
        })];
        
        [self.contentView addSubview:({
            self.timeLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
            //self.timeLable.backgroundColor = [UIColor yellowColor];
            self.timeLable.font = [UIFont systemFontOfSize:12];
            self.timeLable.textColor = [UIColor grayColor];
            self.timeLable;
        })];
        
        [self.contentView addSubview:({
            self.tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(330, 15, 70, 70)];
            self.tempImageView.backgroundColor = [UIColor redColor];
                   //self.timeLable.backgroundColor = [UIColor yellowColor];
            self.tempImageView;
        })];
    }
    return self;
}

- (void) layoutTableViewCell{
    self.titleLable.text = @"text title";
    self.timeLable.text = @"1min";
    [self.timeLable sizeToFit];
}



@end
