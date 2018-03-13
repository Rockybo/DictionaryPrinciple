//
//  LinkedArray.m
//  CustomDictionaryWithArray
//
//  Created by bolin on 2018/3/13.
//  Copyright © 2018年 bolin. All rights reserved.
//

#import "LinkedArray.h"
@interface LinkedArray ()

@property (nonatomic, strong) Node *first; // 首个节点
@property (nonatomic, strong) Node *last; // 最后节点

@end

@implementation LinkedArray

- (void)addObject:(NSObject *)obj {
    if (!obj) return;
    _size++;
    
    Node *node = [[Node alloc] init];
    // 首个节点为空
    if (!_first) {
        _first = node;
        _last = node;
        node.previous = nil;
        node.next     = nil;
        node.content  = obj;
        return;
    }
    
    // 数组中有值
    node.previous = _last;
    node.next     = nil;
    node.content  = node;
    _last         = node;
    _last.next    = node;
    
}

- (void)remove:(NSObject *)obj {
    if (!obj || !_size) return;
    
    Node *tmpNode = _first;
    
    for (NSInteger index = 0; index < _size; index++) {
        if ([tmpNode.content isEqual:obj]) {
            [self removeNode:tmpNode]; // 移除节点
            break;
        }
    }
}

- (void)removeAtIndex:(NSInteger)index {
    if (index < 0 || index >= _size) return;
    
    Node *tmpNode = _first;
    
    for (NSInteger i = 0; i < _size; i++) {
        if (i == index) {
            [self removeNode:tmpNode];
            break;
        }
        tmpNode = tmpNode.next;
    }
}

- (NSObject *)objectAtIndex:(NSInteger)index {
    if (index < 0 || index >= _size) return nil;
    
    Node *tmpNode = _first;
    
    for (NSInteger i = 0; i < _size; i++) {
        if (i == index) {
            return tmpNode.content;
        }
        tmpNode = tmpNode.next;
    }
    return nil;
}

#pragma mark 私有方法
- (void)removeNode:(Node *)node {
    Node *preNode     = node.previous;
    Node *nextNode    = node.next;
    preNode.next      = nextNode;
    nextNode.previous = preNode;
    node.content      = nil; // 清空被移除节点内容
    _size -- ; // 长度更新
}

+ (instancetype)array {
    return [[self alloc] init];
}

@end

@implementation Node
@end
