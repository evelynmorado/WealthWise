//
//  ExpenseTrackerAppTests.swift
//  ExpenseTrackerAppTests
//
//  Created by Evelyn Morado on 1/3/24.
//

import XCTest
@testable import ExpenseTracker

final class ExpenseTrackerAppTests: XCTestCase {
    
    var expenseViewModel: ExpenseViewModel!

    override func setUpWithError() throws {
        expenseViewModel = ExpenseViewModel()
    }

    override func tearDownWithError() throws {
        expenseViewModel = nil
    }

    func testExpenseViewModelInitialization() throws {
        // Test that the ExpenseViewModel is initialized correctly
        XCTAssertNotNil(expenseViewModel)
        XCTAssertEqual(expenseViewModel.expenseslist.count, 0)
    }
    

    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
