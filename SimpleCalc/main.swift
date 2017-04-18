#!/usr/bin/swift
//
//  main.swift
//  SimpleCalc
//
//  Created by Brandon Chen on 3/29/17.
//  Copyright © 2017 Brandon Chen. All rights reserved.
//

import Foundation

var args:[String] = []
var filename = "" // the filename is the first argument
var method = ""   // the method name should be the second argument
for argument in CommandLine.arguments { // the remaining arguments
    if(filename == "") {
        filename = argument
    } else if(method == "") {
        method = argument
    } else {
        args.append(argument)
    }
}

// Calculator functions
func add(a: Double, b: Double){
    print(a + b)
}
func sub(a: Double, b: Double) {
    print(a - b)
}
func mult(a: Double, b: Double) {
    print(a * b)
}
func div(a: Double, b: Double) {
    print(a / b)
}
func mod(a: Double, b: Double) {
    print(a.truncatingRemainder(dividingBy: b))
}
func fact(n: Double) -> Double {
    if(n < 0) {
        return -1
    }
    if(n == 0) {
        return 1;
    }
    return n * fact(n: n-1);
}
func avg(a: [String]) {
    avg2(a: a, b: true)
}
func count(a: [String]) {
    avg2(a: a, b: false)
}

// a: [String]  The array to find the average count of
// b: Bool      Whether the average or count is printed
func avg2(a: [String], b: Bool) {
    let c = Double(a.count)
    var sum: Double = 0;
    for n in a {
        if let x = Double(n) {
            sum += x
        } else {
            print("Entered an invalid number inside of expression")
            return
        }
    }
    if(b) {
        print(sum / c)
    } else {
        print(c)
    }
}

let operations: [String] = ["+", "-", "/", "%", "*"]
// Start here
if(method != "") { // User invoke script with command arguments, ex: $ ./main.swift + -39 3.49
    if(args.count == 0) {
        print("You did not enter any numbers")
    } else if(operations.contains(method) && args.count != 2) {
        print("The operation you selected only accepts two numbers")
    } else if(method == "fact" && args.count != 1) {
        print("Fact can only accept one number")
    } else if(operations.contains(method)) {
        if let a = Double(args[0]), let b = Double(args[1]) {
            if(method == "+") {
                add(a: a, b: b)
            } else if(method == "-") {
                sub(a: a, b: b)
            } else if(method == "*") {
                mult(a: a, b: b)
            } else if(method == "/") {
                div(a: a, b: b)
            } else if(method == "%") {
                mod(a: a, b: b)
            }
        } else {
            print("Entered invalid values")
        }
    } else if(method == "count") {
        count(a: args)
    } else if(method == "avg") {
        avg(a: args)
    } else if(method == "fact") {
        if let a = Double(args[0]) {
            print(fact(n: a))
        } else {
            print("Entered invalid values")
        }
    } else { // Offer help text to client
        print("It looks like you are trying to call this program with command line arguments")
        print("This feature requires that you enter in the arguments in a specific format")
        print("Operation first (\"+\", \"-\",\"/\",\"*\",\"%\",\"fact\",\"avg\", \"count\")")
        print("Followed by the number(s)")
        print("Here are some examples")
        print("$ ./main.swift fact 13")
        print("$ ./main.swift + 4 -2.39")
        print("$ ./main.swift % -49.8 -3.98")
        print("$ ./main.swift avg 99 99 99 99 -99 49 3 3.49")
        print("$ ./main.swift count 99 99 99 99 -99 49 3 3.49")
    }
} else { // user did not use command line arguments, prompt user
    print("Enter an expression separated by returns")
    let num1: String = readLine(strippingNewline: true)!.trimmingCharacters(in: .whitespaces)
    let res1: String = readLine(strippingNewline: true)!.trimmingCharacters(in: .whitespaces)
    if(res1 == "fact") {
        if let a = Double(num1) {
            print(fact(n: a))
        } else {
            print("Invalid number")
        }
    } else if(res1 == "count") {
        print(1)
    } else if(res1 == "avg") {
        if let a = Double(num1) {
            print(a)
        } else {
            print("Invalid number")
        }
    } else if(operations.contains(res1)) {
        let num2: String = readLine(strippingNewline: true)!.trimmingCharacters(in: .whitespaces)
        if let a = Double(num1), let b = Double(num2) {
            if(res1 == "+") {
                add(a: a, b: b)
            } else if(res1 == "-") {
                sub(a: a, b: b)
            } else if(res1 == "/") {
                div(a: a, b: b)
            } else if(res1 == "%") {
                mod(a: a, b: b)
            } else if(res1 == "*") {
                mult(a: a, b: b)
            }
        } else {
            print("Invalid expression entered")
        }
    } else { // keep interrogating until operand
        var nums: [String] = [num1, res1]
        var next: String = ""
        repeat {
            next = readLine(strippingNewline: true)!.trimmingCharacters(in: .whitespaces)
            if(operations.contains(next)) {
                print("You can only select this operation in between two numbers")
                break
            } else if(next == "fact") {
                print("fact only accepts one number")
                break
            } else if(next != "count" && next != "avg") {
                nums.append(next)
            }
        } while(next != "count" && next != "avg")
        if(next == "count") {
            count(a: nums)
        } else if(next == "avg") {
            avg(a: nums)
        }
    }
}
