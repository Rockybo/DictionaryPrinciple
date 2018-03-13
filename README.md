# DictionaryPrinciple
Objective-C字典底层实现模拟（数组 + 双向链表）
## 字典底层实现
###### 概述
Objective-C中的字典实际上为一个数组 ， 数组中的每个元素同样为一个链表实现的数组 ，也就是数组中套数组。
###### 语言
Objective-C
###### 工具
Xcode9.0+
###### 为什么要这么设计 ？
    1、每个对象创建时，都默认生成一个hashCode ,也就是一个经过哈希算法生成的一串数字 。当利用key去取字典中的value时，若是使用遍历或者二分查找等方法，效率都相对较低 ，于是出现了根据每个key生成的hashCode将该键值对放到hashCode对应的数组中的指定位置，这样当用key去取值时，便不必遍历去获取，即可以根据hashCode直接取出
    2、hashCode数字过大，或许会经过取余生成一个较小的数字，假如是对999取余，那么得到的结果始终处于0-999之间。但是，这样做的弊端在于取余所得到的值，可能是相同的，这样可能导致完全不相干的键值对被新的键值对（取余后值key相等）所覆盖。于是出现了数组中套链表实现的数组。这样，key值取余得到值相等的键值对，都将保存在同一个链表数组中，当查找key对应的值时，首先获取到该链表数组，然后遍历该数组，取正确的key所对应的值即可
###### 哈希表的概述
    Objective-C 中的字典 NSDictionary 底层其实是一个哈希表，实际上绝大多数语言中字典都通过哈希表实现。
    哈希表的本质是一个数组，数组中每一个元素称为一个箱子(bin)，箱子中存放的是键值对。
###### 哈希表的存储过程
    1、根据 key 计算出它的哈希值 h
    2、假设箱子的个数为 n，那么这个键值对应该放在第 (h % n) 个箱子中
    3、如果该箱子中已经有了键值对，就使用开放寻址法或者拉链法解决冲突
【深入理解哈希表】(https://www.cnblogs.com/chinajava/p/5808416.html)
