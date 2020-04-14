//
//  AddTask.h
//  tomato
//
//  Created by 刘子祺 on 2020/4/13.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddTask : UIView
@property(nonatomic, strong, readwrite) UIView *backgroundView;
@property(nonatomic, strong, readwrite) UIView *blankBackground;
@property(nonatomic, strong, readwrite) UIButton *confrimButton;
@property(nonatomic, strong, readwrite) UILabel *editTitle;
@property(nonatomic, strong, readwrite) UITextField *taskName;
@property(nonatomic, strong, readwrite) UITextField *length;

- (void)show;

@end

NS_ASSUME_NONNULL_END
