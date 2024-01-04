//
//  Expenses.swift
//  ExpenseTracker
//
//  Created by Evelyn Morado on 1/3/24.
//

import SwiftUI

struct Expenses: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
    var amount: Double
    var date: Date
    var color: String
}

var ExpenseList: [Expenses] = [
    Expenses(name: "Cat food", amount: 20.10, date: Date(timeIntervalSince1970: 1704226140), color: "Orange"),
    Expenses(name: "Gas", amount: 24.37, date: Date(timeIntervalSince1970: 1704223380), color: "Purple"),
    Expenses(name: "Groceries", amount: 73.69, date: Date(timeIntervalSince1970: 1704221640), color: "Gray"),
    Expenses(name: "Car Wash", amount: 8.07, date: Date(timeIntervalSince1970: 1704127020), color: "Green"),
    Expenses(name: "Ulta", amount: 94.71, date: Date(timeIntervalSince1970: 1704123780), color: "Pink"),
    Expenses(name: "Netflix", amount: 13.50, date: Date(timeIntervalSince1970: 1704087000), color: "Blue")

]
