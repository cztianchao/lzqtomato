//
//  AddTask.m
//  tomato
//
//  Created by 刘子祺 on 2020/4/13.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import "AddTask.h"

@implementation AddTask

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
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
            _taskName = [[UITextField alloc]initWithFrame:CGRectMake(0,0,0,0)];
            _taskName.borderStyle = UITextBorderStyleRoundedRect;
            _taskName.alpha = 0;
            _taskName.backgroundColor = [UIColor whiteColor];
            _taskName.placeholder = @"任务名";
            _taskName;
        })];
        
        [self addSubview:({
            _length = [[UITextField alloc]initWithFrame:CGRectMake(0,0,0,0)];
            _length.borderStyle = UITextBorderStyleRoundedRect;
            _length.alpha = 0;
            _length.backgroundColor = [UIColor whiteColor];
            _length.placeholder = @"时长";
            _length;
        })];
       
        [self addSubview:({
            _editTitle = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
            _editTitle.alpha = 0;
            _editTitle.text = @"添加";
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
    }
    return self;
}

- (void)show{
    [[[[UIApplication sharedApplication] windows] objectAtIndex:0] addSubview:self];
    
    [UIView animateWithDuration:1.5f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.blankBackground.frame = CGRectMake(20,300, self.frame.size.width - 40,300);
        self.blankBackground.center = self.center;
    }completion:^(BOOL finished){
        //NSLog(@"s");
    }];
    
    [UIView animateWithDuration:1.5f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
           self.editTitle.frame = CGRectMake(40, 320, self.frame.size.width - 40,30);
        self.editTitle.alpha = 1;
       }completion:^(BOOL finished){
//           NSLog(@"s");
       }];
    
    [UIView animateWithDuration:1.5f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
           self.confrimButton.frame = CGRectMake(self.blankBackground.frame.origin.x + self.frame.size.width / 2 - 70, 510, 100, 30);
        self.confrimButton.alpha = 1;
       }completion:^(BOOL finished){
//           NSLog(@"s");
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
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
