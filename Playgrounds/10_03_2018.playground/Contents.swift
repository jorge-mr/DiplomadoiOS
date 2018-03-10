//: Playground - noun: a place where people can play

import UIKit

//enum Dia {
//    case Lunes
//    case Martes
//    case Miercoles
//    case Jueves
//    case Viernes
//}
//
//var diaSemana: Dia = .Lunes
////diaSemana = .Lunes
//
//switch diaSemana {
//case .Lunes:
//    print("es lunes")
//default:
//    print("otro dia de la semana")
//}


//enum EstadoDocumento : Int {
//    case Recibido = 0, Valido, EnProceso, Publicado
//}
//
//let valorEstado = EstadoDocumento.Valido.rawValue
//let estado = EstadoDocumento(rawValue: 1)
//if let estado_2 = EstadoDocumento(rawValue: 7) {
//    print("existe")
//}else{
//    print("no existe")
//}


//enum ResultadoWebService {
//    case Exito(String)
//    case Error(Int)
//}
//
//func llamadaWS() -> ResultadoWebService {
//    if false {
//        return ResultadoWebService.Exito("Mi contenido")
//    }else{
//        return ResultadoWebService.Error(502)
//    }
//}
//
//let resultado : ResultadoWebService = llamadaWS()
//
//switch resultado {
//case let .Exito(contenido):
//    print(contenido)
//case let .Error(codigo):
//    print("elcodigo de error es",codigo)
//}



//Empleado
//sueldo
//descuentos
//iva = 16%

class Empleado {
    let iva : Double = 0.16
    var sueldo : Double {
        willSet{
            if newValue <= 0 {
                print("Nooooo")
            }
        }
    }
    var descuentos : Double
    
    
    init(sueldo: Double, descuentos: Double) {
        self.sueldo = sueldo * (1 - iva)
        self.descuentos = descuentos
    }
}

let german = Empleado(sueldo: 10_000, descuentos: 2_000)
dump(german)

german.sueldo -= 100_000

dump(german)















