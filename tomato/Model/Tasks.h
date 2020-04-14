//
//  Tasks.h
//  tomato
//
//  Created by 刘子祺 on 2020/4/11.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//任务数据
@interface Tasks : NSObject <NSSecureCoding>

-(instancetype) init:(NSString *) name withLength:(NSString *) length ;
- (void)encodeWithCoder:(NSCoder *)aCoderl;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder;
+ (BOOL)supportsSecureCoding;

@property(nonatomic, copy, readwrite) NSString *taskName;
@property(nonatomic, copy, readwrite) NSString *times;
@property(nonatomic, copy, readwrite) NSString *length;

@end

NS_ASSUME_NONNULL_END
