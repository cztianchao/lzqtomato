//
//  CollectionViewController.h
//  tomato
//
//  Created by 刘子祺 on 2020/4/8.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol reloadViewDelegate <NSObject>
-(void) rel;
@end

@interface CollectionViewController : UIViewController
@property (nonatomic, assign) id<reloadViewDelegate> delegate;
@end



NS_ASSUME_NONNULL_END
