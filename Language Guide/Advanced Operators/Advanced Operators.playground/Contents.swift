//: Playground - noun: a place where people can play

// Swift 3.1

import UIKit

var str = "Hello, playground"

// 位运算符
// 按位取反运算符
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits

// 按位与运算符
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits

// 按位或运算符
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits

// 按位异或运算符
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits

// 按位左移、右移运算符
// 无符号整数的位移运算
let shiftBits: UInt8 = 4   // 00000100
shiftBits << 1             // 00001000
shiftBits << 2             // 00010000
shiftBits << 5             // 10000000
shiftBits << 6             // 00000000
shiftBits >> 2             // 00000001

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16      // redComponent is 0xCC, or 204
let greenComponent = (pink & 0x00FF00) >> 8     // greenComponent is 0x66, or 102
let blueComponent = pink & 0x0000FF             // blueComponent is 0x99, or 153

// 有符号整数的移位运算
// 补码：正整数的补码是其二进制表示，与原码相同。负整数的补码，将其对应正数二进制表示所有位取反（包括符号位，0变1，1变0）后加1

// 溢出运算符
var potentialOverflow = Int16.max
//potentialOverflow += 1

// &+, &- ,&*

// 数值溢出
var unsignedOverflow = UInt8.max
unsignedOverflow = unsignedOverflow &+ 1

var unsignedOverflow1 = UInt8.min
unsignedOverflow1 = unsignedOverflow1 &- 1

var signedOverflow = Int8.min
signedOverflow = signedOverflow &- 1

// 优先级和结合性

// 运算符函数
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
print(combinedVector)

// 前缀和后缀运算符
extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
print(negative)
let alsoPositive = -negative
print(alsoPositive)

// 复合赋值运算符
extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
print(original)

// 等价运算符
extension Vector2D {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
    static func != (left: Vector2D, right: Vector2D) -> Bool {
        return !(left == right)
    }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vetors are equivalent.")
}

// 自定义运算符
prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
print(afterDoubling)

// 自定义中缀运算符的优先级
infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
print(plusMinusVector)

// Swift Standard Library Operators --> https://developer.apple.com/reference/swift/swift_standard_library_operators#//apple_ref/doc/uid/TP40016054
