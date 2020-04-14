//
//  FinishNotice.h
//  tomato
//
//  Created by 刘子祺 on 2020/4/10.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FinishNotice : UIView 
- (void)show;

@property(nonatomic, strong, readwrite) UIView *backgroundView;
@property(nonatomic, strong, readwrite) UIView *blankBackground;
@property(nonatomic, strong, readwrite) UIButton *confrimButton;
@property(nonatomic, strong, readwrite) UILabel *editTitle;
@property(nonatomic, strong, readwrite) UILabel *notice;

@end

NS_ASSUME_NONNULL_END
