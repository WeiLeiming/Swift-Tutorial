//: Playground - noun: a place where people can play

// Swift 3.1

import UIKit

var str = "Hello, playground"

// 模块和源文件
// 访问级别
// 开放访问->公开访问->文件私有访问->私有访问
// Open -> Public -> Internal -> File-private -> Private
// 访问级别基本原则
// 默认访问级别->internal
// 单目标应用程序的访问级别->internal
// 框架的访问级别
// 单元测试目标的访问级别
// @testable --- Build Options -> Enable Testability
// 访问控制语法
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}

// 自定义类型
public class SomePublicClass1 {                         // 显式公开类
    public var somePublicProperty = 0                   // 显式公开类成员
    var someInternalProperty = 0                        // 隐式内部类成员
    fileprivate func someFilePrivateMethod() {}         // 显式文件私有类成员
    private func somePrivateMethod() {}                 // 显式私有类成员
}

class SomeInternalClass1 {                              // 隐式内部类
    var someInternalProperty = 0                        // 隐式内部类成员
    fileprivate func someFilePrivateMethod() {}         // 显式文件私有类成员
    private func somePrivateMethod() {}                 // 显式私有类成员
}

fileprivate class SomeFilePrivateClass1 {               // 显式文件私有类
    func someFilePrivateMethod() {}                     // 隐式文件私有类成员
    private func somePrivateMethod() {}                 // 显式私有类成员
}

private class SomePrivateClass1 {                       // 显式私有类
    func somePrivateMethod() {}                         // 隐式私有类成员
}

// 元组类型
// 函数类型
/*
private func someFunction() -> (SomeInternalClass1, SomePrivateClass1) {
    
}
 */

// 枚举类型
public enum CompassPoint {
    case North
    case South
    case East
    case West
}

// 嵌套类型
// 子类
public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}

// 常量、变量、属性、下标
private var privateInstance = SomePrivateClass1()

// Getter和Setter
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")

public struct TrackedString1 {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}

// 构造器
// 必要构造器的访问级别必须和所属类型的访问级别相同
// 默认构造器
// 结构体默认的成员逐一构造器
// 协议
// 协议继承
// 协议一致性
// 扩展
// 通过扩展添加协议一致性
// 泛型
// 类型别名
