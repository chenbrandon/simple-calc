#!/usr/bin/swift
//
//  main.swift
//  SimpleCalc
//
//  Created by Brandon Chen on 3/29/17.
//  Copyright © 2017 Brandon Chen. All rights reserved.
//

import Foundation


/* Handles command line arguments
 * Examples call:
 * $ ./main.swift fact 13
 * $ ./main.swift + 4 -2.39
 * $ ./main.swift % -49.8 -3.98
 * $ ./main.swift avg 99 99 99 99 -99 49 3 3.49
 * $ ./main.swift count 99 99 99 99 -99 49 3 3.49
 */
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
func add(a: Double, b: Double) {
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
func count(a: [Any]) {
    print(a.count)
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
    let c = Double(a.count)
    var sum: Double = 0;
    for n in a {
        
        sum += Double(n.trimmingCharacters(in: .whitespaces))!
    }
    print(sum / c)
}


// Start here
if(method != "") { // User invoke script with command arguments, ex: $ ./main.swift + -39 3.49
    if(method == "+") {
        add(a: Double(args[0])!, b: Double(args[1])! )
    } else if(method == "-") {
        sub(a: Double(args[0])!, b: Double(args[1])! )
    } else if(method == "*") {
        mult(a: Double(args[0])!, b: Double(args[1])! )
    } else if(method == "/") {
        div(a: Double(args[0])!, b: Double(args[1])! )
    } else if(method == "%") {
        mod(a: Double(args[0])!, b: Double(args[1])! )
    } else if(method == "count") {
        count(a: args)
    } else if(method == "avg") {
        avg(a: args)
    } else if(method == "fact") {
        print(fact(n: Double(args[0])!))
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
    let num1: String = readLine(strippingNewline: true)!
    let res1: String = readLine(strippingNewline: true)!
    if(res1 == "fact") {
        print(fact(n: Double(num1)!))
    } else if(res1 == "count") {
        print(1)
    } else if(res1 == "avg") {
        print(Double(num1)!)
    }else if(res1 == "+" || res1 == "-" || res1 == "/" || res1 == "%" || res1 == "*") {
        let num2: String = readLine(strippingNewline: true)!
        if(res1 == "+") {
            add(a: Double(num1)!, b: Double(num2)!)
        } else if(res1 == "-") {
            sub(a: Double(num1)!, b: Double(num2)!)
            
        }else if(res1 == "/") {
            div(a: Double(num1)!, b: Double(num2)!)
            
        }else if(res1 == "%") {
            mod(a: Double(num1)!, b: Double(num2)!)
            
        }else if(res1 == "*") {
            mult(a: Double(num1)!, b: Double(num2)!)
        }
    } else { // keep interrogating until operand
        var nums: [String] = [num1, res1]
        var next: String = ""
        repeat {
            next = readLine(strippingNewline: true)!
            if(next != "count" && next != "avg") {
                nums.append(next)
            }
        } while(next != "count" && next != "avg")
        if(next == "count") {
            count(a: nums)
        } else {
            avg(a: nums)
        }
    }
}
