//
//  main.swift
//  SimpleCalc
//
//  Created by Brandon Chen on 3/29/17.
//  Copyright © 2017 Brandon Chen. All rights reserved.
//

import Foundation

//let response: String = readLine(strippingNewline: true)!

var args:[String] = []
var filename = ""
var method = ""
for argument in CommandLine.arguments {
    if(filename == "") {
        filename = argument
    } else if(method == "") {
        method = argument
    } else {
        args.append(argument)
    }
}
print("method is" + method)
print(args)

if(method == "+") {
    print(Double(args[0])! + Double(args[1])! )
} else if(method == "-") {
    print(Double(args[0])! - Double(args[1])! )
} else if(method == "*") {
    print( Double(args[0])! * Double(args[1])! )
} else if(method == "/") {
    print( Double(args[0])! / Double(args[1])! )
} else if(method == "%") {
    print( Double(args[0])!.truncatingRemainder(dividingBy:Double(args[1])! ))
} else if(method == "count") {
    print("The count is ", args.count)
} else if(method == "avg") {
    var max: Double = 0;
    for num in args {
        max += Double(num)!
    }
    if(max == 0) {
        print("0")
    } else {
        print(max / Double(args.count))
    }
} else if(method == "fact") {
    func factorial(n: Double) -> Double {
        if(n < 0) {
            return -1
        }
        if(n == 0) {
            return 1;
        }
        return n * factorial(n: n-1);
    }
    print(factorial(n: Double(args[0])!))
} else {
    print("Invalid") // shouldnt reach here
}


