//
//  TransactionService.swift
//  ASBInterviewExercise
//
//  Created by Mobile Dev on 23/07/2022.
//

import Foundation

protocol TransactionsServiceProtocol {
    func fetch(completion: @escaping (_ success: Bool, _ results: [TransactionViewModel]?, _ error: String?) -> Void)
}

class TransactionsService: TransactionsServiceProtocol {
    func fetch(completion: @escaping (Bool, [TransactionViewModel]?, String?) -> Void) {
        let restClient = DIManager.shared.resolve(RestClient.self)
        restClient?.request(url: Constants.transactionURLString, expecting: [Transaction].self) { result in
            
            switch result {
            case .success(let transactions):
                DispatchQueue.main.async {
                    // sort transaction array by transactionDate
                    let sortedTransactions = transactions.sorted { $0.transactionDate > $1.transactionDate }
                    
                    // map array to TransactionViewModels
                    let transactionViewModels = sortedTransactions.map({ return TransactionViewModel(transaction: $0) })
                    completion(true, transactionViewModels, nil)
                
                }
            case .failure(let error):
                print(error)
                completion(false, nil, error.localizedDescription)
            }
            
        }
    }
}
