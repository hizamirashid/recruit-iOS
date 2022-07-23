//
//  TransactionViewModels.swift
//  ASBInterviewExercise
//
//  Created by Mobile Dev on 23/07/2022.
//

import Foundation

class TransactionsViewModel {
    
    weak var coordinator: AppCoordinator!
    private var transactionService: TransactionsServiceProtocol
    var reloadTableView: (() -> Void)?
    var transactionsViewModel = [TransactionViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    init(transactionService: TransactionsServiceProtocol) {
        self.transactionService = transactionService
    }
    
    func fetchTransaction() {
        transactionService.fetch { success, transactions, error in
            if success, let transactions = transactions {
                self.transactionsViewModel = transactions
            }
        }
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> TransactionViewModel {
        return transactionsViewModel[indexPath.row]
    }
    
    func goToTransactionDetail(transaction: TransactionViewModel) {
        coordinator.goToTransactionDetail(transaction: transaction)
    }
    
}
