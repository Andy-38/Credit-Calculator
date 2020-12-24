//
//  BalanceViewController.swift
//  Credit Calculator
//
//  Created by Андрей Двойцов on 22.12.2020.
//

import UIKit

class BalanceViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var balanceLabel: UILabel!
    
    // MARK: - Properties
    var balance = 0 {
        didSet {
            balanceLabel.text = "\(balance) ₽"
        }
    }
    
    // MARK: - Methods
    override func viewDidLoad() {
        // вызывается при запуске приложения
        super.viewDidLoad()
        //updateBalance()
    }

    override func viewWillAppear(_ animated: Bool) {
        // вызывается при показе этого экрана
        super.viewWillAppear(animated)
        updateBalance()
    }
    
    func updateBalance() {
        balance = Int.random(in: 0 ... 1_000_000)
        // можно просто 1000000 без подчеркиваний, они для удобства
    }

}

