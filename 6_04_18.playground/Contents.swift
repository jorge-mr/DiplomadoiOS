//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

typealias myFunction = (String) -> ()


//creador de funciones
func repeatPrint(times: Int) -> myFunction {
    func printer(text: String) {
        for _ in 1...times{
            print(text)
        }
    }
    return printer
}

let log = repeatPrint(times: 5)
log("Hola!")


var sumaBonita : (Int, Int) -> Int = {$0 + $1}
