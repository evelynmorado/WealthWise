//
//  ExpenseViewModelTests.swift
//  ExpenseTracker
//
//  Created by Evelyn Morado on 1/3/24.
//

import XCTest

class ExpenseViewModelTests: XCTestCase {
    
    var expenseViewModel: ExpenseViewModel!
    
    override func setUp() {
        super.setUp()
        expenseViewModel = ExpenseViewModel()
    }

    override func tearDown() {
        expenseViewModel = nil
        super.tearDown()
    }
    
    func testCurrentDateString() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM - YYYY"
        
        XCTAssertEqual(expenseViewModel.currentDateString(), dateFormatter.string(from: currentDate) + " - " + dateFormatter.string(from: currentDate))
    }
    
    func testExpensesToCurrency() {
        let expenses = [
            Expenses(name: "Expense1", amount: 20.0, date: Date(), color: "Blue"),
            Expenses(name: "Expense2", amount: 30.0, date: Date(), color: "Pink")
        ]
        
        XCTAssertEqual(expenseViewModel.expensesToCurrency(expensesList: expenses), "$50.00")
    }
    
    func testNumberToPrice() {
        XCTAssertEqual(expenseViewModel.numberToPrice(value: 25.5), "$25.50")
    }
    
    func testClear() {
        expenseViewModel.clear()
        XCTAssertEqual(expenseViewModel.name, "")
        XCTAssertEqual(expenseViewModel.amount, "")
        XCTAssertEqual(expenseViewModel.date, Date())
    }
    
    func testSave() {
        let initialExpensesCount = expenseViewModel.expensesList.count
        expenseViewModel.name = "New Expense"
        expenseViewModel.amount = "50.0"
        expenseViewModel.date = Date()
        expenseViewModel.save()

        XCTAssertEqual(expenseViewModel.expensesList.count, initialExpensesCount + 1)
        XCTAssertEqual(expenseViewModel.expensesList.first?.name, "New Expense")
        XCTAssertEqual(expenseViewModel.expensesList.first?.amount, Decimal(string: "50.0"))
    }
}

