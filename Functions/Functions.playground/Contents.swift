//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 函数的定义与调用
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))

// 函数参数与返回值
// 无参数函数
func sayHelloWorld() -> String {
    return "Hello, world"
}
print(sayHelloWorld())

// 多参数函数
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))

// 无返回值函数
func greet1(person: String) {
    print("Hello, \(person)!")
}
greet1(person: "Dave")

func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

// 多重返回值函数
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var curremtMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > curremtMax {
            curremtMax = value
        }
    }
    return (currentMin, curremtMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

// 可选元祖返回类型
func minMax1(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var curremtMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > curremtMax {
            curremtMax = value
        }
    }
    return (currentMin, curremtMax)
}

if let bounds = minMax1(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

// 函数参数标签和参数名称
