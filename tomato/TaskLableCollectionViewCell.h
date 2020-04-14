//
//  TaskLableCollectionViewCell.h
//  tomato
//
//  Created by 刘子祺 on 2020/4/8.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tasks.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TaskViewCellDelegate <NSObject>

- (void)collectionViewCell:(UICollectionViewCell *)collectionViewCell clickEditButton:(UICollectionViewCell *)editButton;

@end

@protocol reloadDelegate <NSObject>

-(void) refreshIt;

@end

@interface TaskLableCollectionViewCell : UICollectionViewCell
- (void)addwithArray:(NSArray<Tasks *> *)list withID:(int) cellID;
- (void) layoutcTableViewCell:(NSString *) name withLength:(NSString *) length;

@property (nonatomic, readwrite) int cellID;

@property(nonatomic, strong, readwrite) UILabel *titleLable;

@property(nonatomic, strong, readwrite) NSArray<Tasks *> *list;

@property(nonatomic, strong, readwrite) UILabel *timeLable;

@property(nonatomic, strong, readwrite) UIImageView *tempImageView;
@property(nonatomic, strong, readwrite) UIButton *startButton;

@property(nonatomic, weak, readwrite) id<TaskViewCellDelegate> delegate;
@property (nonatomic, assign) id<reloadDelegate> delegate1;


@end

NS_ASSUME_NONNULL_END
