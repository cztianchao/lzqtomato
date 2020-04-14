//
//  CountdownView.h
//  tomato
//
//  Created by 刘子祺 on 2020/4/10.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 *  开始倒计时
 */
typedef void (^CountDownStartBlock)(void);
/**
 *  倒计时完成
 */
typedef void (^CountDownCompleteBlock)(void);

@interface CountdownView : UIView

@property (assign, nonatomic)BOOL isCountingDown;
//-(instancetype)initWithFrame:(CGRect)frame  totalTime:(NSInteger)totalTime lineWidth:(CGFloat)lineWidth  lineColor:(UIColor *)lineColor completeBlock:(CountDownCompleteBlock)completeBlock;
-(instancetype)initWithFrame:(CGRect)frame  totalTime:(NSInteger)totalTime lineWidth:(CGFloat)lineWidth  lineColor:(UIColor *)lineColor startBlock:(CountDownStartBlock)startBlock completeBlock:(CountDownCompleteBlock)completeBlock;

-(void)startCountDown;

@end

NS_ASSUME_NONNULL_END
