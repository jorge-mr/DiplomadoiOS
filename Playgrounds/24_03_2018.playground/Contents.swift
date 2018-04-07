//: Playground - noun: a place where people can play

import UIKit


//let main = DispatchQueue.main
//let background = DispatchQueue.global()
//
//func doSyncWork(){
//    background.async {
//        for _ in 1...3{
//            print("light")
//        }
//    }
//
//    for _ in 1 ... 3 {
//        print("heavy")
//    }
//}
//
//doSyncWork()


/////////////////



//let asianWorker = DispatchQueue(label: "construction_worker_1")
//let brownWorker = DispatchQueue(label: "construction_worker_2")
//
//func doLightWork(){
//    asianWorker.async {
//        for _ in 1...10{
//            print("👨🏼‍🌾")
//        }
//    }
//    brownWorker.async {
//        for _ in 1...10{
//            print("👨🏾‍🌾")
//        }
//    }
//}
//
//doLightWork()


/////////////////


//let whiteWorker = DispatchQueue(label: "construction_worker_3", qos: .userInitiated)
//let brownWorker = DispatchQueue(label: "construction_worker_4", qos: .userInteractive)
//
//func doLightWork(){
//    whiteWorker.async {
//        for _ in 1...10{
//            print("👨🏻‍🌾")
//        }
//    }
//    brownWorker.async {
//        for _ in 1...10{
//            print("👨🏾‍🌾")
//        }
//    }
//}
//
//doLightWork()

////////////////////

//protocol Person {
//    var firstName : String {get set}
//    init(firstName: String)
//}
//
//var personArray = [Person]()
//var personDict = [String:Person]()
//
//struct Teacher : Person {
//    var firstName: String
//
//    init(firstName: String) {
//        self.firstName = firstName
//    }
//
//
//}
//
//struct Student : Person {
//    var firstName: String
//
//    init(firstName: String) {
//        self.firstName = firstName
//    }
//}
//
//var profesor = Teacher(firstName: "Luis")
//var alumno = Student(firstName: "Parra")
//
//var academicos: [Person] = []
//
//academicos.append(alumno)
//academicos.append(profesor)
//
//var myPerson : Person
//myPerson = Student(firstName: "Parra")
//myPerson = Teacher(firstName: "Luis")
//
//print("Mis academicos son:")
//for academico in academicos {
//    print(academico.firstName)
//}
//
//for academico in academicos where academico is Teacher {
//    print("Hay un profe y se llama: ",academico.firstName)
//}


///////////////


//protocol DisplayNameDelegate {
//    func displayName(name: String)
//}
//
//struct Person {
//    var displayNameDelegate : DisplayNameDelegate
//    var firstName = "" {
//        didSet {
//            displayNameDelegate.displayName(name: getFullName())
//        }
//    }
//    var lastName = "" {
//        didSet {
//            displayNameDelegate.displayName(name: getFullName())
//        }
//    }
//
//    init(displayNameDelegate: DisplayNameDelegate){
//        self.displayNameDelegate = displayNameDelegate
//    }
//
//    func getFullName() -> String {
//        return firstName + lastName
//    }
//}
//
//struct MyDisplayNameDelegate : DisplayNameDelegate {
//    func displayName(name: String) {
//        print("Name:",name)
//    }
//}
//
//var displayDelegate = MyDisplayNameDelegate()
//var person = Person(displayNameDelegate: displayDelegate)
//person.firstName = "Jon"
//person.lastName = "Hoffman"


//////////////////////


protocol Queue {
    associatedtype QueueType //Variable de cualquier tipo, generica pues
    func addItem(item: QueueType)
    func getItem() -> QueueType?
    func count() -> Int
}

struct IntQueue : Queue {
    
    var items = [Int]()
    
    func addItem(item: IntQueue.QueueType) {
        items.append(item)
    }
    typealias QueueType = <#type#>
    
    
}
