//
//  TransactionViewModel.swift
//  ASBInterviewExercise
//
//  Created by Mobile Dev on 23/07/2022.
//

import Foundation

class TransactionViewModel {
    
    weak var coordinator: AppCoordinator!
    let transaction: Transaction!
    
    init(transaction: Transaction) {
        self.transaction = transaction
    }
}
