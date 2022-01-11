import UIKit

/* 1. Решить квадратное уравнение. */

let a:Double = 2
let b:Double = 4
let c:Double = 2
let x:Double
let x1:Double
let x2:Double
var d:Double
d = pow(b,2) - (4 * a * c)
if (d > 0) {
    x1 = (-b + sqrt(d)) / (2 * a)
    x2 = (-b - sqrt(d)) / (2 * b)
    print("x1 = \(x1), x2 = \(x2)")
} else if (d == 0) {
    x = -b / (2 * a)
    print("x = \(x)")
}

/* 2. Даны катеты прямоугольного треугольника.
 Найти площадь, периметр и гипотенузу треугольника. */

let a1: Float = 3
let b1: Float = 3
let s1: Float
let p1: Float
let c1: Float

s1 = 0.5 * 1 * b1
print("Площадь треугольника = \(s1)")

c1 = sqrt(pow(a1, 2) + pow(b1, 2))
print("Гипотенуза треугольника = \(c1)")

p1 = a1 + b1 + c1
print("Периметр треугольника = \(p1)")

/* 3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет. */

let deposit: Float = 100000.0
let persent: Float = 6.5
let years: Int = 5
let daysInYears: Float = 365 * Float(years)


let sum: Float

sum = deposit + (deposit * persent * daysInYears / 365) / 100
print("Cумму вклада через \(years) лет составит \(sum)₽")
