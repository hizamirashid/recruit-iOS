//
//  TransactionDetailController.swift
//  ASBInterviewExercise
//
//  Created by Mobile Dev on 23/07/2022.
//

import Foundation
import UIKit

class TransactionDetailController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var transactionDateLbl: UILabel!
    @IBOutlet weak var summaryLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var gstLbl: UILabel!
    
    // MARK: Variables
    var viewModel: TransactionViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionDateLbl.text = viewModel.transaction.getDate()
        summaryLbl.text = viewModel.transaction.summary
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let amount = viewModel.transaction.getAmount()
        amountLbl.text = formatter.string(from: NSNumber(value: amount))
        amountLbl.textColor = amount > 0 ? .systemGreen : .systemRed
        let gst = viewModel.transaction.getGST()
        gstLbl.text =  "GST: \(formatter.string(from: NSNumber(value: gst)) ?? gst.description)"
    }
}
