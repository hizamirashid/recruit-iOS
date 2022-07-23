//
//  ASBInterviewExerciseTests.swift
//  ASBInterviewExerciseTests
//
//  Created by ASB on 29/07/21.
//

import XCTest
@testable import ASBInterviewExercise

class ASBInterviewExerciseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTransactionAmount() {
        let transactionVM = TransactionViewModel(transaction: Transaction(id: 0, transactionDate: "2021-12-15T12:43:46", summary: "Hizami Rashid", debit: 0, credit: 100))
        
        let amount = transactionVM.transaction.credit - transactionVM.transaction.debit
        XCTAssertEqual(transactionVM.transaction.getAmount(), amount)
    }
    
    func testTransactionGST() {
        let transactionVM = TransactionViewModel(transaction: Transaction(id: 0, transactionDate: "2021-12-15T12:43:46", summary: "Hizami Rashid", debit: 0, credit: 100))
        
        let gst = transactionVM.transaction.getAmount() * 0.15
        XCTAssertEqual(transactionVM.transaction.getGST(), gst)
    }
    
    func testDateFormat() {
        let transactionVM = TransactionViewModel(transaction: Transaction(id: 0, transactionDate: "2021-12-15T12:43:46", summary: "Hizami Rashid", debit: 0, credit: 100))
        
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let date = formatter.date(from: transactionVM.transaction.transactionDate) else {
            return
        }
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        formatter.locale = .current
         
        let transactionDate = formatter.string(from: date)
        XCTAssertEqual(transactionVM.transaction.getDate(), transactionDate)
    }
    
    func testAmountColor() {
        let transactionVM = TransactionViewModel(transaction: Transaction(id: 0, transactionDate: "2021-12-15T12:43:46", summary: "Hizami Rashid", debit: 0, credit: 100))
        
        let amount = transactionVM.transaction.credit - transactionVM.transaction.debit
        XCTAssertEqual(amount > 0 ? UIColor.systemGreen : UIColor.systemRed, UIColor.systemGreen)
    }

}
