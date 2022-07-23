//
//  TransactionListController.swift
//  ASBInterviewExercise
//
//  Created by Mobile Dev on 23/07/2022.
//

import Foundation
import UIKit

class TransactionListController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variables
    var viewModel: TransactionsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
        configureTableView()
        initViewModel()
    }
    
    private func initUI() {
        title = "Transactions"
    }
    
    private func initViewModel() {
        viewModel.fetchTransaction()
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TransactionListCell.self, forCellReuseIdentifier: "TransactionListCell")
    }
}

extension TransactionListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.transactionsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TransactionListCell(style: .subtitle, reuseIdentifier: "TransactionListCell")
        cell.transactionViewModel = viewModel.getCellViewModel(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        viewModel.goToTransactionDetail(transaction: cellVM)
    }
}
