//
//  CustomDictionary.m
//  CustomDictionaryWithArray
//
//  Created by bolin on 2018/3/13.
//  Copyright © 2018年 bolin. All rights reserved.
//

#import "CustomDictionary.h"
#import "LinkedArray.h"

// key value缓存
@interface KeyValueCache : NSObject

@property (nonatomic, copy) NSString *key;
@property (nonatomic, strong) id value;

@end

@implementation KeyValueCache

+ (instancetype)key:(NSString *)key value:(id)value {
    KeyValueCache *model = [[self alloc] init];
    model.key = key;
    model.value = value;
    return model;
}
@end

@implementation CustomDictionary {
    LinkedArray *_keyValues[999];
}

+ (instancetype)dictionary {
    return [[self alloc] init];
}

- (void)setValue:(id)value forKey:(NSString *)key {
    // 获取hashCode
    NSUInteger hash = key.hash;
    // 默认一个对象占用8个字节
    NSUInteger realCode = hash % (sizeof(_keyValues) / 8);
    
    LinkedArray *linkArr = _keyValues[realCode];
    // 如果存在链表数组
    if (linkArr) {
        for (NSInteger index = 0; index < linkArr.size; index ++) {
            KeyValueCache *keyValue = (KeyValueCache *)[linkArr objectAtIndex:index];
            // 如果存在相同的key，更新value
            if ([keyValue.key isEqualToString:key]) {
                // 重新赋值value
                keyValue.value = value;
                return;
            }
        }
        
        // 创建新的键值对存储
        KeyValueCache *newkeyValue = [KeyValueCache key:key value:value];
        [linkArr addObject:newkeyValue];
    } else { // 不存在链表数组
        // 创建新的链表数组
        LinkedArray *newlinkArray = [LinkedArray array];
        KeyValueCache *newkeyValue = [KeyValueCache key:key value:value];
        [newlinkArray addObject:newkeyValue];
        _keyValues[realCode] = newlinkArray;
        
    }
}

- (id)valueForKey:(NSString *)key {
    if (!key.length) return nil;
    
    // 获取hashCode
    NSUInteger hash = key.hash;
    NSUInteger realCode = hash % (sizeof(_keyValues) / 8);
    
    LinkedArray *linkArr = _keyValues[realCode];
    if (linkArr) {
        // 遍历链表，取出value
        for (NSInteger index = 0; index < linkArr.size; index ++) {
            KeyValueCache *keyvalue = (KeyValueCache *)[linkArr objectAtIndex:index];
            if ([keyvalue.key isEqualToString:key]) {
                return keyvalue.value;
            }
        }
    }
    return nil;
}

@end
