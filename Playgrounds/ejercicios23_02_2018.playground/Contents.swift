//: Playground - noun: a place where people can play

import UIKit



//teorema de wilson Numeros primos
func esPrimo(num: Int){
    let newNum = fact(num: num - 1) + 1
    if (newNum % num) == 0 {
        print("es primo")
    }else {
        print("no es primo")
    }
    print(newNum%num)
}

func fact(num: Int) -> Int {
    if num == 0 {
        return 1
    } else {
        return num * fact(num: num - 1)
    }
}
print(fact(num: 3))
esPrimo(num: 7)

//fibonachi 1000

func fibonacci(num: Int) -> Int {
    if num < 2 {
        return num
    } else {
        return fibonacci(num: num - 1) + fibonacci(num: num - 2)
    }
}

print(fibonacci(num: 5))


//palindromo

func palindromo(pal: String) -> Bool {
   return String(pal.reversed()) == pal
}

palindromo(pal: "hola")

//dos cadenas y comparar si tienen los mismos caracteres
func sameCharacters(first: String, second: String) -> Bool{
    if first.count == second.count {
        for i in first {
            if !second.contains(i) {
                return false
            }
        }
        return true
    }else{
        return false
    }
}
sameCharacters(first: "romo", second: "roma")

func german(cad1 : String, cad2: String) -> Bool {
    return cad1.count == cad2.count && cad1.sorted() == cad2.sorted()
}


german(cad1: "omor", cad2: "roma")
