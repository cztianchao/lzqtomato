//
//  Tasks.m
//  tomato
//
//  Created by 刘子祺 on 2020/4/11.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import "Tasks.h"

@implementation Tasks
-(instancetype) init:(NSString *) name  withLength:(NSString *) length  {
    self.taskName = name;
    self.length = length;
    self.times = @"0";
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.taskName forKey:@"taskName"];
    [aCoder encodeObject:self.times forKey:@"times"];
    [aCoder encodeObject:self.length forKey:@"length"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        self.taskName = [aDecoder decodeObjectForKey:@"taskName"];
        self.times = [aDecoder decodeObjectForKey:@"times"];
        self.length = [aDecoder decodeObjectForKey:@"length"];
    }
    return self;
} // NS_DESIGNATED_INITIALIZER

+ (BOOL)supportsSecureCoding{
    return YES;
}
@end
