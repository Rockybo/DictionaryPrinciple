//
//  CustomDictionary.h
//  CustomDictionaryWithArray
//
//  Created by bolin on 2018/3/13.
//  Copyright © 2018年 bolin. All rights reserved.
//  自定义字典

#import <Foundation/Foundation.h>

@interface CustomDictionary : NSObject

/** 构造方法 */
+ (instancetype)dictionary;

/** 赋值 */
- (void)setValue:(id)value forKey:(NSString *)key;

/** 根据键取值*/
- (id)valueForKey:(NSString *)key;

@end
