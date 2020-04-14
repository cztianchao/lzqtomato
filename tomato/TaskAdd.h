//
//  TaskAdd.h
//  tomato
//
//  Created by 刘子祺 on 2020/4/9.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tasks.h"

NS_ASSUME_NONNULL_BEGIN

@protocol deleteDelegate <NSObject>

-(void) reloadView;

@end

@interface TaskAdd : UIView
-(instancetype)initWithFrame:(CGRect)frame withArray:(NSArray<Tasks *> *)list withID:(int)cellid;
- (void)show;
@property (nonatomic, assign) id<deleteDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
