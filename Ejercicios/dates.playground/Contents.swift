//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let todaydate = Date()
let todayString = "\(todaydate)"
print("todayString",todayString)
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
let dateSting = dateFormatter.string(from: todaydate)
print("dateSting",dateSting)
let dateString = dateFormatter.date(from: dateSting)
print("date: ",dateString)
