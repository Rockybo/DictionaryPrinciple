//
//  LinkedArray.h
//  CustomDictionaryWithArray
//
//  Created by bolin on 2018/3/13.
//  Copyright © 2018年 bolin. All rights reserved.
//  链表实现的数组

#import <Foundation/Foundation.h>

@interface LinkedArray : NSObject

/** 数组长度 */
@property (nonatomic, assign) NSUInteger size;

/** 添加元素 */
- (void)addObject:(NSObject *)obj;

/** 移除指定元素 */
- (void)remove:(NSObject *)obj;

/** 移除指定索引元素 */
- (void)removeAtIndex:(NSInteger)index;

/** 获取指定位置的值 */
- (NSObject *)objectAtIndex:(NSInteger)index;

/** 数组初始化 */
+ (instancetype)array;

@end

// 节点对象
@interface Node : NSObject

/** 上个节点 */
@property (nonatomic, strong) Node *previous;

/** 下个节点 */
@property (nonatomic, strong) Node *next;

/** 当前节点内容 */
@property (nonatomic, strong) id content;

@end

