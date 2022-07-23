//
//  Transaction.swift
//  ASBInterviewExercise
//
//  Created by Mobile Dev on 23/07/2022.
//

import Foundation

struct Transaction: Codable {
    
    let id: Int
    let transactionDate, summary: String
    let debit, credit: Double
    
    func getAmount() -> Double {
        return credit - debit
    }
    
    func getGST() -> Double {
        return abs(getAmount() * 0.15) // to make value to always become positive
    }
    
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let date = formatter.date(from: transactionDate) else {
            return transactionDate
        }
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        formatter.locale = .current
        
        return formatter.string(from: date)
    }
}
