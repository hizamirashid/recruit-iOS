//
//  TransactionListCell.swift
//  ASBInterviewExercise
//
//  Created by Mobile Dev on 23/07/2022.
//

import Foundation
import UIKit

class TransactionListCell: UITableViewCell {
    
    var transactionViewModel: TransactionViewModel! {
        didSet {
            textLabel?.text = transactionViewModel.transaction.summary
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            let amount = transactionViewModel.transaction.getAmount()
            detailTextLabel?.text = formatter.string(from: NSNumber(value: amount))
            detailTextLabel?.textColor = amount > 0 ? .systemGreen : .systemRed
            
            accessoryType = .disclosureIndicator
        }
    }
}
