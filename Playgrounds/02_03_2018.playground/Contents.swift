//: Playground - noun: a place where people can play

import UIKit

func magicEightBall() {
    let randomNum = arc4random_uniform(UInt32(5))
    switch randomNum {
    case 0:
        print("Así las cosas deben ser")
    case 1:
        print("2 es más que 1")
    case 2:
        print("Cuenta con ello Whoody")
    case 3:
        print("Entonces ya no me dijo nada")
    case 4:
        print("Ya ferras ya estuvo")
    default:
        print("Este lado nunca debería salir")
    }
}
