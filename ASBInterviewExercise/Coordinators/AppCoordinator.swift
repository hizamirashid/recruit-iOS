//
//  AppCoordinator.swift
//  ASBInterviewExercise
//
//  Created by Mobile Dev on 23/07/2022.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        // The first time this coordinator started is to launch the table transaction
        goToTransactionList()
    }
    
    func goToTransactionList() {
        
        // Instantiate TransactionListTableView
        guard let transactionListVC = storyboard.instantiateViewController(withIdentifier: "TransactionListController") as? TransactionListController else { return }
        
        // Instantiate TransactionViewModel
        guard let transactionService = DIManager.shared.resolve(TransactionsService.self) else { return }
        let transactionViewModel = TransactionsViewModel(transactionService: transactionService)
        
        // Set the Coordinator to the ViewModel
        transactionViewModel.coordinator = self
        
        // Set the ViewModel to ViewController
        transactionListVC.viewModel = transactionViewModel
        
        // Push it
        navigationController.pushViewController(transactionListVC, animated: false)
    }
    
    func goToTransactionDetail(transaction: TransactionViewModel) {
        
        // Instantiate TransactionListTableView
        guard let transactionDetailVC = storyboard.instantiateViewController(withIdentifier: "TransactionDetailController") as? TransactionDetailController else { return }
        
        // Instantiate TransactionViewModel
        let transactionDetailViewModel = transaction
        
        // Set the Coordinator to the ViewModel
        transactionDetailViewModel.coordinator = self
        
        // Set the ViewModel to ViewController
        transactionDetailVC.viewModel = transactionDetailViewModel
        
        // Present
        navigationController.present(transactionDetailVC, animated: true, completion: nil)
    }
}
