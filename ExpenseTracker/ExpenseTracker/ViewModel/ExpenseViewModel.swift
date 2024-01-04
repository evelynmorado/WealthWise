//
//  ExpenseViewModel.swift
//  ExpenseTracker
//
//  Created by Evelyn Morado on 1/3/24.
//

import SwiftUI

class ExpenseViewModel: ObservableObject {
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()
    @Published var currentMonthStartDate: Date = Date()
    @Published var newExpense: Bool = false
    @Published var amount: String = ""
    @Published var name: String = ""
    @Published var date: Date = Date()
    init() {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year,.month], from: Date())
        startDate = calendar.date(from: components)!
        currentMonthStartDate = calendar.date(from: components)!
    }
    @Published var expenseslist: [Expenses] = ExpenseList
    func currentDateString()-> String {
        return currentMonthStartDate.formatted(date: .abbreviated, time: .omitted) + " - " + Date().formatted(date: .abbreviated, time: .omitted)
    }
    func expensesToCurrency(expenseslist: [Expenses])->String {
        var value: Double = 0
        value = expenseslist.reduce(0, { partialResult, expense in
            return partialResult + expense.amount
        })
        
        return numberToPrice(value: value)
    }
    func numberToPrice(value: Double)->String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: .init(value: value)) ?? "$0.00"
    }
    
    func clear() {
        date = Date()
        name = ""
        amount = ""
    }
    
    func save(env: EnvironmentValues){
        print("Save")
        let amountAsDouble = (amount as NSString).doubleValue
        let colors = ["Pink", "Blue", "Orange", "Purple"]
        let expense = Expenses(name: name, amount: amountAsDouble, date: date, color: colors.randomElement() ?? "Pink")
        withAnimation{expenseslist.append(expense)}
        expenseslist = expenseslist.sorted(by: { first, scnd in
            return scnd.date < first.date
        })
        env.dismiss()
    }
}

